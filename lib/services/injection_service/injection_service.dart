import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_task_app/services/injection_service/injection_service.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
)
Future<void> configureInjector() async => $initGetIt(getIt);
