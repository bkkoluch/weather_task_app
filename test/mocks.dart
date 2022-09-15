import 'package:mocktail/mocktail.dart';
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_task_app/services/network_service/network_service.dart';

class MockNetworkService extends Mock implements NetworkService {}

class MockWeatherRemoteDataSource extends Mock
    implements WeatherRemoteDataSource {}
