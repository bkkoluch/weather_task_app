import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:weather_task_app/core/logger.dart';
import 'package:weather_task_app/features/weather/domain/models/weather.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/get_current_and_whole_day_weather_forecast_use_case.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_state.dart';
import 'package:weather_task_app/services/injection_service/injection_service.dart';
import 'package:weather_task_app/services/notification_service/notification_service.dart';

@injectable
class WeatherForecastCubit extends Cubit<WeatherForecastState> {
  WeatherForecastCubit() : super(WeatherForecastState.initial());

  Future<void> loadForecast() async {
    emit(state.copyWith(status: WeatherForecastPageStatus.loading));

    final result =
        await getIt<GetCurrentAndWholeDayWeatherForecastUseCase>().call();

    result.fold(
      (_) {
        emit(state.copyWith(status: WeatherForecastPageStatus.error));
      },
      (WeatherForecast weatherForecast) async {
        await _emitNextTwelveHoursForecast(weatherForecast);
      },
    );
  }

  Future<void> _emitNextTwelveHoursForecast(
      WeatherForecast weatherForecast) async {
    final List<ForecastDay> forecastsByDay =
        weatherForecast.forecast.forecastDays;

    List<Weather> weatherForNextThreeDays =
        getWeatherForNextThreeDays(forecastsByDay: forecastsByDay);

    final DateTime currentTime =
        parseWeatherDate(weatherForecast.location.localTime);

    final Weather? tomorrowForecast = getForecastForTomorrow(
      weatherForNextThreeDays: weatherForNextThreeDays,
      currentTime: currentTime,
    );

    final List<Weather> forecastForNextTwelveHoursForToday =
        getForecastForNextTwelveHours(
      weatherForNextThreeDays: weatherForNextThreeDays,
      currentTime: currentTime,
    );

    final List<Weather> forecastForNextTwelveHoursForTomorrow =
        getForecastForNextTwelveHours(
      weatherForNextThreeDays: weatherForNextThreeDays,
      currentTime: parseWeatherDate(tomorrowForecast?.date),
    );

    emit(
      state.copyWith(
        weatherForecast: weatherForecast,
        todayTabState: WeatherForecastTabState(
          dayForecast: weatherForecast.current,
          forecastForNextTwelveHours: forecastForNextTwelveHoursForToday,
        ),
        tomorrowTabState: WeatherForecastTabState(
          dayForecast: tomorrowForecast,
          forecastForNextTwelveHours: forecastForNextTwelveHoursForTomorrow,
        ),
        status: WeatherForecastPageStatus.loaded,
      ),
    );

    // This is a simpler approach to a notification requirement mentioned in the task,
    // as the development for a more sophisticated feature would take significantly more time
    // and the requirement was to implement a 'simple' app, I'm going to explain
    // as I would approach implementing that 'more properly' on a bigger scale:

    // Firstly, I would fetch data for bigger time range (for example 10 days),
    // then I would check for each of the days if it would rain during that day,
    // I would clear old notifications (if there were scheduled any, so they would not be displayed),
    // then I would schedule a notification for each of those days (on which it will rain)
    // for 8 o'clock.

    // And not to run that task only on app launch, I could make use of
    // a package to run it periodically using for example https://pub.dev/packages/workmanager
    // to schedule those checks periodically
    await scheduleNotificationsIfNeeded(
      weatherForecast: weatherForecast,
      now: DateTime.now(),
    );
  }

  @visibleForTesting
  List<Weather> getWeatherForNextThreeDays({
    required List<ForecastDay> forecastsByDay,
  }) {
    List<Weather> weatherForTwoDays = List.empty(growable: true);

    for (int i = 0; i < forecastsByDay.length; i++) {
      weatherForTwoDays.insertAll(
        weatherForTwoDays.length,
        forecastsByDay[i].hourlyForecast,
      );
    }

    return weatherForTwoDays;
  }

