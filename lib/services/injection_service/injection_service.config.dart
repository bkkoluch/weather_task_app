// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source.dart'
    as _i9;
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source_impl.dart'
    as _i10;
import 'package:weather_task_app/features/weather/data/repositories/weather_repository_impl.dart'
    as _i12;
import 'package:weather_task_app/features/weather/domain/repositories/weather_repository.dart'
    as _i11;
import 'package:weather_task_app/features/weather/domain/use_cases/get_current_and_future_days_forecast_use_case.dart'
    as _i13;
import 'package:weather_task_app/features/weather/domain/use_cases/if_needed_schedule_it_will_rain_notification_use_case.dart'
    as _i3;
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_cubit.dart'
    as _i8;
import 'package:weather_task_app/services/network_service/network_service.dart'
    as _i4;
import 'package:weather_task_app/services/network_service/network_service_impl.dart'
    as _i5;
import 'package:weather_task_app/services/notification_service/notification_service.dart'
    as _i6;
import 'package:weather_task_app/services/notification_service/notification_service_impl.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.IfNeededScheduleItWillRainNotificationUseCase>(
      () => _i3.IfNeededScheduleItWillRainNotificationUseCase());
  gh.lazySingleton<_i4.NetworkService>(() => _i5.NetworkServiceImpl());
  gh.lazySingleton<_i6.NotificationService>(
      () => _i7.NotificationServiceImpl());
  gh.factory<_i8.WeatherForecastCubit>(() => _i8.WeatherForecastCubit());
  gh.factory<_i9.WeatherRemoteDataSource>(
      () => _i10.WeatherRemoteDataSourceImpl(get<_i4.NetworkService>()));
  gh.factory<_i11.WeatherRepository>(
      () => _i12.WeatherRepositoryImpl(get<_i9.WeatherRemoteDataSource>()));
  gh.factory<_i13.GetCurrentAndFutureDaysForecastUseCase>(() =>
      _i13.GetCurrentAndFutureDaysForecastUseCase(
          get<_i11.WeatherRepository>()));
  return get;
}
