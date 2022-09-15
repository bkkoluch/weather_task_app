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
      @JsonKey(name: 'cloud') int cloudCover});

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
      @JsonKey(name: 'cloud') int cloudCover});

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
      @JsonKey(name: 'cloud') required this.cloudCover})
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
  String toString() {
    return 'Weather(date: $date, temperatureC: $temperatureC, condition: $condition, maxWindSpeedKm: $maxWindSpeedKm, cloudCover: $cloudCover)';
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
                .equals(other.cloudCover, cloudCover));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(temperatureC),
      const DeepCollectionEquality().hash(condition),
      const DeepCollectionEquality().hash(maxWindSpeedKm),
      const DeepCollectionEquality().hash(cloudCover));

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
      @JsonKey(name: 'cloud') required final int cloudCover}) = _$_Weather;
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
  @JsonKey(ignore: true)
  _$$_WeatherCopyWith<_$_Weather> get copyWith =>
      throw _privateConstructorUsedError;
}
