// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherLocation _$$_WeatherLocationFromJson(Map<String, dynamic> json) =>
    _$_WeatherLocation(
      name: json['name'] as String,
      region: json['region'] as String,
      country: json['country'] as String,
      localTime: json['localtime'] as String,
    );

Map<String, dynamic> _$$_WeatherLocationToJson(_$_WeatherLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'localtime': instance.localTime,
    };
