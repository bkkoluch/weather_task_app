// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
mixin _$Weather {
  @JsonKey(name: 'time')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp_c')
  double get temperatureC => throw _privateConstructorUsedError;
  WeatherCondition get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_kph')
  double get maxWindSpeedKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'cloud')
  int get cloudCover => throw _privateConstructorUsedError;
  @JsonKey(name: 'chance_of_rain')
  int get chanceOfRain => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'time') String? date,
      @JsonKey(name: 'temp_c') double temperatureC,
      WeatherCondition condition,
      @JsonKey(name: 'wind_kph') double maxWindSpeedKm,
      @JsonKey(name: 'cloud') int cloudCover,
      @JsonKey(name: 'chance_of_rain') int chanceOfRain});

  $WeatherConditionCopyWith<$Res> get condition;
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res> implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  final Weather _value;
  // ignore: unused_field
  final $Res Function(Weather) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? temperatureC = freezed,
    Object? condition = freezed,
    Object? maxWindSpeedKm = freezed,
    Object? cloudCover = freezed,
    Object? chanceOfRain = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      temperatureC: temperatureC == freezed
          ? _value.temperatureC
          : temperatureC // ignore: cast_nullable_to_non_nullable
              as double,
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition,
      maxWindSpeedKm: maxWindSpeedKm == freezed
          ? _value.maxWindSpeedKm
          : maxWindSpeedKm // ignore: cast_nullable_to_non_nullable
              as double,
      cloudCover: cloudCover == freezed
          ? _value.cloudCover
          : cloudCover // ignore: cast_nullable_to_non_nullable
              as int,
      chanceOfRain: chanceOfRain == freezed
          ? _value.chanceOfRain
          : chanceOfRain // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $WeatherConditionCopyWith<$Res> get condition {
    return $WeatherConditionCopyWith<$Res>(_value.condition, (value) {
      return _then(_value.copyWith(condition: value));
    });
  }
}

/// @nodoc
abstract class _$$_WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$_WeatherCopyWith(
          _$_Weather value, $Res Function(_$_Weather) then) =
      __$$_WeatherCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'time') String? date,
      @JsonKey(name: 'temp_c') double temperatureC,
      WeatherCondition condition,
      @JsonKey(name: 'wind_kph') double maxWindSpeedKm,
      @JsonKey(name: 'cloud') int cloudCover,
      @JsonKey(name: 'chance_of_rain') int chanceOfRain});

  @override
  $WeatherConditionCopyWith<$Res> get condition;
}

/// @nodoc
class __$$_WeatherCopyWithImpl<$Res> extends _$WeatherCopyWithImpl<$Res>
    implements _$$_WeatherCopyWith<$Res> {
  __$$_WeatherCopyWithImpl(_$_Weather _value, $Res Function(_$_Weather) _then)
      : super(_value, (v) => _then(v as _$_Weather));

  @override
  _$_Weather get _value => super._value as _$_Weather;

  @override
  $Res call({
    Object? date = freezed,
    Object? temperatureC = freezed,
    Object? condition = freezed,
    Object? maxWindSpeedKm = freezed,
    Object? cloudCover = freezed,
    Object? chanceOfRain = freezed,
  }) {
    return _then(_$_Weather(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      temperatureC: temperatureC == freezed
          ? _value.temperatureC
          : temperatureC // ignore: cast_nullable_to_non_nullable
              as double,
      condition: condition == freezed
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition,
      maxWindSpeedKm: maxWindSpeedKm == freezed
          ? _value.maxWindSpeedKm
          : maxWindSpeedKm // ignore: cast_nullable_to_non_nullable
              as double,
      cloudCover: cloudCover == freezed
          ? _value.cloudCover
          : cloudCover // ignore: cast_nullable_to_non_nullable
              as int,
      chanceOfRain: chanceOfRain == freezed
          ? _value.chanceOfRain
          : chanceOfRain // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Weather extends _Weather {
  const _$_Weather(
      {@JsonKey(name: 'time') this.date,
      @JsonKey(name: 'temp_c') required this.temperatureC,
      required this.condition,
      @JsonKey(name: 'wind_kph') required this.maxWindSpeedKm,
      @JsonKey(name: 'cloud') required this.cloudCover,
      @JsonKey(name: 'chance_of_rain') this.chanceOfRain = 0})
      : super._();

  factory _$_Weather.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherFromJson(json);

  @override
  @JsonKey(name: 'time')
  final String? date;
  @override
  @JsonKey(name: 'temp_c')
  final double temperatureC;
  @override
  final WeatherCondition condition;
  @override
  @JsonKey(name: 'wind_kph')
  final double maxWindSpeedKm;
  @override
  @JsonKey(name: 'cloud')
  final int cloudCover;
  @override
  @JsonKey(name: 'chance_of_rain')
  final int chanceOfRain;

  @override
  String toString() {
    return 'Weather(date: $date, temperatureC: $temperatureC, condition: $condition, maxWindSpeedKm: $maxWindSpeedKm, cloudCover: $cloudCover, chanceOfRain: $chanceOfRain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Weather &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.temperatureC, temperatureC) &&
            const DeepCollectionEquality().equals(other.condition, condition) &&
            const DeepCollectionEquality()
                .equals(other.maxWindSpeedKm, maxWindSpeedKm) &&
            const DeepCollectionEquality()
                .equals(other.cloudCover, cloudCover) &&
            const DeepCollectionEquality()
                .equals(other.chanceOfRain, chanceOfRain));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(temperatureC),
      const DeepCollectionEquality().hash(condition),
      const DeepCollectionEquality().hash(maxWindSpeedKm),
      const DeepCollectionEquality().hash(cloudCover),
      const DeepCollectionEquality().hash(chanceOfRain));

  @JsonKey(ignore: true)
  @override
  _$$_WeatherCopyWith<_$_Weather> get copyWith =>
      __$$_WeatherCopyWithImpl<_$_Weather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherToJson(
      this,
    );
  }
}

abstract class _Weather extends Weather {
  const factory _Weather(
      {@JsonKey(name: 'time') final String? date,
      @JsonKey(name: 'temp_c') required final double temperatureC,
      required final WeatherCondition condition,
      @JsonKey(name: 'wind_kph') required final double maxWindSpeedKm,
      @JsonKey(name: 'cloud') required final int cloudCover,
      @JsonKey(name: 'chance_of_rain') final int chanceOfRain}) = _$_Weather;
  const _Weather._() : super._();

  factory _Weather.fromJson(Map<String, dynamic> json) = _$_Weather.fromJson;

  @override
  @JsonKey(name: 'time')
  String? get date;
  @override
  @JsonKey(name: 'temp_c')
  double get temperatureC;
  @override
  WeatherCondition get condition;
  @override
  @JsonKey(name: 'wind_kph')
  double get maxWindSpeedKm;
  @override
  @JsonKey(name: 'cloud')
  int get cloudCover;
  @override
  @JsonKey(name: 'chance_of_rain')
  int get chanceOfRain;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherCopyWith<_$_Weather> get copyWith =>
      throw _privateConstructorUsedError;
}

DayWeather _$DayWeatherFromJson(Map<String, dynamic> json) {
  return _DayWeather.fromJson(json);
}

/// @nodoc
mixin _$DayWeather {
  @JsonKey(name: 'daily_chance_of_rain')
  dynamic get dailyChanceOfRain => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayWeatherCopyWith<DayWeather> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayWeatherCopyWith<$Res> {
  factory $DayWeatherCopyWith(
          DayWeather value, $Res Function(DayWeather) then) =
      _$DayWeatherCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'daily_chance_of_rain') dynamic dailyChanceOfRain});
}

