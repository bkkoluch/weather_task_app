import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_task_app/core/constants.dart';
import 'package:weather_task_app/core/extensions/context_extensions.dart';
import 'package:weather_task_app/core/strings/strings.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_forecast.dart';
import 'package:weather_task_app/features/weather/domain/models/weather_location.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_cubit.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_state.dart';
import 'package:weather_task_app/features/weather/presentation/widgets/weather_text.dart';
import 'package:weather_task_app/services/injection_service/injection_service.dart';
import 'package:weather_task_app/style/core_dimensions.dart';
import 'package:weather_task_app/style/style_tokens.dart';

class WeatherForecastPage extends StatefulWidget {
  const WeatherForecastPage({Key? key}) : super(key: key);

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  final WeatherForecastCubit _cubit = getIt<WeatherForecastCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.loadForecast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: StyleTokens.backgroundGradient,
        ),
        child: BlocBuilder<WeatherForecastCubit, WeatherForecastState>(
            bloc: _cubit,
            builder: (context, state) {
              if (state.isLoading) {
                return const _LoadingState();
              } else if (state.isFullyLoaded) {
                return _LoadedState(weatherForecast: state.weatherForecast!);
              }

              return const SizedBox.shrink();
            }),
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: StyleTokens.mainBlue),
    );
  }
}

class _LoadedState extends StatelessWidget {
  final WeatherForecast weatherForecast;

  const _LoadedState({required this.weatherForecast, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WeatherLocation location = weatherForecast.location;

    return SizedBox(
      width: context.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WeatherText.header(text: location.name),
          SizedBox(height: CoreDimensions.paddingS),
          WeatherText.subtitle(text: location.country),
          SizedBox(height: CoreDimensions.paddingM),
          WeatherText.paragraph(text: location.localTime),
          SizedBox(height: CoreDimensions.paddingS),
          Image.network(
            '${Constants.httpHostString}${weatherForecast.current.condition.icon}',
            scale: 0.5,
            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherText.paragraph(text: weatherConditions),
              SizedBox(height: CoreDimensions.paddingS),
              WeatherText.paragraph(text: temperature),
              SizedBox(height: CoreDimensions.paddingS),
              WeatherText.paragraph(text: windSpeed),
              SizedBox(height: CoreDimensions.paddingS),
              WeatherText.paragraph(text: cloudCoverage),
            ],
          ),
        ],
      ),
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
