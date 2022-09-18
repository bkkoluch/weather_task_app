import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_task_app/core/endpoints/endpoints.dart';
import 'package:weather_task_app/core/errors/exceptions.dart';
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/services/network_service/network_service.dart';

@Injectable(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final NetworkService _networkService;

  const WeatherRemoteDataSourceImpl(this._networkService);

  static const String _daysField = 'days';
  static const String _qField = 'q';

  @override
  Future<WeatherForecast> getCurrentAndWholeDayWeatherForecast({
    required int days,
    required String city,
  }) async {
    try {
      final result = await _networkService.get(
        url: Endpoints.forecast,
        queryParameters: {
          _daysField: days,
          _qField: city,
        },
      );

      final WeatherForecast weatherForecast =
          WeatherForecast.fromJson(result.data);

      return weatherForecast;
    } on DioError catch (e) {
      throw ServerException(e.toString());
    }
  }
}
