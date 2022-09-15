// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source.dart'
    as _i5;
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source_impl.dart'
    as _i6;
import 'package:weather_task_app/features/weather/data/repositories/weather_repository_impl.dart'
    as _i8;
import 'package:weather_task_app/features/weather/domain/repositories/weather_repository.dart'
    as _i7;
import 'package:weather_task_app/services/network_service/network_service.dart'
    as _i3;
import 'package:weather_task_app/services/network_service/network_service_impl.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i5.WeatherRemoteDataSource>(
      () => _i6.WeatherRemoteDataSourceImpl(get<_i3.NetworkService>()));
  gh.factory<_i7.WeatherRepository>(
      () => _i8.WeatherRepositoryImpl(get<_i5.WeatherRemoteDataSource>()));
  return get;
}
