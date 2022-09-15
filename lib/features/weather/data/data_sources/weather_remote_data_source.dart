import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherForecast> getCurrentAndWholeDayWeatherForecast();
}
