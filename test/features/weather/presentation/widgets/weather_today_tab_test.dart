import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_task_app/core/strings/strings.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_state.dart';
import 'package:weather_task_app/features/weather/presentation/widgets/weather_temperature_graph.dart';
import 'package:weather_task_app/features/weather/presentation/widgets/weather_today_tab.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

void main() {
  testWidgets('should properly display WeatherTab', (widgetTester) async {
    final Widget testableWidget = prepareWidget(
      child: const WeatherTab(
        state: WeatherForecastTabState(
          dayForecast: tWeather,
          forecastForNextTwelveHours: [tWeather],
        ),
        weatherForecast: tWeatherForecast,
      ),
    );

    await widgetTester.pumpWidget(testableWidget);

    expect(find.text(tWeatherForecast.location.name), findsOneWidget);
    expect(find.text(tWeatherForecast.location.country), findsOneWidget);
    expect(
      find.text(tWeather.date ?? tWeatherForecast.location.localTime),
      findsOneWidget,
    );
    expect(
      find.text('$weatherConditionsText${tWeather.condition.text}'),
      findsOneWidget,
    );
    expect(
      find.text('$temperatureText${tWeather.temperatureC}$degreeCelsius'),
      findsOneWidget,
    );
    expect(
      find.text(
          '$windSpeedText${tWeather.maxWindSpeedKm.toStringAsFixed(0)} $kilometersPerHourUnit'),
      findsOneWidget,
    );
    expect(
      find.text('$cloudCoverageText${tWeather.cloudCover}$percentSign'),
      findsOneWidget,
    );
    expect(find.text(forecastForNextTwelveHoursText), findsOneWidget);
    expect(find.text(forecastForNextTwelveHoursBarChartText), findsOneWidget);
    expect(find.byType(WeatherTemperatureGraph), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });
}
