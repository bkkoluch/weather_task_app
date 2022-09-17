import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_task_app/core/extensions/context_extensions.dart';
import 'package:weather_task_app/features/weather/domain/models/weather.dart';
import 'package:weather_task_app/features/weather/presentation/widgets/weather_text.dart';
import 'package:weather_task_app/style/core_dimensions.dart';
import 'package:weather_task_app/style/style_tokens.dart';

// Normally I would make something fancier in fl_chart for example (https://pub.dev/packages/fl_chart),
// which I'm familiar with, although as the requirement was to make "simple" app I did
// not want to introduce more complexity.
class WeatherTemperatureGraph extends StatelessWidget {
  final List<Weather> weatherList;

  const WeatherTemperatureGraph({required this.weatherList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (weatherList.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      color: StyleTokens.mainBlueTenPercent,
      padding: const EdgeInsets.symmetric(horizontal: CoreDimensions.paddingSM),
      child: Stack(
        children: [
          const _GraphLine(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: weatherList
                .map((weather) => _WeatherGraphBar(
                      temperature: weather.temperatureC,
                      temperaturesForTheWholeRange: weatherList
                          .map((weather) => weather.temperatureC)
                          .toList(),
                    ))
                .toList(),
          ),
          const Positioned(
            bottom: CoreDimensions.paddingM,
            child: _GraphLine(),
          ),
        ],
      ),
    );
  }
}

class _WeatherGraphBar extends StatelessWidget {
  final double temperature;
  final List<double> temperaturesForTheWholeRange;

  const _WeatherGraphBar({
    required this.temperature,
    required this.temperaturesForTheWholeRange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: CoreDimensions.paddingL,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(height: temperature * 3, width: 10, color: color),
            WeatherText.subtitle(text: temperature.toString()),
          ],
        ),
      ),
    );
  }

  Color get color {
    if (temperature == temperaturesForTheWholeRange.reduce(max)) {
      return StyleTokens.mainGreen;
    } else if (temperature == temperaturesForTheWholeRange.reduce(min)) {
      return StyleTokens.mainRed;
    } else {
      return StyleTokens.mainBlue;
    }
  }
}

class _GraphLine extends StatelessWidget {
  const _GraphLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: context.screenWidth,
      color: StyleTokens.mainWhite,
    );
  }
}
