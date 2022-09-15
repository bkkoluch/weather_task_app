import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_location.freezed.dart';
part 'weather_location.g.dart';

@freezed
class WeatherLocation with _$WeatherLocation {
  const WeatherLocation._();

  const factory WeatherLocation({
    required String name,
    required String region,
    required String country,
    @JsonKey(name: 'localtime') required String localTime,
  }) = _WeatherLocation;

  factory WeatherLocation.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocationFromJson(json);
}
