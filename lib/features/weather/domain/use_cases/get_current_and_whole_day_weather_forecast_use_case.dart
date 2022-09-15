import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_task_app/core/domain/use_case.dart';
import 'package:weather_task_app/core/errors/failures.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/features/weather/domain/repositories/weather_repository.dart';

@injectable
class GetCurrentAndWholeDayWeatherForecastUseCase
    implements UseCase<Future<Either<Failure, WeatherForecast>>, NoParams?> {
  final WeatherRepository _weatherRepository;

  GetCurrentAndWholeDayWeatherForecastUseCase(this._weatherRepository);

  @override
  Future<Either<Failure, WeatherForecast>> call([NoParams? params]) =>
      _weatherRepository.getCurrentAndWholeDayWeatherForecast();
}
