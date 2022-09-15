import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_task_app/core/endpoints/endpoints.dart';
import 'package:weather_task_app/core/errors/exceptions.dart';
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source_impl.dart';
import 'package:weather_task_app/services/network_service/network_service.dart';

import '../../../../mocks.dart';
import '../../../../test_data.dart';
import '../../../../test_json_data.dart';

void main() {
  final NetworkService networkService = MockNetworkService();

  final WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl =
      WeatherRemoteDataSourceImpl(networkService);

  group('WeatherRemoteDataSourceImpl', () {
    group('getCurrentAndWholeDayWeatherForecast', () {
      test(
        'should return WeatherForecast on a successful call',
        () async {
          // Arrange
          when(() => networkService.get(url: any(named: 'url'))).thenAnswer(
            (_) async => Response(
              requestOptions: tRequestOptions,
              data: tWeatherForecastJSON,
            ),
          );

          // Act
          final result = await weatherRemoteDataSourceImpl
              .getCurrentAndWholeDayWeatherForecast();

          // Assert
          expect(result, tWeatherForecastFromJSON);
          verify(() => networkService.get(url: Endpoints.forecast)).called(1);
        },
      );

      test(
        'should throw ServerException on DioError',
        () async {
          // Arrange
          when(() => networkService.get(url: any(named: 'url')))
              .thenThrow(DioError(requestOptions: tRequestOptions));

          // Act
          final result = weatherRemoteDataSourceImpl
              .getCurrentAndWholeDayWeatherForecast();

          // Assert
          expect(result, throwsA(isA<ServerException>()));
          verify(() => networkService.get(url: Endpoints.forecast)).called(1);
        },
      );
    });
  });
}
