import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_task_app/features/weather/domain/models/weather.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/get_current_and_whole_day_weather_forecast_use_case.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_state.dart';
import 'package:weather_task_app/services/injection_service/injection_service.dart';

@injectable
class WeatherForecastCubit extends Cubit<WeatherForecastState> {
  WeatherForecastCubit() : super(WeatherForecastState.initial());

  void loadForecast() async {
    emit(state.copyWith(status: WeatherForecastPageStatus.loading));

    final result =
        await getIt<GetCurrentAndWholeDayWeatherForecastUseCase>().call();

    result.fold(
      (_) {
        emit(state.copyWith(status: WeatherForecastPageStatus.error));
      },
      (WeatherForecast weatherForecast) {
        _emitNextTwelveHoursForecast(weatherForecast);
      },
    );
  }

  void _emitNextTwelveHoursForecast(WeatherForecast weatherForecast) {
    final List<ForecastDay> forecastsByDay =
        weatherForecast.forecast.forecastDay;

    List<Weather> weatherForNextThreeDays =
        getWeatherForNextThreeDays(forecastsByDay: forecastsByDay);

    final DateTime currentTime =
        parseWeatherDate(weatherForecast.location.localTime);

    final Weather? tomorrowForecast = getForecastForTomorrow(
      weatherForNextThreeDays: weatherForNextThreeDays,
      currentTime: currentTime,
    );

    final List<Weather> forecastForNextTwelveHoursForToday =
        getForecastForNextTwelveHours(
      weatherForNextThreeDays: weatherForNextThreeDays,
      currentTime: currentTime,
    );

    final List<Weather> forecastForNextTwelveHoursForTomorrow =
        getForecastForNextTwelveHours(
      weatherForNextThreeDays: weatherForNextThreeDays,
      currentTime: parseWeatherDate(tomorrowForecast?.date),
    );

    emit(
      state.copyWith(
        weatherForecast: weatherForecast,
        todayTabState: WeatherForecastTabState(
          dayForecast: weatherForecast.current,
          forecastForNextTwelveHours: forecastForNextTwelveHoursForToday,
        ),
        tomorrowTabState: WeatherForecastTabState(
          dayForecast: tomorrowForecast,
          forecastForNextTwelveHours: forecastForNextTwelveHoursForTomorrow,
        ),
        status: WeatherForecastPageStatus.loaded,
      ),
    );
  }

  @visibleForTesting
  List<Weather> getWeatherForNextThreeDays({
    required List<ForecastDay> forecastsByDay,
  }) {
    List<Weather> weatherForTwoDays = List.empty(growable: true);

    for (int i = 0; i < forecastsByDay.length; i++) {
      weatherForTwoDays.insertAll(
        weatherForTwoDays.length,
        forecastsByDay[i].forecast,
      );
    }

    return weatherForTwoDays;
  }

  @visibleForTesting
  Weather? getForecastForTomorrow({
    required List<Weather> weatherForNextThreeDays,
    required DateTime currentTime,
  }) {
    return weatherForNextThreeDays.firstWhereOrNull((weather) =>
        parseWeatherDate(weather.date).hour == currentTime.hour &&
        (weather != state.weatherForecast?.current &&
            parseWeatherDate(weather.date).day != currentTime.day));
  }

  @visibleForTesting
  List<Weather> getForecastForNextTwelveHours({
    required List<Weather> weatherForNextThreeDays,
    required DateTime currentTime,
  }) {
    return weatherForNextThreeDays
        .where((weather) {
          final DateTime weatherDate = parseWeatherDate(weather.date);
          return weatherDate.isAfter(currentTime) &&
              weatherDate.difference(currentTime).inHours <= 12;
        })
        .take(12)
        .toList();
  }

  @visibleForTesting
  DateTime parseWeatherDate(String? date) =>
      DateTime.tryParse(date ?? '') ?? DateTime.now();
}
