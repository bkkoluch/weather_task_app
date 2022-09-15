import 'package:mocktail/mocktail.dart';
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_task_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/get_current_and_whole_day_weather_forecast_use_case.dart';
import 'package:weather_task_app/services/network_service/network_service.dart';

// Services

class MockNetworkService extends Mock implements NetworkService {}

// DataSources
class MockWeatherRemoteDataSource extends Mock
    implements WeatherRemoteDataSource {}

// Repositories

class MockWeatherRepository extends Mock implements WeatherRepository {}

// UseCases

class MockGetCurrentAndWholeDayWeatherForecastUseCase extends Mock
    implements GetCurrentAndWholeDayWeatherForecastUseCase {}
