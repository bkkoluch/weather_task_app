import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_task_app/core/domain/use_case.dart';
import 'package:weather_task_app/core/errors/failures.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/features/weather/domain/repositories/weather_repository.dart';

@injectable
class GetCurrentAndFutureDaysForecastUseCase
    implements
        UseCase<Future<Either<Failure, WeatherForecast>>,
            GetCurrentAndFutureDaysForecastUseCaseParams> {
  final WeatherRepository _weatherRepository;

  GetCurrentAndFutureDaysForecastUseCase(this._weatherRepository);

  @override
  Future<Either<Failure, WeatherForecast>> call(
          GetCurrentAndFutureDaysForecastUseCaseParams params) =>
      _weatherRepository.getCurrentAndFutureDaysForecast(
        days: params.days,
        city: params.city,
      );
}

class GetCurrentAndFutureDaysForecastUseCaseParams {
  final int days;
  final String city;

  const GetCurrentAndFutureDaysForecastUseCaseParams({
    required this.days,
    required this.city,
  });
}
