import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:weather_task_app/core/domain/use_case.dart';
import 'package:weather_task_app/core/logger.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/services/injection_service/injection_service.dart';
import 'package:weather_task_app/services/notification_service/notification_service.dart';

@injectable
class IfNeededScheduleItWillRainNotificationUseCase
    implements UseCase<Future<void>, WeatherForecast> {
  IfNeededScheduleItWillRainNotificationUseCase();

  @override
  Future<void> call(WeatherForecast forecast) => scheduleNotificationIfNeeded(
        weatherForecast: forecast,
        now: DateTime.now(),
      );

  @visibleForTesting
  Future<void> scheduleNotificationIfNeeded({
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
    // If it's before 8 o'clock, check if notification should be scheduled for today
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
            forecast.dayForecast.willItRain) !=
        null;
  }

  @visibleForTesting
  Future<void> scheduleNotificationFor8AM({
    required DateTime now,
    bool scheduleForToday = true,
  }) async {
    final int dayIncrementer = scheduleForToday ? 0 : 1;

    final DateTime tomorrowTimeToShowNotification = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day + dayIncrementer,
      8,
    );

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
