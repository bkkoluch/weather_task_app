import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_task_app/features/weather/domain/models/weather.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/get_current_and_future_days_forecast_use_case.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/if_needed_schedule_it_will_rain_notification_use_case.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_cubit.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_state.dart';
import 'package:weather_task_app/services/injection_service/injection_service.dart';

import '../../../../mocks.dart';
import '../../../../test_data.dart';
import '../../../../test_setup.dart';

void main() {
  final GetCurrentAndFutureDaysForecastUseCase
      getCurrentAndFutureDaysForecastUseCase =
      MockGetCurrentAndWholeDayWeatherForecastUseCase();

  final IfNeededScheduleItWillRainNotificationUseCase
      ifNeededScheduleItWillRainNotificationUseCase =
      MockIfNeededScheduleItWillRainNotificationUseCase();

  WeatherForecastCubit buildCubit() => WeatherForecastCubit();

  WeatherForecastState initialState = WeatherForecastState.initial();

  setUpAll(() {
    baseSetup();

    getIt
      ..registerFactory<GetCurrentAndFutureDaysForecastUseCase>(
        () => getCurrentAndFutureDaysForecastUseCase,
      )
      ..registerFactory<IfNeededScheduleItWillRainNotificationUseCase>(
        () => ifNeededScheduleItWillRainNotificationUseCase,
      );

    when(() => ifNeededScheduleItWillRainNotificationUseCase.call(captureAny()))
        .thenAnswer(
      (_) async {},
    );
  });

  group('WeatherForecastCubit', () {
    final WeatherForecastCubit cubit = buildCubit();

    group('loadForecast', () {
      final List<Weather> weatherForNextThreeDays =
          cubit.getWeatherForNextThreeDays(
              forecastsByDay: tWeatherForecast.forecast.forecastDays);
      final DateTime currentTime = DateTime.now();

      final Weather? tomorrowForecast = cubit.getForecastForTomorrow(
        weatherForNextThreeDays: weatherForNextThreeDays,
        currentTime: currentTime,
      );

      blocTest<WeatherForecastCubit, WeatherForecastState>(
        'should emit WeatherForecastPageStatus.loaded with weather forecast on'
        'a successful call',
        setUp: () {
          when(() => getCurrentAndFutureDaysForecastUseCase.call(captureAny()))
              .thenAnswer(
            (_) async => const Right(tWeatherForecast),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.loadForecast(),
        expect: () => [
          initialState.copyWith(status: WeatherForecastPageStatus.loading),
          initialState.copyWith(
            status: WeatherForecastPageStatus.loaded,
            weatherForecast: tWeatherForecast,
            todayTabState: WeatherForecastTabState(
              dayForecast: tWeatherForecast.current,
              forecastForNextTwelveHours: cubit.getForecastForNextTwelveHours(
                weatherForNextThreeDays: weatherForNextThreeDays,
                currentTime: currentTime,
              ),
            ),
            tomorrowTabState: WeatherForecastTabState(
              dayForecast: tomorrowForecast,
              forecastForNextTwelveHours: cubit.getForecastForNextTwelveHours(
                weatherForNextThreeDays: weatherForNextThreeDays,
                currentTime: cubit.parseWeatherDate(tomorrowForecast?.date),
              ),
            ),
          ),
        ],
        verify: (_) => [
          verify(() =>
                  getCurrentAndFutureDaysForecastUseCase.call(tUseCaseParams))
              .called(1),
        ],
      );

      blocTest<WeatherForecastCubit, WeatherForecastState>(
        'should emit WeatherForecastPageStatus.loaded with weather forecast on'
        'a successful call',
        setUp: () {
          when(() => getCurrentAndFutureDaysForecastUseCase.call(captureAny()))
              .thenAnswer(
            (_) async => Right(tWeatherForecast.copyWith()),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.loadForecast(),
        expect: () => [
          initialState.copyWith(status: WeatherForecastPageStatus.loading),
          initialState.copyWith(
            status: WeatherForecastPageStatus.loaded,
            weatherForecast: tWeatherForecast,
            todayTabState: WeatherForecastTabState(
              dayForecast: tWeatherForecast.current,
              forecastForNextTwelveHours: cubit.getForecastForNextTwelveHours(
                weatherForNextThreeDays: weatherForNextThreeDays,
                currentTime: currentTime,
              ),
            ),
            tomorrowTabState: WeatherForecastTabState(
              dayForecast: tomorrowForecast,
              forecastForNextTwelveHours: cubit.getForecastForNextTwelveHours(
                weatherForNextThreeDays: weatherForNextThreeDays,
                currentTime: cubit.parseWeatherDate(tomorrowForecast?.date),
              ),
            ),
          ),
        ],
        verify: (_) => [
          verify(() =>
                  getCurrentAndFutureDaysForecastUseCase.call(tUseCaseParams))
              .called(1),
        ],
      );

      blocTest<WeatherForecastCubit, WeatherForecastState>(
        'should emit WeatherForecastPageStatus.error on unsuccessful call',
        setUp: () {
          when(() => getCurrentAndFutureDaysForecastUseCase.call(captureAny()))
              .thenAnswer(
            (_) async => const Left(tServerFailure),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.loadForecast(),
        expect: () => [
          initialState.copyWith(status: WeatherForecastPageStatus.loading),
          initialState.copyWith(status: WeatherForecastPageStatus.error),
        ],
        verify: (_) => [
          verify(() =>
                  getCurrentAndFutureDaysForecastUseCase.call(tUseCaseParams))
              .called(1),
        ],
      );
    });

    group('getWeatherForNextTwoDays', () {
      test(
        'should return List<Weather> for provided List<ForecastDay>',
        () {
          // Act
          final result = cubit.getWeatherForNextThreeDays(
              forecastsByDay: tForecast.forecastDays);

          // Assert
          expect(result, [tWeather, tTomorrowWeather]);
        },
      );
    });

    group('getForecastForTomorrow', () {
      test(
        'should get forecast for tomorrow for provided weather list and current time',
        () {
          // Act
          final result = cubit.getForecastForTomorrow(
            weatherForNextThreeDays: [tWeather, tTomorrowWeather],
            currentTime: tCurrentTime,
          );

          // Assert
          expect(result, tTomorrowWeather);
        },
      );

      test(
        'should return null for empty weather list',
        () {
          // Act
          final result = cubit.getForecastForTomorrow(
            weatherForNextThreeDays: [],
            currentTime: tCurrentTime,
          );

          // Assert
          expect(result, null);
        },
      );

      test(
        'should return null for weather list not containing tomorrows weather',
        () {
          // Act
          final result = cubit.getForecastForTomorrow(
            weatherForNextThreeDays: [tWeather],
            currentTime: tCurrentTime,
          );

          // Assert
          expect(result, null);
        },
      );
    });

    group('getForecastForNextTwelveHours', () {
      test(
        'should return List<Weather> for next twelve hours',
        () {
          // Act
          final result = cubit.getForecastForNextTwelveHours(
            weatherForNextThreeDays: [
              tWeather,
              tNextHourWeather,
              tNextTwoHoursWeather,
              tTomorrowWeather,
            ],
            currentTime: tCurrentTime,
          );

          // Assert
          expect(
            result,
            [
              tNextHourWeather,
              tNextTwoHoursWeather,
            ],
          );
        },
      );
    });
  });
}
