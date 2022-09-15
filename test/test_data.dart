import 'package:dio/dio.dart';
import 'package:weather_task_app/core/errors/exceptions.dart';
import 'package:weather_task_app/core/errors/failures.dart';
import 'package:weather_task_app/features/weather/domain/models/weather.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_condition.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';

import 'test_json_data.dart';

// Weather
const WeatherForecast tWeatherForecast =
    WeatherForecast(current: tWeather, forecast: tForecast);

final WeatherForecast tWeatherForecastFromJSON =
    WeatherForecast.fromJson(tWeatherForecastJSON);

const Forecast tForecast = Forecast(forecastDay: [tForecastDay]);

const ForecastDay tForecastDay = ForecastDay(forecast: [tWeather, tWeather]);

const Weather tWeather = Weather(
  temperatureC: 12,
  condition: tWeatherCondition,
  maxWindSpeedKm: 12.5,
  cloudCover: 50,
);

const WeatherCondition tWeatherCondition =
    WeatherCondition(text: 'Cloudy', icon: 'icon');

final RequestOptions tRequestOptions = RequestOptions(path: 'path');

// Miscellaneous
const ServerException tServerException = ServerException('ServerException');
const ServerFailure tServerFailure = ServerFailure('ServerFailure');
