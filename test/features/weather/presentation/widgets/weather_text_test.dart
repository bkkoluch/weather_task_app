import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_task_app/features/weather/presentation/widgets/weather_text.dart';
import 'package:weather_task_app/style/style_tokens.dart';

import '../../../../test_setup.dart';

void main() {
  const String tText = 'test';

  void verifyCommonTextProperties({required double fontSize}) {
    expect(find.text(tText), findsOneWidget);
    expect(
      find.byWidgetPredicate((w) =>
          w is Text &&
          w.style is TextStyle &&
          w.style?.color == StyleTokens.mainWhite &&
          w.style?.fontSize == fontSize),
      findsOneWidget,
    );
  }

  testWidgets('should properly display WeatherText.header',
      (widgetTester) async {
    final Widget testableWidget = prepareWidget(
      child: WeatherText.header(text: tText),
    );

    await widgetTester.pumpWidget(testableWidget);

    verifyCommonTextProperties(fontSize: 32);
  });

  testWidgets('should properly display WeatherText.paragraph',
      (widgetTester) async {
    final Widget testableWidget = prepareWidget(
      child: WeatherText.paragraph(text: tText),
    );

    await widgetTester.pumpWidget(testableWidget);

    verifyCommonTextProperties(fontSize: 20);
  });

  testWidgets('should properly display WeatherText.subtitle',
      (widgetTester) async {
    final Widget testableWidget = prepareWidget(
      child: WeatherText.subtitle(text: tText),
    );

    await widgetTester.pumpWidget(testableWidget);

    verifyCommonTextProperties(fontSize: 14);
  });
}
