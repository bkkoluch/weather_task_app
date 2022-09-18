import 'package:mocktail/mocktail.dart';
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_task_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/get_current_and_future_days_forecast_use_case.dart';
import 'package:weather_task_app/features/weather/domain/use_cases/if_needed_schedule_it_will_rain_notification_use_case.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_cubit.dart';
import 'package:weather_task_app/services/network_service/network_service.dart';
import 'package:weather_task_app/services/notification_service/notification_service.dart';

// Services

class MockNetworkService extends Mock implements NetworkService {}

class MockNotificationService extends Mock implements NotificationService {}

// DataSources
class MockWeatherRemoteDataSource extends Mock
    implements WeatherRemoteDataSource {}

// Repositories

class MockWeatherRepository extends Mock implements WeatherRepository {}

// UseCases

class MockGetCurrentAndWholeDayWeatherForecastUseCase extends Mock
    implements GetCurrentAndFutureDaysForecastUseCase {}

class MockIfNeededScheduleItWillRainNotificationUseCase extends Mock
    implements IfNeededScheduleItWillRainNotificationUseCase {}

// Cubits

class MockWeatherForecastCubit extends Mock implements WeatherForecastCubit {}
