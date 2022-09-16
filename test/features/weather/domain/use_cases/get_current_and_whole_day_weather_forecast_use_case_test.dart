import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_task_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/get_current_and_whole_day_weather_forecast_use_case.dart';

import '../../../../mocks.dart';
import '../../../../test_data.dart';

void main() {
  final WeatherRepository weatherRepository = MockWeatherRepository();

  final GetCurrentAndWholeDayWeatherForecastUseCase useCase =
      GetCurrentAndWholeDayWeatherForecastUseCase(weatherRepository);

  group('GetCurrentAndWholeDayWeatherForecastUseCase', () {
    test(
      'should return WeatherForecast if repository returns one',
      () async {
        // Arrange
        when(() => weatherRepository.getCurrentAndWholeDayWeatherForecast())
            .thenAnswer((_) async => const Right(tWeatherForecast));

        // Act
        final result = await useCase.call();

        // Assert
        expect(result, const Right(tWeatherForecast));
        verify(() => weatherRepository.getCurrentAndWholeDayWeatherForecast())
            .called(1);
      },
    );

    test(
      'should return ServerFailure if repository returns one',
      () async {
        // Arrange
        when(() => weatherRepository.getCurrentAndWholeDayWeatherForecast())
            .thenAnswer((_) async => const Left(tServerFailure));

        // Act
        final result = await useCase.call();

        // Assert
        expect(result, const Left(tServerFailure));
        verify(() => weatherRepository.getCurrentAndWholeDayWeatherForecast())
            .called(1);
      },
    );
  });
}
