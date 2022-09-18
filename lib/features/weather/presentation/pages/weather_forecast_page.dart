import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_task_app/core/extensions/context_extensions.dart';
import 'package:weather_task_app/core/strings/strings.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_cubit.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_state.dart';
import 'package:weather_task_app/features/weather/presentation/widgets/weather_text.dart';
import 'package:weather_task_app/features/weather/presentation/widgets/weather_today_tab.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.loadForecast();
    });
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
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
            builder: (_, state) {
              if (state.isLoading) {
                return const _LoadingState();
              } else if (state.isFullyLoaded) {
                return _LoadedState(state: state);
              } else if (state.isError) {
                return _ErrorState(onRetryPressed: _cubit.loadForecast);
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
  final WeatherForecastState state;

  const _LoadedState({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(height: context.screenHeight * 0.05),
            const TabBar(
              indicatorColor: StyleTokens.mainBlue,
              tabs: [
                Tab(text: todayTabText),
                Tab(text: tomorrowTabText),
              ],
            ),
            const SizedBox(height: CoreDimensions.paddingM),
            Flexible(
              child: TabBarView(
                children: [
                  WeatherTab(
                    state: state.todayTabState!,
                    weatherForecast: state.weatherForecast!,
                  ),
                  WeatherTab(
                    state: state.tomorrowTabState!,
                    weatherForecast: state.weatherForecast!,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final VoidCallback onRetryPressed;

  const _ErrorState({required this.onRetryPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CoreDimensions.paddingL),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WeatherText.paragraph(text: weatherForecastPageErrorText),
          const SizedBox(height: CoreDimensions.paddingM),
          ElevatedButton(
            onPressed: onRetryPressed,
            child: WeatherText.subtitle(
              text: weatherForecastPageRetryButtonText,
            ),
          ),
        ],
      ),
    );
  }
}
