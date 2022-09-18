import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_task_app/core/strings/strings.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_cubit.dart';
import 'package:weather_task_app/features/weather/presentation/cubits/weather_forecast_state.dart';
import 'package:weather_task_app/features/weather/presentation/pages/weather_forecast_page.dart';
import 'package:weather_task_app/features/weather/presentation/widgets/weather_today_tab.dart';
import 'package:weather_task_app/services/injection_service/injection_service.dart';

import '../../../../mocks.dart';
import '../../../../test_data.dart';
import '../../../../test_setup.dart';

void main() {
  final WeatherForecastCubit weatherForecastCubit = MockWeatherForecastCubit();
  final WeatherForecastState initialState = WeatherForecastState.initial();

  setUpAll(() {
    getIt.registerFactory<WeatherForecastCubit>(() => weatherForecastCubit);

    when(() => weatherForecastCubit.loadForecast()).thenAnswer((_) async {});

    when(() => weatherForecastCubit.close()).thenAnswer((_) async {});
  });

  final Widget testableWidget =
      prepareWidget(child: const WeatherForecastPage());

  testWidgets(
      'should properly display WeatherForecastPage for'
      'WeatherForecastPageStatus.loading', (widgetTester) async {
    whenListen(
      weatherForecastCubit,
      Stream<WeatherForecastState>.fromIterable(
        [initialState.copyWith(status: WeatherForecastPageStatus.loading)],
      ),
      initialState: initialState,
    );

    await widgetTester.pumpWidget(testableWidget);
    await widgetTester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(DefaultTabController), findsNothing);
    expect(find.byType(TabBar), findsNothing);
    expect(find.byType(TabBarView), findsNothing);
  });

  testWidgets(
      'should properly display WeatherForecastPage for'
      'WeatherForecastPageStatus.loaded', (widgetTester) async {
    whenListen(
      weatherForecastCubit,
      Stream<WeatherForecastState>.fromIterable(
        [
          initialState.copyWith(
            weatherForecast: tWeatherForecast,
            todayTabState: const WeatherForecastTabState(
              dayForecast: tWeather,
              forecastForNextTwelveHours: [tWeather],
            ),
            tomorrowTabState: const WeatherForecastTabState(
              dayForecast: tTomorrowWeather,
              forecastForNextTwelveHours: [tWeather],
            ),
            status: WeatherForecastPageStatus.loaded,
          )
        ],
      ),
      initialState: initialState,
    );

    await widgetTester.pumpWidget(testableWidget);
    await widgetTester.pump();

    expect(find.byType(DefaultTabController), findsOneWidget);
    expect(find.text(todayTabText), findsOneWidget);
    expect(find.text(tomorrowTabText), findsOneWidget);
    expect(find.byType(TabBar), findsOneWidget);
    expect(find.byType(TabBarView), findsOneWidget);
    expect(find.byType(WeatherTab), findsOneWidget);
  });

  testWidgets(
      'should properly display WeatherForecastPage for'
      'WeatherForecastPageStatus.error', (widgetTester) async {
    whenListen(
      weatherForecastCubit,
      Stream<WeatherForecastState>.fromIterable(
        [initialState.copyWith(status: WeatherForecastPageStatus.error)],
      ),
      initialState: initialState,
    );

    await widgetTester.pumpWidget(testableWidget);
    await widgetTester.pump();

    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text(weatherForecastPageErrorText), findsOneWidget);
    expect(find.text(weatherForecastPageRetryButtonText), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(DefaultTabController), findsNothing);
    expect(find.text(todayTabText), findsNothing);
    expect(find.text(tomorrowTabText), findsNothing);
    expect(find.byType(TabBar), findsNothing);
    expect(find.byType(TabBarView), findsNothing);
    expect(find.byType(WeatherTab), findsNothing);
  });
}
