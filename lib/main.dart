import 'package:flutter/material.dart';
import 'package:weather_task_app/features/weather/data/data_sources/weather_remote_data_source.dart';
import 'package:weather_task_app/services/injection_service/injection_service.dart';

void main() async {
  configureInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(body: Center(child: TestWidget())),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await getIt<WeatherRemoteDataSource>()
            .getCurrentAndWholeDayWeatherForecast();
      },
      child: const ColoredBox(
        color: Colors.blue,
        child: SizedBox(
          height: 50,
          width: 200,
          child: Center(child: Text('TEST')),
        ),
      ),
    );
  }
}
