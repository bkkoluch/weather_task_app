import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
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
        emit(
          state.copyWith(
            status: WeatherForecastPageStatus.loaded,
            weatherForecast: weatherForecast,
          ),
        );
      },
    );
  }
}
