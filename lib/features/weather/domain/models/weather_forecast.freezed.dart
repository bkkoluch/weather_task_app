// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) {
  return _WeatherForecast.fromJson(json);
}

/// @nodoc
mixin _$WeatherForecast {
  WeatherLocation get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'current')
  Weather get current => throw _privateConstructorUsedError;
  @JsonKey(name: 'forecast')
  Forecast get forecast => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherForecastCopyWith<WeatherForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastCopyWith<$Res> {
  factory $WeatherForecastCopyWith(
          WeatherForecast value, $Res Function(WeatherForecast) then) =
      _$WeatherForecastCopyWithImpl<$Res>;
  $Res call(
      {WeatherLocation location,
      @JsonKey(name: 'current') Weather current,
      @JsonKey(name: 'forecast') Forecast forecast});

  $WeatherLocationCopyWith<$Res> get location;
  $WeatherCopyWith<$Res> get current;
  $ForecastCopyWith<$Res> get forecast;
}

/// @nodoc
class _$WeatherForecastCopyWithImpl<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  _$WeatherForecastCopyWithImpl(this._value, this._then);

  final WeatherForecast _value;
  // ignore: unused_field
  final $Res Function(WeatherForecast) _then;

  @override
  $Res call({
    Object? location = freezed,
    Object? current = freezed,
    Object? forecast = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as WeatherLocation,
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Weather,
      forecast: forecast == freezed
          ? _value.forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as Forecast,
    ));
  }

  @override
  $WeatherLocationCopyWith<$Res> get location {
    return $WeatherLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }

  @override
  $WeatherCopyWith<$Res> get current {
    return $WeatherCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value));
    });
  }

  @override
  $ForecastCopyWith<$Res> get forecast {
    return $ForecastCopyWith<$Res>(_value.forecast, (value) {
      return _then(_value.copyWith(forecast: value));
    });
  }
}

/// @nodoc
abstract class _$$_WeatherForecastCopyWith<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  factory _$$_WeatherForecastCopyWith(
          _$_WeatherForecast value, $Res Function(_$_WeatherForecast) then) =
      __$$_WeatherForecastCopyWithImpl<$Res>;
  @override
  $Res call(
      {WeatherLocation location,
      @JsonKey(name: 'current') Weather current,
      @JsonKey(name: 'forecast') Forecast forecast});

  @override
  $WeatherLocationCopyWith<$Res> get location;
  @override
  $WeatherCopyWith<$Res> get current;
  @override
  $ForecastCopyWith<$Res> get forecast;
}

