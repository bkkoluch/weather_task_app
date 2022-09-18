import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_task_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/get_current_and_future_days_forecast_use_case.dart';

import '../../../../mocks.dart';
import '../../../../test_data.dart';

void main() {
  final WeatherRepository weatherRepository = MockWeatherRepository();

  final GetCurrentAndFutureDaysForecastUseCase useCase =
      GetCurrentAndFutureDaysForecastUseCase(weatherRepository);

  group('GetCurrentAndWholeDayWeatherForecastUseCase', () {
    test(
      'should return WeatherForecast if repository returns one',
      () async {
        // Arrange
        when(
          () => weatherRepository.getCurrentAndFutureDaysForecast(
            days: any(named: 'days'),
            city: any(named: 'city'),
          ),
        ).thenAnswer((_) async => const Right(tWeatherForecast));

        // Act
        final result = await useCase.call(tUseCaseParams);

        // Assert
        expect(result, const Right(tWeatherForecast));
        verify(() => weatherRepository.getCurrentAndFutureDaysForecast(
              days: tDays,
              city: tCity,
            )).called(1);
      },
    );

    test(
      'should return ServerFailure if repository returns one',
      () async {
        // Arrange
        when(
          () => weatherRepository.getCurrentAndFutureDaysForecast(
            days: any(named: 'days'),
            city: any(named: 'city'),
          ),
        ).thenAnswer((_) async => const Left(tServerFailure));

        // Act
        final result = await useCase.call(tUseCaseParams);

        // Assert
        expect(result, const Left(tServerFailure));
        verify(
          () => weatherRepository.getCurrentAndFutureDaysForecast(
            days: tDays,
            city: tCity,
          ),
        ).called(1);
      },
    );
  });
}
