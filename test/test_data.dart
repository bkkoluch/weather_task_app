import 'package:dio/dio.dart';
import 'package:weather_task_app/core/errors/exceptions.dart';
import 'package:weather_task_app/core/errors/failures.dart';
import 'package:weather_task_app/features/weather/domain/models/weather.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_condition.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_location.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/get_current_and_future_days_forecast_use_case.dart';

import 'test_json_data.dart';

// Weather
const WeatherForecast tWeatherForecast = WeatherForecast(
  current: tWeather,
  forecast: tForecast,
  location: tWeatherLocation,
);

final WeatherForecast tNoRainWeatherForecast = WeatherForecast(
  current: tWeather,
  forecast: tNoRainForecast,
  location: tWeatherLocation,
);

const WeatherForecast tMultipleDaysWeatherForecast = WeatherForecast(
  current: tWeather,
  forecast: tMultipleForecastDaysForecast,
  location: tWeatherLocation,
);

final WeatherForecast tWeatherForecastFromJSON =
    WeatherForecast.fromJson(tWeatherForecastJSON);

const Forecast tForecast = Forecast(forecastDays: [tForecastDay]);

const Forecast tMultipleForecastDaysForecast =
    Forecast(forecastDays: [tForecastDay, tTomorrowForecastDay]);

final Forecast tNoRainForecast = Forecast(forecastDays: [tNoRainForecastDay]);

const WeatherLocation tWeatherLocation = WeatherLocation(
  name: 'some location name',
  region: '',
  country: '',
  localTime: '',
);

const ForecastDay tForecastDay = ForecastDay(
  date: tDateTimeString,
  hourlyForecast: [tWeather, tTomorrowWeather],
  dayForecast: tDayWeather,
);

const ForecastDay tTomorrowForecastDay = ForecastDay(
  date: tNextDateTimeString,
  hourlyForecast: [tWeather, tTomorrowWeather],
  dayForecast: tDayWeather,
);

final ForecastDay tNoRainForecastDay = tForecastDay.copyWith(
    dayForecast: tDayWeather.copyWith(dailyChanceOfRain: 1));

const DayWeather tDayWeather = DayWeather(dailyChanceOfRain: 72);

const Weather tWeather = Weather(
  temperatureC: 12,
  condition: tWeatherCondition,
  maxWindSpeedKm: 12.5,
  cloudCover: 50,
  date: tDateTimeString,
);

const Weather tTomorrowWeather = Weather(
  temperatureC: 13,
  condition: tWeatherCondition,
  maxWindSpeedKm: 13.5,
  cloudCover: 51,
  date: tNextDateTimeString,
);

final DateTime tCurrentTime = DateTime.parse(tDateTimeString);
final DateTime tCurrentTimeBefore8AM = DateTime.parse(tDateTimeStringBefore8AM);

const String tDateTimeString = '2022-09-16 12:30';
const String tDateTimeStringBefore8AM = '2022-09-16 07:30';
const String tNextDateTimeString = '2022-09-17 12:30';

final Weather tNextHourWeather = tWeather.copyWith(date: '2022-09-16 13:30');
final Weather tNextTwoHoursWeather =
    tWeather.copyWith(date: '2022-09-16 14:30');

const WeatherCondition tWeatherCondition =
    WeatherCondition(text: 'Cloudy', icon: 'icon');

final RequestOptions tRequestOptions = RequestOptions(path: 'path');

// Miscellaneous
const ServerException tServerException = ServerException('ServerException');
const ServerFailure tServerFailure = ServerFailure('ServerFailure');

const Duration tDuration = Duration(seconds: 10);

const int tDays = 3;
const String tCity = 'Warsaw';

const GetCurrentAndFutureDaysForecastUseCaseParams tUseCaseParams =
    GetCurrentAndFutureDaysForecastUseCaseParams(days: tDays, city: tCity);
