import 'package:flutter/cupertino.dart';
import 'package:weather_task_app/core/constants.dart';
import 'package:weather_task_app/core/extensions/context_extensions.dart';
import 'package:weather_task_app/core/strings/strings.dart';
import 'package:weather_task_app/features/weather/domain/models/weather.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_location.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_state.dart';
import 'package:weather_task_app/features/weather/presentation/widgets/weather_temperature_graph.dart';
import 'package:weather_task_app/features/weather/presentation/widgets/weather_text.dart';
import 'package:weather_task_app/style/core_dimensions.dart';
import 'package:weather_task_app/style/style_tokens.dart';

class WeatherTodayTab extends StatelessWidget {
  final WeatherForecastState state;

  const WeatherTodayTab({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: context.screenHeight,
        child: Column(
          children: [
            _WeatherCurrentForecastDescription(
              weatherForecast: state.weatherForecast!,
            ),
            const SizedBox(height: CoreDimensions.paddingL),
            Container(
                padding: const EdgeInsets.only(left: CoreDimensions.paddingM),
                width: context.screenWidth,
                child: WeatherText.paragraph(
                    text: forecastForNextTwelveHoursText)),
            const SizedBox(height: CoreDimensions.paddingS),
            _WeatherTwelveHoursHorizontalList(
              forecastForNextTwelveHours: state.forecastForNextTwelveHours!,
            ),
            const SizedBox(height: CoreDimensions.paddingL),
            Container(
                width: context.screenWidth,
                padding: const EdgeInsets.only(left: CoreDimensions.paddingM),
                child: WeatherText.paragraph(
                    text: forecastForNextTwelveHoursBarChartText)),
            WeatherTemperatureGraph(
              weatherList: state.forecastForNextTwelveHours!,
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherIcon extends StatelessWidget {
  final String iconUrl;

  const _WeatherIcon({required this.iconUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${Constants.httpHostString}$iconUrl',
      scale: 0.5,
      errorBuilder: (_, __, ___) => const SizedBox.shrink(),
    );
  }
}

class _WeatherCurrentForecastDescription extends StatelessWidget {
  final WeatherForecast weatherForecast;

  const _WeatherCurrentForecastDescription(
      {required this.weatherForecast, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WeatherLocation location = weatherForecast.location;

    return Column(
      children: [
        WeatherText.header(text: location.name),
        const SizedBox(height: CoreDimensions.paddingS),
        WeatherText.subtitle(text: location.country),
        const SizedBox(height: CoreDimensions.paddingM),
        WeatherText.paragraph(text: location.localTime),
        const SizedBox(height: CoreDimensions.paddingS),
        _WeatherIcon(iconUrl: weatherForecast.current.condition.icon),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeatherText.paragraph(text: weatherConditions),
            const SizedBox(height: CoreDimensions.paddingS),
            WeatherText.paragraph(text: temperature),
            const SizedBox(height: CoreDimensions.paddingS),
            WeatherText.paragraph(text: windSpeed),
            const SizedBox(height: CoreDimensions.paddingS),
            WeatherText.paragraph(text: cloudCoverage),
          ],
        )
      ],
    );
  }

  String get weatherConditions =>
      '$weatherConditionsText${weatherForecast.current.condition.text}';

  String get temperature =>
      '$temperatureText${weatherForecast.current.temperatureC}$degreeCelsius';

  String get windSpeed =>
      '$windSpeedText${weatherForecast.current.maxWindSpeedKm.toStringAsFixed(0)} km/h';

  String get cloudCoverage =>
      '$cloudCoverageText${weatherForecast.current.cloudCover}%';
}

class _WeatherTwelveHoursHorizontalList extends StatelessWidget {
  final List<Weather> forecastForNextTwelveHours;

  const _WeatherTwelveHoursHorizontalList(
      {required this.forecastForNextTwelveHours, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.15,
      color: StyleTokens.mainBlueTenPercent,
      child: ListView.builder(
        itemCount: forecastForNextTwelveHours.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final Weather weather = forecastForNextTwelveHours[index];

          return Padding(
            padding: const EdgeInsets.all(CoreDimensions.paddingM),
            child: Column(
              children: [
                WeatherText.paragraph(text: weather.hour ?? ''),
                Expanded(
                  child: _WeatherIcon(iconUrl: weather.condition.icon),
                ),
                WeatherText.subtitle(
                  text: '${weather.temperatureC}$degreeCelsius',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
