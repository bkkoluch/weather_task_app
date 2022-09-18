// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source.dart'
    as _i8;
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source_impl.dart'
    as _i9;
import 'package:weather_task_app/features/weather/data/repositories/weather_repository_impl.dart'
    as _i11;
import 'package:weather_task_app/features/weather/domain/repositories/weather_repository.dart'
    as _i10;
import 'package:weather_task_app/features/weather/domain/use_cases/get_current_and_future_days_forecast_use_case.dart'
    as _i12;
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_cubit.dart'
    as _i7;
import 'package:weather_task_app/services/network_service/network_service.dart'
    as _i3;
import 'package:weather_task_app/services/network_service/network_service_impl.dart'
    as _i4;
import 'package:weather_task_app/services/notification_service/notification_service.dart'
    as _i5;
import 'package:weather_task_app/services/notification_service/notification_service_impl.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.NetworkService>(() => _i4.NetworkServiceImpl());
  gh.lazySingleton<_i5.NotificationService>(
      () => _i6.NotificationServiceImpl());
  gh.factory<_i7.WeatherForecastCubit>(() => _i7.WeatherForecastCubit());
  gh.factory<_i8.WeatherRemoteDataSource>(
      () => _i9.WeatherRemoteDataSourceImpl(get<_i3.NetworkService>()));
  gh.factory<_i10.WeatherRepository>(
      () => _i11.WeatherRepositoryImpl(get<_i8.WeatherRemoteDataSource>()));
  gh.factory<_i12.GetCurrentAndFutureDaysForecastUseCase>(() =>
      _i12.GetCurrentAndFutureDaysForecastUseCase(
          get<_i10.WeatherRepository>()));
  return get;
}
