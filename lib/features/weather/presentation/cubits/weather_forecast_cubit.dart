import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_task_app/core/errors/failures.dart';
import 'package:weather_task_app/features/weather/domain/models/weather.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/get_current_and_future_days_forecast_use_case.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/if_needed_schedule_it_will_rain_notification_use_case.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_state.dart';
import 'package:weather_task_app/services/injection_service/injection_service.dart';

const int _defaultDaysToFetch = 3;
const String _defaultCityToFetchForecastFor = 'Warsaw';

@injectable
class WeatherForecastCubit extends Cubit<WeatherForecastState> {
  WeatherForecastCubit() : super(WeatherForecastState.initial());

  Future<void> loadForecast() async {
    emit(state.copyWith(status: WeatherForecastPageStatus.loading));

    final Either<Failure, WeatherForecast> result =
        await getIt<GetCurrentAndFutureDaysForecastUseCase>().call(
      const GetCurrentAndFutureDaysForecastUseCaseParams(
        days: _defaultDaysToFetch,
        city: _defaultCityToFetchForecastFor,
      ),
    );

    result.fold(
      (_) {
        emit(state.copyWith(status: WeatherForecastPageStatus.error));
      },
      (WeatherForecast weatherForecast) async {
        await _emitFutureForecastAndScheduleNotificationIfNeeded(
          weatherForecast,
        );
      },
    );
  }

  Future<void> _emitFutureForecastAndScheduleNotificationIfNeeded(
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
    await getIt<IfNeededScheduleItWillRainNotificationUseCase>()
        .call(weatherForecast);
  }

  @visibleForTesting
  List<Weather> getWeatherForNextThreeDays({
    required List<ForecastDay> forecastsByDay,
  }) {
    List<Weather> weatherForTwoDays = List.empty(growable: true);

    for (final ForecastDay forecastDay in forecastsByDay) {
      weatherForTwoDays.insertAll(
        weatherForTwoDays.length,
        forecastDay.hourlyForecast,
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
}
