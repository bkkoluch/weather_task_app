import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/if_needed_schedule_it_will_rain_notification_use_case.dart';
import 'package:weather_task_app/services/injection_service/injection_service.dart';
import 'package:weather_task_app/services/notification_service/notification_service.dart';

import '../../../../mocks.dart';
import '../../../../test_data.dart';
import '../../../../test_setup.dart';

void main() {
  final IfNeededScheduleItWillRainNotificationUseCase useCase =
      IfNeededScheduleItWillRainNotificationUseCase();

  final NotificationService notificationService = MockNotificationService();

  setUpAll(() {
    baseSetup();

    getIt.registerLazySingleton<NotificationService>(() => notificationService);

    when(() => getIt<NotificationService>().clearScheduledNotification())
        .thenAnswer((_) async {});

    when(() => getIt<NotificationService>().scheduleNotification(
            durationToScheduleTheNotificationFor:
                any(named: 'durationToScheduleTheNotificationFor')))
        .thenAnswer((_) async {});
  });

  group('IfNeededScheduleItWillRainNotificationUseCase', () {
    test(
      'should properly call the use case and clear the notification',
      () async {
        // Arrange
        when(() => getIt<NotificationService>().clearScheduledNotification())
            .thenAnswer((_) async {});

        // Act
        await useCase.call(tWeatherForecast);

        // Assert
        verify(() => getIt<NotificationService>().clearScheduledNotification())
            .called(1);
      },
    );

    group('scheduleNotificationsIfNeeded', () {
      test(
        'should properly schedule notification for today',
        () async {
          // Arrange
          when(() => getIt<NotificationService>().scheduleNotification(
                  durationToScheduleTheNotificationFor:
                      any(named: 'durationToScheduleTheNotificationFor')))
              .thenAnswer((_) async {});

          // Act
          await useCase.scheduleNotificationIfNeeded(
            weatherForecast: tWeatherForecast,
            now: tCurrentTimeBefore8AM,
          );

          // Assert
          verify(() => getIt<NotificationService>().scheduleNotification(
                  durationToScheduleTheNotificationFor:
                      any(named: 'durationToScheduleTheNotificationFor')))
              .called(1);
        },
      );

      test(
        'should properly clear notification for today',
        () async {
          // Arrange
          when(() => getIt<NotificationService>().scheduleNotification(
                  durationToScheduleTheNotificationFor:
                      any(named: 'durationToScheduleTheNotificationFor')))
              .thenAnswer((_) async {});

          // Act
          await useCase.scheduleNotificationIfNeeded(
            weatherForecast: tNoRainWeatherForecast,
            now: tCurrentTimeBefore8AM,
          );

          // Assert
          verify(() =>
                  getIt<NotificationService>().clearScheduledNotification())
              .called(1);
        },
      );

      test(
        'should properly schedule notification for tomorrow',
        () async {
          // Arrange
          when(() => getIt<NotificationService>().scheduleNotification(
                  durationToScheduleTheNotificationFor:
                      any(named: 'durationToScheduleTheNotificationFor')))
              .thenAnswer((_) async {});

          // Act
          await useCase.scheduleNotificationIfNeeded(
            weatherForecast: tMultipleDaysWeatherForecast,
            now: tCurrentTime,
          );

          // Assert
          verify(() => getIt<NotificationService>().scheduleNotification(
                  durationToScheduleTheNotificationFor:
                      any(named: 'durationToScheduleTheNotificationFor')))
              .called(1);
        },
      );

      test(
        'should properly clear notification for tomorrow',
        () async {
          // Arrange
          when(() => getIt<NotificationService>().scheduleNotification(
                  durationToScheduleTheNotificationFor:
                      any(named: 'durationToScheduleTheNotificationFor')))
              .thenAnswer((_) async {});

          // Act
          await useCase.scheduleNotificationIfNeeded(
            weatherForecast: tNoRainWeatherForecast,
            now: tCurrentTime,
          );

          // Assert
          verify(() =>
                  getIt<NotificationService>().clearScheduledNotification())
              .called(1);
        },
      );
    });

    group('checkIfItWillRain', () {
      test(
        'should return true` if it will rain today for checkForToday == true',
        () {
          // Act
          final result = useCase.checkIfItWillRain(
            weatherForecast: tWeatherForecast,
            now: tCurrentTime,
          );

          // Assert
          expect(result, isTrue);
        },
      );

      test(
        'should return false if it will not rain tomorrow for checkForToday == false',
        () {
          // Act
          final result = useCase.checkIfItWillRain(
            weatherForecast: tWeatherForecast,
            now: tCurrentTime,
            checkForToday: false,
          );

          // Assert
          expect(result, isFalse);
        },
      );
    });

    group('scheduleNotificationFor8AM', () {
      test(
        'should schedule a notification for scheduleForToday == true',
        () async {
          // Arrange
          when(() => getIt<NotificationService>().scheduleNotification(
                  durationToScheduleTheNotificationFor:
                      any(named: 'durationToScheduleTheNotificationFor')))
              .thenAnswer((_) async {});

          // Act
          await useCase.scheduleNotificationFor8AM(
            now: DateTime.now().add(tDuration),
          );

          // Assert
          verify(() => getIt<NotificationService>().scheduleNotification(
                  durationToScheduleTheNotificationFor:
                      any(named: 'durationToScheduleTheNotificationFor')))
              .called(1);
        },
      );

      test(
        'should schedule a notification for for scheduleForToday == false',
        () async {
          // Arrange
          when(() => getIt<NotificationService>().scheduleNotification(
                  durationToScheduleTheNotificationFor:
                      any(named: 'durationToScheduleTheNotificationFor')))
              .thenAnswer((_) async {});

          // Act
          await useCase.scheduleNotificationFor8AM(
            now: DateTime.now().add(tDuration),
            scheduleForToday: false,
          );

          // Assert
          verify(() => getIt<NotificationService>().scheduleNotification(
                  durationToScheduleTheNotificationFor:
                      any(named: 'durationToScheduleTheNotificationFor')))
              .called(1);
        },
      );
    });

    group('scheduleNotificationForProvidedTime', () {
      test(
        'should schedule a notification for provided time',
        () async {
          // Arrange
          when(() => getIt<NotificationService>().scheduleNotification(
                  durationToScheduleTheNotificationFor:
                      any(named: 'durationToScheduleTheNotificationFor')))
              .thenAnswer((_) async {});

          // Act
          await useCase.scheduleNotificationForProvidedTime(
              timeToScheduleNotificationFor: DateTime.now().add(tDuration));

          // Assert
          verify(() => getIt<NotificationService>().scheduleNotification(
                  durationToScheduleTheNotificationFor:
                      any(named: 'durationToScheduleTheNotificationFor')))
              .called(1);
        },
      );
    });
  });
}