/// @nodoc
class _$DayWeatherCopyWithImpl<$Res> implements $DayWeatherCopyWith<$Res> {
  _$DayWeatherCopyWithImpl(this._value, this._then);

  final DayWeather _value;
  // ignore: unused_field
  final $Res Function(DayWeather) _then;

  @override
  $Res call({
    Object? dailyChanceOfRain = freezed,
  }) {
    return _then(_value.copyWith(
      dailyChanceOfRain: dailyChanceOfRain == freezed
          ? _value.dailyChanceOfRain
          : dailyChanceOfRain // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_DayWeatherCopyWith<$Res>
    implements $DayWeatherCopyWith<$Res> {
  factory _$$_DayWeatherCopyWith(
          _$_DayWeather value, $Res Function(_$_DayWeather) then) =
      __$$_DayWeatherCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'daily_chance_of_rain') dynamic dailyChanceOfRain});
}

/// @nodoc
class __$$_DayWeatherCopyWithImpl<$Res> extends _$DayWeatherCopyWithImpl<$Res>
    implements _$$_DayWeatherCopyWith<$Res> {
  __$$_DayWeatherCopyWithImpl(
      _$_DayWeather _value, $Res Function(_$_DayWeather) _then)
      : super(_value, (v) => _then(v as _$_DayWeather));

  @override
  _$_DayWeather get _value => super._value as _$_DayWeather;

  @override
  $Res call({
    Object? dailyChanceOfRain = freezed,
  }) {
    return _then(_$_DayWeather(
      dailyChanceOfRain: dailyChanceOfRain == freezed
          ? _value.dailyChanceOfRain
          : dailyChanceOfRain,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DayWeather extends _DayWeather {
  const _$_DayWeather(
      {@JsonKey(name: 'daily_chance_of_rain') this.dailyChanceOfRain})
      : super._();

  factory _$_DayWeather.fromJson(Map<String, dynamic> json) =>
      _$$_DayWeatherFromJson(json);

  @override
  @JsonKey(name: 'daily_chance_of_rain')
  final dynamic dailyChanceOfRain;

  @override
  String toString() {
    return 'DayWeather(dailyChanceOfRain: $dailyChanceOfRain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DayWeather &&
            const DeepCollectionEquality()
                .equals(other.dailyChanceOfRain, dailyChanceOfRain));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(dailyChanceOfRain));

  @JsonKey(ignore: true)
  @override
  _$$_DayWeatherCopyWith<_$_DayWeather> get copyWith =>
      __$$_DayWeatherCopyWithImpl<_$_DayWeather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DayWeatherToJson(
      this,
    );
  }
}

abstract class _DayWeather extends DayWeather {
  const factory _DayWeather(
      {@JsonKey(name: 'daily_chance_of_rain')
          final dynamic dailyChanceOfRain}) = _$_DayWeather;
  const _DayWeather._() : super._();

  factory _DayWeather.fromJson(Map<String, dynamic> json) =
      _$_DayWeather.fromJson;

  @override
  @JsonKey(name: 'daily_chance_of_rain')
  dynamic get dailyChanceOfRain;
  @override
  @JsonKey(ignore: true)
  _$$_DayWeatherCopyWith<_$_DayWeather> get copyWith =>
      throw _privateConstructorUsedError;
}