  @visibleForTesting
  Weather? getForecastForTomorrow({
    required List<Weather> weatherForNextThreeDays,
    required DateTime currentTime,
  }) {
    return weatherForNextThreeDays.firstWhereOrNull((weather) =>
        parseWeatherDate(weather.date).hour == currentTime.hour &&
        (weather != state.weatherForecast?.current &&
            parseWeatherDate(weather.date).day != currentTime.day));
  }

  @visibleForTesting
  List<Weather> getForecastForNextTwelveHours({
    required List<Weather> weatherForNextThreeDays,
    required DateTime currentTime,
  }) {
    return weatherForNextThreeDays
        .where((weather) {
          final DateTime weatherDate = parseWeatherDate(weather.date);
          return weatherDate.isAfter(currentTime) &&
              weatherDate.difference(currentTime).inHours <= 12;
        })
        .take(12)
        .toList();
  }

  @visibleForTesting
  DateTime parseWeatherDate(String? date) =>
      DateTime.tryParse(date ?? '') ?? DateTime.now();

  @visibleForTesting
  Future<void> scheduleNotificationsIfNeeded({
    required WeatherForecast weatherForecast,
    required DateTime now,
  }) async {
    // If it's after 8 o'clock, check if notification should be scheduled for tomorrow
    if (now.hour > 8) {
      bool willItRainTomorrow = checkIfItWillRain(
        weatherForecast: weatherForecast,
        now: now,
        checkForToday: false,
      );

      if (willItRainTomorrow) {
        await scheduleNotificationFor8AM(now: now, scheduleForToday: false);
      } else {
        await getIt<NotificationService>().clearScheduledNotification();
      }
    }
    // If before 8 o'clock, check if notification should be scheduled for today
    else {
      bool willItRainToday = checkIfItWillRain(
        weatherForecast: weatherForecast,
        now: now,
      );

      if (willItRainToday) {
        await scheduleNotificationFor8AM(now: now);
      } else {
        await getIt<NotificationService>().clearScheduledNotification();
      }
    }
  }

  @visibleForTesting
  bool checkIfItWillRain({
    required WeatherForecast weatherForecast,
    required DateTime now,
    bool checkForToday = true,
  }) {
    final int dayIncrementer = checkForToday ? 0 : 1;
    final List<ForecastDay> dayForecastList =
        weatherForecast.forecast.forecastDays;

    return dayForecastList.firstWhereOrNull((forecast) =>
            DateTime.tryParse(forecast.date)?.day == now.day + dayIncrementer &&
                forecast.dayForecast.willItRain &&
                dayForecastList.indexOf(forecast) == 0 ||
            dayForecastList.indexOf(forecast) == 1) !=
        null;
  }

  @visibleForTesting
  Future<void> scheduleNotificationFor8AM({
    required DateTime now,
    bool scheduleForToday = true,
  }) async {
    final int dayIncrementer = scheduleForToday ? 0 : 1;

    final DateTime tomorrowTimeToShowNotification = tz.TZDateTime(
        tz.local, now.year, now.month, now.day + dayIncrementer, 8);

    await scheduleNotificationForProvidedTime(
      timeToScheduleNotificationFor: tomorrowTimeToShowNotification,
    );
  }

  @visibleForTesting
  Future<void> scheduleNotificationForProvidedTime({
    required DateTime timeToScheduleNotificationFor,
  }) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    final int dateTimeDifferenceInMinutes =
        timeToScheduleNotificationFor.difference(now).inMinutes;

    final Duration durationToScheduleTheNotificationFor =
        Duration(minutes: dateTimeDifferenceInMinutes);

    Log.logInfo('Scheduled notification for $timeToScheduleNotificationFor');

    await getIt<NotificationService>().scheduleNotification(
      durationToScheduleTheNotificationFor:
          durationToScheduleTheNotificationFor,
    );
  }
}