/// @nodoc
class __$$_WeatherForecastCopyWithImpl<$Res>
    extends _$WeatherForecastCopyWithImpl<$Res>
    implements _$$_WeatherForecastCopyWith<$Res> {
  __$$_WeatherForecastCopyWithImpl(
      _$_WeatherForecast _value, $Res Function(_$_WeatherForecast) _then)
      : super(_value, (v) => _then(v as _$_WeatherForecast));

  @override
  _$_WeatherForecast get _value => super._value as _$_WeatherForecast;

  @override
  $Res call({
    Object? location = freezed,
    Object? current = freezed,
    Object? forecast = freezed,
  }) {
    return _then(_$_WeatherForecast(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as WeatherLocation,
      current: current == freezed
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Weather,
      forecast: forecast == freezed
          ? _value.forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as Forecast,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherForecast extends _WeatherForecast {
  const _$_WeatherForecast(
      {required this.location,
      @JsonKey(name: 'current') required this.current,
      @JsonKey(name: 'forecast') required this.forecast})
      : super._();

  factory _$_WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherForecastFromJson(json);

  @override
  final WeatherLocation location;
  @override
  @JsonKey(name: 'current')
  final Weather current;
  @override
  @JsonKey(name: 'forecast')
  final Forecast forecast;

  @override
  String toString() {
    return 'WeatherForecast(location: $location, current: $current, forecast: $forecast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherForecast &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.current, current) &&
            const DeepCollectionEquality().equals(other.forecast, forecast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(current),
      const DeepCollectionEquality().hash(forecast));

  @JsonKey(ignore: true)
  @override
  _$$_WeatherForecastCopyWith<_$_WeatherForecast> get copyWith =>
      __$$_WeatherForecastCopyWithImpl<_$_WeatherForecast>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherForecastToJson(
      this,
    );
  }
}

abstract class _WeatherForecast extends WeatherForecast {
  const factory _WeatherForecast(
          {required final WeatherLocation location,
          @JsonKey(name: 'current') required final Weather current,
          @JsonKey(name: 'forecast') required final Forecast forecast}) =
      _$_WeatherForecast;
  const _WeatherForecast._() : super._();

  factory _WeatherForecast.fromJson(Map<String, dynamic> json) =
      _$_WeatherForecast.fromJson;

  @override
  WeatherLocation get location;
  @override
  @JsonKey(name: 'current')
  Weather get current;
  @override
  @JsonKey(name: 'forecast')
  Forecast get forecast;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherForecastCopyWith<_$_WeatherForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return _Forecast.fromJson(json);
}

/// @nodoc
mixin _$Forecast {
  @JsonKey(name: 'forecastday')
  List<ForecastDay> get forecastDay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastCopyWith<Forecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastCopyWith<$Res> {
  factory $ForecastCopyWith(Forecast value, $Res Function(Forecast) then) =
      _$ForecastCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'forecastday') List<ForecastDay> forecastDay});
}

/// @nodoc
class _$ForecastCopyWithImpl<$Res> implements $ForecastCopyWith<$Res> {
  _$ForecastCopyWithImpl(this._value, this._then);

  final Forecast _value;
  // ignore: unused_field
  final $Res Function(Forecast) _then;

  @override
  $Res call({
    Object? forecastDay = freezed,
  }) {
    return _then(_value.copyWith(
      forecastDay: forecastDay == freezed
          ? _value.forecastDay
          : forecastDay // ignore: cast_nullable_to_non_nullable
              as List<ForecastDay>,
    ));
  }
}

/// @nodoc
abstract class _$$_ForecastCopyWith<$Res> implements $ForecastCopyWith<$Res> {
  factory _$$_ForecastCopyWith(
          _$_Forecast value, $Res Function(_$_Forecast) then) =
      __$$_ForecastCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'forecastday') List<ForecastDay> forecastDay});
}

/// @nodoc
class __$$_ForecastCopyWithImpl<$Res> extends _$ForecastCopyWithImpl<$Res>
    implements _$$_ForecastCopyWith<$Res> {
  __$$_ForecastCopyWithImpl(
      _$_Forecast _value, $Res Function(_$_Forecast) _then)
      : super(_value, (v) => _then(v as _$_Forecast));

  @override
  _$_Forecast get _value => super._value as _$_Forecast;

  @override
  $Res call({
    Object? forecastDay = freezed,
  }) {
    return _then(_$_Forecast(
      forecastDay: forecastDay == freezed
          ? _value._forecastDay
          : forecastDay // ignore: cast_nullable_to_non_nullable
              as List<ForecastDay>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Forecast extends _Forecast {
  const _$_Forecast(
      {@JsonKey(name: 'forecastday')
          required final List<ForecastDay> forecastDay})
      : _forecastDay = forecastDay,
        super._();

  factory _$_Forecast.fromJson(Map<String, dynamic> json) =>
      _$$_ForecastFromJson(json);

  final List<ForecastDay> _forecastDay;
  @override
  @JsonKey(name: 'forecastday')
  List<ForecastDay> get forecastDay {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forecastDay);
  }

  @override
  String toString() {
    return 'Forecast(forecastDay: $forecastDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Forecast &&
            const DeepCollectionEquality()
                .equals(other._forecastDay, _forecastDay));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_forecastDay));

  @JsonKey(ignore: true)
  @override
  _$$_ForecastCopyWith<_$_Forecast> get copyWith =>
      __$$_ForecastCopyWithImpl<_$_Forecast>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ForecastToJson(
      this,
    );
  }
}

