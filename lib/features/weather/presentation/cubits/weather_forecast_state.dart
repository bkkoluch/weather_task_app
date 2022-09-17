import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_task_app/features/weather/domain/models/weather.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';

part 'weather_forecast_state.freezed.dart';

enum WeatherForecastPageStatus {
  initial,
  loading,
  loaded,
  error,
}

@freezed
class WeatherForecastState with _$WeatherForecastState {
  const WeatherForecastState._();

  const factory WeatherForecastState({
    required WeatherForecastPageStatus status,
    WeatherForecast? weatherForecast,
    WeatherForecastTabState? todayTabState,
    WeatherForecastTabState? tomorrowTabState,
  }) = _WeatherForecastState;

  factory WeatherForecastState.initial() =>
      const WeatherForecastState(status: WeatherForecastPageStatus.initial);

  bool get isLoading => status == WeatherForecastPageStatus.loading;

  bool get isFullyLoaded =>
      todayTabState != null &&
      tomorrowTabState != null &&
      status == WeatherForecastPageStatus.loaded;

  bool get isError => status == WeatherForecastPageStatus.error;
}

@freezed
class WeatherForecastTabState with _$WeatherForecastTabState {
  const WeatherForecastTabState._();

  const factory WeatherForecastTabState({
    List<Weather>? forecastForNextTwelveHours,
    Weather? dayForecast,
  }) = _WeatherForecastTabState;
}
