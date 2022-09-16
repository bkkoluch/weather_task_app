// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherForecast _$$_WeatherForecastFromJson(Map<String, dynamic> json) =>
    _$_WeatherForecast(
      location:
          WeatherLocation.fromJson(json['location'] as Map<String, dynamic>),
      current: Weather.fromJson(json['current'] as Map<String, dynamic>),
      forecast: Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WeatherForecastToJson(_$_WeatherForecast instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };

_$_Forecast _$$_ForecastFromJson(Map<String, dynamic> json) => _$_Forecast(
      forecastDays: (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ForecastToJson(_$_Forecast instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastDays,
    };

_$_ForecastDay _$$_ForecastDayFromJson(Map<String, dynamic> json) =>
    _$_ForecastDay(
      date: json['date'] as String,
      hourlyForecast: (json['hour'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      dayForecast: DayWeather.fromJson(json['day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ForecastDayToJson(_$_ForecastDay instance) =>
    <String, dynamic>{
      'date': instance.date,
      'hour': instance.hourlyForecast,
      'day': instance.dayForecast,
    };