abstract class _Forecast extends Forecast {
  const factory _Forecast(
      {@JsonKey(name: 'forecastday')
          required final List<ForecastDay> forecastDay}) = _$_Forecast;
  const _Forecast._() : super._();

  factory _Forecast.fromJson(Map<String, dynamic> json) = _$_Forecast.fromJson;

  @override
  @JsonKey(name: 'forecastday')
  List<ForecastDay> get forecastDay;
  @override
  @JsonKey(ignore: true)
  _$$_ForecastCopyWith<_$_Forecast> get copyWith =>
      throw _privateConstructorUsedError;
}

ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) {
  return _ForecastDay.fromJson(json);
}

/// @nodoc
mixin _$ForecastDay {
  @JsonKey(name: 'hour')
  List<Weather> get forecast => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastDayCopyWith<ForecastDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastDayCopyWith<$Res> {
  factory $ForecastDayCopyWith(
          ForecastDay value, $Res Function(ForecastDay) then) =
      _$ForecastDayCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'hour') List<Weather> forecast});
}

/// @nodoc
class _$ForecastDayCopyWithImpl<$Res> implements $ForecastDayCopyWith<$Res> {
  _$ForecastDayCopyWithImpl(this._value, this._then);

  final ForecastDay _value;
  // ignore: unused_field
  final $Res Function(ForecastDay) _then;

  @override
  $Res call({
    Object? forecast = freezed,
  }) {
    return _then(_value.copyWith(
      forecast: forecast == freezed
          ? _value.forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
    ));
  }
}

/// @nodoc
abstract class _$$_ForecastDayCopyWith<$Res>
    implements $ForecastDayCopyWith<$Res> {
  factory _$$_ForecastDayCopyWith(
          _$_ForecastDay value, $Res Function(_$_ForecastDay) then) =
      __$$_ForecastDayCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'hour') List<Weather> forecast});
}

/// @nodoc
class __$$_ForecastDayCopyWithImpl<$Res> extends _$ForecastDayCopyWithImpl<$Res>
    implements _$$_ForecastDayCopyWith<$Res> {
  __$$_ForecastDayCopyWithImpl(
      _$_ForecastDay _value, $Res Function(_$_ForecastDay) _then)
      : super(_value, (v) => _then(v as _$_ForecastDay));

  @override
  _$_ForecastDay get _value => super._value as _$_ForecastDay;

  @override
  $Res call({
    Object? forecast = freezed,
  }) {
    return _then(_$_ForecastDay(
      forecast: forecast == freezed
          ? _value._forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ForecastDay extends _ForecastDay {
  const _$_ForecastDay(
      {@JsonKey(name: 'hour') required final List<Weather> forecast})
      : _forecast = forecast,
        super._();

  factory _$_ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$$_ForecastDayFromJson(json);

  final List<Weather> _forecast;
  @override
  @JsonKey(name: 'hour')
  List<Weather> get forecast {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forecast);
  }

  @override
  String toString() {
    return 'ForecastDay(forecast: $forecast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForecastDay &&
            const DeepCollectionEquality().equals(other._forecast, _forecast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_forecast));

  @JsonKey(ignore: true)
  @override
  _$$_ForecastDayCopyWith<_$_ForecastDay> get copyWith =>
      __$$_ForecastDayCopyWithImpl<_$_ForecastDay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ForecastDayToJson(
      this,
    );
  }
}

abstract class _ForecastDay extends ForecastDay {
  const factory _ForecastDay(
          {@JsonKey(name: 'hour') required final List<Weather> forecast}) =
      _$_ForecastDay;
  const _ForecastDay._() : super._();

  factory _ForecastDay.fromJson(Map<String, dynamic> json) =
      _$_ForecastDay.fromJson;

  @override
  @JsonKey(name: 'hour')
  List<Weather> get forecast;
  @override
  @JsonKey(ignore: true)
  _$$_ForecastDayCopyWith<_$_ForecastDay> get copyWith =>
      throw _privateConstructorUsedError;
}
