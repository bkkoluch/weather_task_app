import 'package:mocktail/mocktail.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'test_data.dart';

void baseSetup() {
  registerFallbackValue(tDuration);
  tz.initializeTimeZones();
}
