import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

class WeatherTab extends StatelessWidget {
  final WeatherForecastTabState state;
  final WeatherForecast weatherForecast;

  const WeatherTab({
    required this.state,
    required this.weatherForecast,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _WeatherCurrentForecastDescription(
            weatherForecast: weatherForecast,
            weather: state.dayForecast!,
          ),
          const SizedBox(height: CoreDimensions.paddingL),
          Container(
            padding: const EdgeInsets.only(left: CoreDimensions.paddingM),
            width: context.screenWidth,
            child: WeatherText.paragraph(text: forecastForNextTwelveHoursText),
          ),
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
    );
  }
}

class _WeatherIcon extends StatefulWidget {
  final String iconUrl;

  const _WeatherIcon({required this.iconUrl, Key? key}) : super(key: key);

  @override
  State<_WeatherIcon> createState() => _WeatherIconState();
}

class _WeatherIconState extends State<_WeatherIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> verticalFloatAnimation;
  late Animation<double> horizontalFloatAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    verticalFloatAnimation = Tween<double>(begin: 0, end: 5).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 1, curve: Curves.easeInOut),
      ),
    );
    horizontalFloatAnimation = Tween<double>(begin: 3, end: -3).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.3, 1, curve: Curves.easeInOut),
      ),
    );
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(
              horizontalFloatAnimation.value, verticalFloatAnimation.value),
          child: child!,
        );
      },
      child: CachedNetworkImage(
        imageUrl: '${Constants.httpHostString}${widget.iconUrl}',
        placeholder: (_, __) => const CircularProgressIndicator(),
        errorWidget: (_, __, ___) => const SizedBox.shrink(),
      ),
    );
  }
}

class _WeatherCurrentForecastDescription extends StatelessWidget {
  final WeatherForecast weatherForecast;
  final Weather weather;

  const _WeatherCurrentForecastDescription({
    required this.weatherForecast,
    required this.weather,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WeatherLocation location = weatherForecast.location;

    return Column(
      children: [
        WeatherText.header(text: location.name),
        const SizedBox(height: CoreDimensions.paddingS),
        WeatherText.subtitle(text: location.country),
        const SizedBox(height: CoreDimensions.paddingM),
        WeatherText.paragraph(text: weather.date ?? location.localTime),
        const SizedBox(height: CoreDimensions.paddingS),
        _WeatherIcon(iconUrl: weather.condition.icon),
        Padding(
          padding: const EdgeInsets.only(left: CoreDimensions.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WeatherText.paragraph(text: weatherConditions),
              const SizedBox(height: CoreDimensions.paddingS),
              WeatherText.paragraph(text: temperature),
              const SizedBox(height: CoreDimensions.paddingS),
              WeatherText.paragraph(text: windSpeed),
              const SizedBox(height: CoreDimensions.paddingS),
              WeatherText.paragraph(text: cloudCoverage),
            ],
          ),
        )
      ],
    );
  }

  String get weatherConditions =>
      '$weatherConditionsText${weather.condition.text}';

  String get temperature =>
      '$temperatureText${weather.temperatureC}$degreeCelsius';

  String get windSpeed =>
      '$windSpeedText${weather.maxWindSpeedKm.toStringAsFixed(0)} $kilometersPerHourUnit';

  String get cloudCoverage =>
      '$cloudCoverageText${weather.cloudCover}$percentSign';
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
