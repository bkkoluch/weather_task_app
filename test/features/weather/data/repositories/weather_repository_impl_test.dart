import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_task_app/core/errors/failures.dart';
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_task_app/features/weather/data/repositories/weather_repository_impl.dart';

import '../../../../mocks.dart';
import '../../../../test_data.dart';

void main() {
  final WeatherRemoteDataSource weatherRemoteDataSource =
      MockWeatherRemoteDataSource();

  final WeatherRepositoryImpl weatherRepositoryImpl =
      WeatherRepositoryImpl(weatherRemoteDataSource);

  group('WeatherRepositoryImpl', () {
    group('getCurrentAndWholeDayWeatherForecast', () {
      test(
        'should return Right(WeatherForecast) for a successful call',
        () async {
          // Arrange
          when(
            () => weatherRemoteDataSource.getCurrentAndWholeDayWeatherForecast(
              days: any(named: 'days'),
              city: any(named: 'city'),
            ),
          ).thenAnswer((_) async => tWeatherForecast);

          // Act
          final result = await weatherRepositoryImpl
              .getCurrentAndFutureDaysForecast(days: tDays, city: tCity);

          // Assert
          expect(result, const Right(tWeatherForecast));
          verify(
            () => weatherRemoteDataSource.getCurrentAndWholeDayWeatherForecast(
              days: tDays,
              city: tCity,
            ),
          ).called(1);
        },
      );

      test(
        'should return Left(ServerFailure) on ServerException',
        () async {
          // Arrange
          when(
            () => weatherRemoteDataSource.getCurrentAndWholeDayWeatherForecast(
              days: any(named: 'days'),
              city: any(named: 'city'),
            ),
          ).thenThrow(tServerException);

          // Act
          final result = await weatherRepositoryImpl
              .getCurrentAndFutureDaysForecast(days: tDays, city: tCity);

          // Assert
          expect(
            result,
            const Left(ServerFailure('getCurrentAndWholeDayWeatherForecast')),
          );
          verify(
            () => weatherRemoteDataSource.getCurrentAndWholeDayWeatherForecast(
              days: tDays,
              city: tCity,
            ),
          ).called(1);
        },
      );
    });
  });
}
