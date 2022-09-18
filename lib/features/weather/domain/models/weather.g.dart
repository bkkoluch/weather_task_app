// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$$_WeatherFromJson(Map<String, dynamic> json) => _$_Weather(
      date: json['time'] as String?,
      temperatureC: (json['temp_c'] as num).toDouble(),
      condition:
          WeatherCondition.fromJson(json['condition'] as Map<String, dynamic>),
      maxWindSpeedKm: (json['wind_kph'] as num).toDouble(),
      cloudCover: json['cloud'] as int,
    );

Map<String, dynamic> _$$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'time': instance.date,
      'temp_c': instance.temperatureC,
      'condition': instance.condition,
      'wind_kph': instance.maxWindSpeedKm,
      'cloud': instance.cloudCover,
    };

_$_DayWeather _$$_DayWeatherFromJson(Map<String, dynamic> json) =>
    _$_DayWeather(
      dailyChanceOfRain: json['daily_chance_of_rain'],
    );

Map<String, dynamic> _$$_DayWeatherToJson(_$_DayWeather instance) =>
    <String, dynamic>{
      'daily_chance_of_rain': instance.dailyChanceOfRain,
    };
