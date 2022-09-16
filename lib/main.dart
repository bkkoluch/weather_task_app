import 'package:flutter/material.dart';
import 'package:weather_task_app/features/weather/presentation/pages/weather_forecast_page.dart';
import 'package:weather_task_app/services/injection_service/injection_service.dart';

void main() async {
  configureInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Showcase Weather App',
      home: WeatherForecastPage(),
    );
  }
}
