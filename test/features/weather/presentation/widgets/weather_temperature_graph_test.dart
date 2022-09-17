import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_task_app/features/weather/presentation/widgets/weather_temperature_graph.dart';
import 'package:weather_task_app/features/weather/presentation/widgets/weather_text.dart';
import 'package:weather_task_app/style/style_tokens.dart';

import '../../../../test_data.dart';
import '../../../../test_setup.dart';

void main() {
  void verifyCommonColors({required bool shouldShow}) {
    expect(
      find.byWidgetPredicate(
          (w) => w is Container && w.color == StyleTokens.mainGreen),
      shouldShow ? findsOneWidget : findsNothing,
    );
    expect(
      find.byWidgetPredicate(
          (w) => w is Container && w.color == StyleTokens.mainRed),
      shouldShow ? findsOneWidget : findsNothing,
    );
    expect(
      find.byWidgetPredicate(
          (w) => w is Container && w.color == StyleTokens.mainBlue),
      shouldShow ? findsOneWidget : findsNothing,
    );
  }

  testWidgets(
      'should properly display WeatherTemperatureGraph for not empty weatherList',
      (widgetTester) async {
    final Widget testableWidget = prepareWidget(
      child: WeatherTemperatureGraph(weatherList: [
        tWeather,
        tTomorrowWeather,
        tWeather.copyWith(temperatureC: 10),
      ]),
    );

    await widgetTester.pumpWidget(testableWidget);
    await widgetTester.pumpAndSettle();

    expect(find.byType(WeatherText), findsNWidgets(3));
    verifyCommonColors(shouldShow: true);
    expect(
      find.byWidgetPredicate(
          (w) => w is Container && w.color == StyleTokens.mainWhite),
      findsNWidgets(2),
    );
  });

  testWidgets(
      'should properly display WeatherTemperatureGraph for not empty weatherList',
      (widgetTester) async {
    final Widget testableWidget = prepareWidget(
      child: const WeatherTemperatureGraph(weatherList: []),
    );

    await widgetTester.pumpWidget(testableWidget);
    await widgetTester.pumpAndSettle();

    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.byType(WeatherText), findsNothing);
    verifyCommonColors(shouldShow: false);
    expect(
      find.byWidgetPredicate(
          (w) => w is Container && w.color == StyleTokens.mainWhite),
      findsNothing,
    );
  });
}
