// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_with_credential_and_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ParamsTearOff {
  const _$ParamsTearOff();

  _Params call({required Credentials credentials}) {
    return _Params(
      credentials: credentials,
    );
  }
}

/// @nodoc
const $Params = _$ParamsTearOff();

/// @nodoc
mixin _$Params {
  Credentials get credentials => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ParamsCopyWith<Params> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParamsCopyWith<$Res> {
  factory $ParamsCopyWith(Params value, $Res Function(Params) then) =
      _$ParamsCopyWithImpl<$Res>;
  $Res call({Credentials credentials});
}

/// @nodoc
class _$ParamsCopyWithImpl<$Res> implements $ParamsCopyWith<$Res> {
  _$ParamsCopyWithImpl(this._value, this._then);

  final Params _value;
  // ignore: unused_field
  final $Res Function(Params) _then;

  @override
  $Res call({
    Object? credentials = freezed,
  }) {
    return _then(_value.copyWith(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials,
    ));
  }
}

/// @nodoc
abstract class _$ParamsCopyWith<$Res> implements $ParamsCopyWith<$Res> {
  factory _$ParamsCopyWith(_Params value, $Res Function(_Params) then) =
      __$ParamsCopyWithImpl<$Res>;
  @override
  $Res call({Credentials credentials});
}

/// @nodoc
class __$ParamsCopyWithImpl<$Res> extends _$ParamsCopyWithImpl<$Res>
    implements _$ParamsCopyWith<$Res> {
  __$ParamsCopyWithImpl(_Params _value, $Res Function(_Params) _then)
      : super(_value, (v) => _then(v as _Params));

  @override
  _Params get _value => super._value as _Params;

  @override
  $Res call({
    Object? credentials = freezed,
  }) {
    return _then(_Params(
      credentials: credentials == freezed
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as Credentials,
    ));
  }
}

/// @nodoc

class _$_Params implements _Params {
  const _$_Params({required this.credentials});

  @override
  final Credentials credentials;

  @override
  String toString() {
    return 'Params(credentials: $credentials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Params &&
            (identical(other.credentials, credentials) ||
                const DeepCollectionEquality()
                    .equals(other.credentials, credentials)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(credentials);

  @JsonKey(ignore: true)
  @override
  _$ParamsCopyWith<_Params> get copyWith =>
      __$ParamsCopyWithImpl<_Params>(this, _$identity);
}

abstract class _Params implements Params {
  const factory _Params({required Credentials credentials}) = _$_Params;

  @override
  Credentials get credentials => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ParamsCopyWith<_Params> get copyWith => throw _privateConstructorUsedError;
}
