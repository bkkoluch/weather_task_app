import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_condition.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const Weather._();

  const factory Weather({
    @JsonKey(name: 'time') String? date,
    @JsonKey(name: 'temp_c') required double temperatureC,
    required WeatherCondition condition,
    @JsonKey(name: 'wind_kph') required double maxWindSpeedKm,
    @JsonKey(name: 'cloud') required int cloudCover,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
