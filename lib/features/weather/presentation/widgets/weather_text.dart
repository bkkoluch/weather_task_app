import 'package:flutter/material.dart';
import 'package:weather_task_app/style/style_tokens.dart';

class WeatherText extends StatelessWidget {
  final String text;
  final double fontSize;

  const WeatherText._({
    required this.text,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  factory WeatherText.header({required String text}) {
    return WeatherText._(text: text, fontSize: 32);
  }

  factory WeatherText.paragraph({required String text}) {
    return WeatherText._(text: text, fontSize: 20);
  }

  factory WeatherText.subtitle({required String text}) {
    return WeatherText._(text: text, fontSize: 14);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: StyleTokens.mainWhite, fontSize: fontSize),
    );
  }
}
