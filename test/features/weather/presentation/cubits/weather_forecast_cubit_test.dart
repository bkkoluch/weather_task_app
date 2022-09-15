import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/get_current_and_whole_day_weather_forecast_use_case.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_cubit.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_state.dart';
import 'package:weather_task_app/services/injection_service/injection_service.dart';

import '../../../../mocks.dart';
import '../../../../test_data.dart';

void main() {
  final GetCurrentAndWholeDayWeatherForecastUseCase useCase =
      MockGetCurrentAndWholeDayWeatherForecastUseCase();

  WeatherForecastCubit buildCubit() => WeatherForecastCubit();

  WeatherForecastState initialState = WeatherForecastState.initial();

  setUpAll(() {
    getIt.registerFactory<GetCurrentAndWholeDayWeatherForecastUseCase>(
      () => useCase,
    );
  });

  group('WeatherForecastCubit', () {
    group('loadForecast', () {
      blocTest<WeatherForecastCubit, WeatherForecastState>(
        'should emit WeatherForecastPageStatus.loaded with weather forecast on'
        'a successful call',
        setUp: () {
          when(() => useCase.call()).thenAnswer(
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
          ),
        ],
        verify: (_) => [verify(() => useCase.call()).called(1)],
      );

      blocTest<WeatherForecastCubit, WeatherForecastState>(
        'should emit WeatherForecastPageStatus.error on unsuccessful call',
        setUp: () {
          when(() => useCase.call()).thenAnswer(
            (_) async => const Left(tServerFailure),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.loadForecast(),
        expect: () => [
          initialState.copyWith(status: WeatherForecastPageStatus.loading),
          initialState.copyWith(status: WeatherForecastPageStatus.error),
        ],
        verify: (_) => [verify(() => useCase.call()).called(1)],
      );
    });
  });
}
