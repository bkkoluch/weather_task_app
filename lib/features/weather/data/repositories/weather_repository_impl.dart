import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_task_app/core/errors/exceptions.dart';
import 'package:weather_task_app/core/errors/failures.dart';
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/features/weather/domain/repositories/weather_repository.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  const WeatherRepositoryImpl(this._weatherRemoteDataSource);

  @override
  Future<Either<Failure, WeatherForecast>> getCurrentAndFutureDaysForecast({
    required int days,
    required String city,
  }) async {
    try {
      final WeatherForecast weatherForecast =
          await _weatherRemoteDataSource.getCurrentAndWholeDayWeatherForecast(
        days: days,
        city: city,
      );
      return Right(weatherForecast);
    } on ServerException {
      return const Left(ServerFailure('getCurrentAndWholeDayWeatherForecast'));
    }
  }
}
