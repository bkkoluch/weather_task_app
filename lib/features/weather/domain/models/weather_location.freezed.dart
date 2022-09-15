// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherLocation _$WeatherLocationFromJson(Map<String, dynamic> json) {
  return _WeatherLocation.fromJson(json);
}

/// @nodoc
mixin _$WeatherLocation {
  String get name => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'localtime')
  String get localTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherLocationCopyWith<WeatherLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherLocationCopyWith<$Res> {
  factory $WeatherLocationCopyWith(
          WeatherLocation value, $Res Function(WeatherLocation) then) =
      _$WeatherLocationCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String region,
      String country,
      @JsonKey(name: 'localtime') String localTime});
}

/// @nodoc
class _$WeatherLocationCopyWithImpl<$Res>
    implements $WeatherLocationCopyWith<$Res> {
  _$WeatherLocationCopyWithImpl(this._value, this._then);

  final WeatherLocation _value;
  // ignore: unused_field
  final $Res Function(WeatherLocation) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? region = freezed,
    Object? country = freezed,
    Object? localTime = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      localTime: localTime == freezed
          ? _value.localTime
          : localTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_WeatherLocationCopyWith<$Res>
    implements $WeatherLocationCopyWith<$Res> {
  factory _$$_WeatherLocationCopyWith(
          _$_WeatherLocation value, $Res Function(_$_WeatherLocation) then) =
      __$$_WeatherLocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String region,
      String country,
      @JsonKey(name: 'localtime') String localTime});
}

/// @nodoc
class __$$_WeatherLocationCopyWithImpl<$Res>
    extends _$WeatherLocationCopyWithImpl<$Res>
    implements _$$_WeatherLocationCopyWith<$Res> {
  __$$_WeatherLocationCopyWithImpl(
      _$_WeatherLocation _value, $Res Function(_$_WeatherLocation) _then)
      : super(_value, (v) => _then(v as _$_WeatherLocation));

  @override
  _$_WeatherLocation get _value => super._value as _$_WeatherLocation;

  @override
  $Res call({
    Object? name = freezed,
    Object? region = freezed,
    Object? country = freezed,
    Object? localTime = freezed,
  }) {
    return _then(_$_WeatherLocation(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      localTime: localTime == freezed
          ? _value.localTime
          : localTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherLocation extends _WeatherLocation {
  const _$_WeatherLocation(
      {required this.name,
      required this.region,
      required this.country,
      @JsonKey(name: 'localtime') required this.localTime})
      : super._();

  factory _$_WeatherLocation.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherLocationFromJson(json);

  @override
  final String name;
  @override
  final String region;
  @override
  final String country;
  @override
  @JsonKey(name: 'localtime')
  final String localTime;

  @override
  String toString() {
    return 'WeatherLocation(name: $name, region: $region, country: $country, localTime: $localTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherLocation &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.region, region) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.localTime, localTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(region),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(localTime));

  @JsonKey(ignore: true)
  @override
  _$$_WeatherLocationCopyWith<_$_WeatherLocation> get copyWith =>
      __$$_WeatherLocationCopyWithImpl<_$_WeatherLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherLocationToJson(
      this,
    );
  }
}

abstract class _WeatherLocation extends WeatherLocation {
  const factory _WeatherLocation(
          {required final String name,
          required final String region,
          required final String country,
          @JsonKey(name: 'localtime') required final String localTime}) =
      _$_WeatherLocation;
  const _WeatherLocation._() : super._();

  factory _WeatherLocation.fromJson(Map<String, dynamic> json) =
      _$_WeatherLocation.fromJson;

  @override
  String get name;
  @override
  String get region;
  @override
  String get country;
  @override
  @JsonKey(name: 'localtime')
  String get localTime;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherLocationCopyWith<_$_WeatherLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
