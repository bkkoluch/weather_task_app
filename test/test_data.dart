import 'package:dio/dio.dart';
import 'package:weather_task_app/core/errors/exceptions.dart';
import 'package:weather_task_app/core/errors/failures.dart';
import 'package:weather_task_app/features/weather/domain/models/weather.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_condition.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_location.dart';

import 'test_json_data.dart';

// Weather
const WeatherForecast tWeatherForecast = WeatherForecast(
  current: tWeather,
  forecast: tForecast,
  location: tWeatherLocation,
);

final WeatherForecast tWeatherForecastFromJSON =
    WeatherForecast.fromJson(tWeatherForecastJSON);

const Forecast tForecast = Forecast(forecastDay: [tForecastDay]);

const WeatherLocation tWeatherLocation = WeatherLocation(
  name: '',
  region: '',
  country: '',
  localTime: '',
);

const ForecastDay tForecastDay = ForecastDay(forecast: [tWeather, tWeather]);

const Weather tWeather = Weather(
    temperatureC: 12,
    condition: tWeatherCondition,
    maxWindSpeedKm: 12.5,
    cloudCover: 50,
    date: tDateTimeString);

const Weather tTomorrowWeather = Weather(
  temperatureC: 13,
  condition: tWeatherCondition,
  maxWindSpeedKm: 13.5,
  cloudCover: 51,
  date: '2022-09-17 12:30',
);

final DateTime tCurrentTime = DateTime.parse(tDateTimeString);

const String tDateTimeString = '2022-09-16 12:30';

final Weather tNextHourWeather = tWeather.copyWith(date: '2022-09-16 13:30');
final Weather tNextTwoHoursWeather =
    tWeather.copyWith(date: '2022-09-16 14:30');

const WeatherCondition tWeatherCondition =
    WeatherCondition(text: 'Cloudy', icon: 'icon');

final RequestOptions tRequestOptions = RequestOptions(path: 'path');

// Miscellaneous
const ServerException tServerException = ServerException('ServerException');
const ServerFailure tServerFailure = ServerFailure('ServerFailure');
