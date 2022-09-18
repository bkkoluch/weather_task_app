import 'package:dartz/dartz.dart';
import 'package:weather_task_app/core/errors/failures.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherForecast>> getCurrentAndFutureDaysForecast({
    required int days,
    required String city,
  });
}
