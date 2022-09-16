import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_task_app/features/weather/domain/models/weather.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_location.dart';

part 'weather_forecast.freezed.dart';
part 'weather_forecast.g.dart';

@freezed
class WeatherForecast with _$WeatherForecast {
  const WeatherForecast._();

  const factory WeatherForecast({
    required WeatherLocation location,
    @JsonKey(name: 'current') required Weather current,
    @JsonKey(name: 'forecast') required Forecast forecast,
  }) = _WeatherForecast;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);
}

@freezed
class Forecast with _$Forecast {
  const Forecast._();

  const factory Forecast({
    @JsonKey(name: 'forecastday') required List<ForecastDay> forecastDays,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}

@freezed
class ForecastDay with _$ForecastDay {
  const ForecastDay._();

  const factory ForecastDay({
    required String date,
    @JsonKey(name: 'hour') required List<Weather> hourlyForecast,
    @JsonKey(name: 'day') required DayWeather dayForecast,
  }) = _ForecastDay;

  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);
}
