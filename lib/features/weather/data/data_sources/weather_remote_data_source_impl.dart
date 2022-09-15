import 'package:injectable/injectable.dart';
import 'package:weather_task_app/core/endpoints/endpoints.dart';
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/services/network_service/network_service.dart';

@Injectable(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final NetworkService _networkService;

  const WeatherRemoteDataSourceImpl(this._networkService);

  @override
  Future<WeatherForecast?> getCurrentAndWholeDayWeatherForecast() async {
    try {
      final result = await _networkService.get(url: Endpoints.forecast);
      final WeatherForecast weatherForecast =
          WeatherForecast.fromJson(result.data);
      return weatherForecast;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
