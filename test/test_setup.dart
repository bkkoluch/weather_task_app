import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import 'test_data.dart';

void baseSetup() {
  registerFallbackValue(tDuration);
  registerFallbackValue(tUseCaseParams);
  registerFallbackValue(tWeatherForecast);
  tz.initializeTimeZones();
}

Widget prepareWidget({required Widget child}) {
  return MaterialApp(
    home: child,
  );
}
