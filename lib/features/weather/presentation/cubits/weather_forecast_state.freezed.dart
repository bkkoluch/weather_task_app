// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_forecast_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherForecastState {
  WeatherForecastPageStatus get status => throw _privateConstructorUsedError;
  WeatherForecast? get weatherForecast => throw _privateConstructorUsedError;
  List<Weather>? get forecastForNextTwelveHours =>
      throw _privateConstructorUsedError;
  Weather? get tomorrowForecast => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherForecastStateCopyWith<WeatherForecastState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastStateCopyWith<$Res> {
  factory $WeatherForecastStateCopyWith(WeatherForecastState value,
          $Res Function(WeatherForecastState) then) =
      _$WeatherForecastStateCopyWithImpl<$Res>;
  $Res call(
      {WeatherForecastPageStatus status,
      WeatherForecast? weatherForecast,
      List<Weather>? forecastForNextTwelveHours,
      Weather? tomorrowForecast});

  $WeatherForecastCopyWith<$Res>? get weatherForecast;
  $WeatherCopyWith<$Res>? get tomorrowForecast;
}

/// @nodoc
class _$WeatherForecastStateCopyWithImpl<$Res>
    implements $WeatherForecastStateCopyWith<$Res> {
  _$WeatherForecastStateCopyWithImpl(this._value, this._then);

  final WeatherForecastState _value;
  // ignore: unused_field
  final $Res Function(WeatherForecastState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? weatherForecast = freezed,
    Object? forecastForNextTwelveHours = freezed,
    Object? tomorrowForecast = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WeatherForecastPageStatus,
      weatherForecast: weatherForecast == freezed
          ? _value.weatherForecast
          : weatherForecast // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
      forecastForNextTwelveHours: forecastForNextTwelveHours == freezed
          ? _value.forecastForNextTwelveHours
          : forecastForNextTwelveHours // ignore: cast_nullable_to_non_nullable
              as List<Weather>?,
      tomorrowForecast: tomorrowForecast == freezed
          ? _value.tomorrowForecast
          : tomorrowForecast // ignore: cast_nullable_to_non_nullable
              as Weather?,
    ));
  }

  @override
  $WeatherForecastCopyWith<$Res>? get weatherForecast {
    if (_value.weatherForecast == null) {
      return null;
    }

    return $WeatherForecastCopyWith<$Res>(_value.weatherForecast!, (value) {
      return _then(_value.copyWith(weatherForecast: value));
    });
  }

  @override
  $WeatherCopyWith<$Res>? get tomorrowForecast {
    if (_value.tomorrowForecast == null) {
      return null;
    }

    return $WeatherCopyWith<$Res>(_value.tomorrowForecast!, (value) {
      return _then(_value.copyWith(tomorrowForecast: value));
    });
  }
}

/// @nodoc
abstract class _$$_WeatherForecastStateCopyWith<$Res>
    implements $WeatherForecastStateCopyWith<$Res> {
  factory _$$_WeatherForecastStateCopyWith(_$_WeatherForecastState value,
          $Res Function(_$_WeatherForecastState) then) =
      __$$_WeatherForecastStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {WeatherForecastPageStatus status,
      WeatherForecast? weatherForecast,
      List<Weather>? forecastForNextTwelveHours,
      Weather? tomorrowForecast});

  @override
  $WeatherForecastCopyWith<$Res>? get weatherForecast;
  @override
  $WeatherCopyWith<$Res>? get tomorrowForecast;
}

/// @nodoc
class __$$_WeatherForecastStateCopyWithImpl<$Res>
    extends _$WeatherForecastStateCopyWithImpl<$Res>
    implements _$$_WeatherForecastStateCopyWith<$Res> {
  __$$_WeatherForecastStateCopyWithImpl(_$_WeatherForecastState _value,
      $Res Function(_$_WeatherForecastState) _then)
      : super(_value, (v) => _then(v as _$_WeatherForecastState));

  @override
  _$_WeatherForecastState get _value => super._value as _$_WeatherForecastState;

  @override
  $Res call({
    Object? status = freezed,
    Object? weatherForecast = freezed,
    Object? forecastForNextTwelveHours = freezed,
    Object? tomorrowForecast = freezed,
  }) {
    return _then(_$_WeatherForecastState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WeatherForecastPageStatus,
      weatherForecast: weatherForecast == freezed
          ? _value.weatherForecast
          : weatherForecast // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
      forecastForNextTwelveHours: forecastForNextTwelveHours == freezed
          ? _value._forecastForNextTwelveHours
          : forecastForNextTwelveHours // ignore: cast_nullable_to_non_nullable
              as List<Weather>?,
      tomorrowForecast: tomorrowForecast == freezed
          ? _value.tomorrowForecast
          : tomorrowForecast // ignore: cast_nullable_to_non_nullable
              as Weather?,
    ));
  }
}

/// @nodoc

class _$_WeatherForecastState extends _WeatherForecastState {
  const _$_WeatherForecastState(
      {required this.status,
      this.weatherForecast,
      final List<Weather>? forecastForNextTwelveHours,
      this.tomorrowForecast})
      : _forecastForNextTwelveHours = forecastForNextTwelveHours,
        super._();

  @override
  final WeatherForecastPageStatus status;
  @override
  final WeatherForecast? weatherForecast;
  final List<Weather>? _forecastForNextTwelveHours;
  @override
  List<Weather>? get forecastForNextTwelveHours {
    final value = _forecastForNextTwelveHours;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Weather? tomorrowForecast;

  @override
  String toString() {
    return 'WeatherForecastState(status: $status, weatherForecast: $weatherForecast, forecastForNextTwelveHours: $forecastForNextTwelveHours, tomorrowForecast: $tomorrowForecast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherForecastState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.weatherForecast, weatherForecast) &&
            const DeepCollectionEquality().equals(
                other._forecastForNextTwelveHours,
                _forecastForNextTwelveHours) &&
            const DeepCollectionEquality()
                .equals(other.tomorrowForecast, tomorrowForecast));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(weatherForecast),
      const DeepCollectionEquality().hash(_forecastForNextTwelveHours),
      const DeepCollectionEquality().hash(tomorrowForecast));

  @JsonKey(ignore: true)
  @override
  _$$_WeatherForecastStateCopyWith<_$_WeatherForecastState> get copyWith =>
      __$$_WeatherForecastStateCopyWithImpl<_$_WeatherForecastState>(
          this, _$identity);
}

abstract class _WeatherForecastState extends WeatherForecastState {
  const factory _WeatherForecastState(
      {required final WeatherForecastPageStatus status,
      final WeatherForecast? weatherForecast,
      final List<Weather>? forecastForNextTwelveHours,
      final Weather? tomorrowForecast}) = _$_WeatherForecastState;
  const _WeatherForecastState._() : super._();

  @override
  WeatherForecastPageStatus get status;
  @override
  WeatherForecast? get weatherForecast;
  @override
  List<Weather>? get forecastForNextTwelveHours;
  @override
  Weather? get tomorrowForecast;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherForecastStateCopyWith<_$_WeatherForecastState> get copyWith =>
      throw _privateConstructorUsedError;
}
