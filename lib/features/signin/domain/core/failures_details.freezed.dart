// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failures_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FailureDetailsTearOff {
  const _$FailureDetailsTearOff();

  _FailureDetails call(
      {required String message, required AuthFailure failedValue}) {
    return _FailureDetails(
      message: message,
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $FailureDetails = _$FailureDetailsTearOff();

/// @nodoc
mixin _$FailureDetails {
  String get message => throw _privateConstructorUsedError;
  AuthFailure get failedValue => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureDetailsCopyWith<FailureDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureDetailsCopyWith<$Res> {
  factory $FailureDetailsCopyWith(
          FailureDetails value, $Res Function(FailureDetails) then) =
      _$FailureDetailsCopyWithImpl<$Res>;
  $Res call({String message, AuthFailure failedValue});

  $AuthFailureCopyWith<$Res> get failedValue;
}

/// @nodoc
class _$FailureDetailsCopyWithImpl<$Res>
    implements $FailureDetailsCopyWith<$Res> {
  _$FailureDetailsCopyWithImpl(this._value, this._then);

  final FailureDetails _value;
  // ignore: unused_field
  final $Res Function(FailureDetails) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as AuthFailure,
    ));
  }

  @override
  $AuthFailureCopyWith<$Res> get failedValue {
    return $AuthFailureCopyWith<$Res>(_value.failedValue, (value) {
      return _then(_value.copyWith(failedValue: value));
    });
  }
}

/// @nodoc
abstract class _$FailureDetailsCopyWith<$Res>
    implements $FailureDetailsCopyWith<$Res> {
  factory _$FailureDetailsCopyWith(
          _FailureDetails value, $Res Function(_FailureDetails) then) =
      __$FailureDetailsCopyWithImpl<$Res>;
  @override
  $Res call({String message, AuthFailure failedValue});

  @override
  $AuthFailureCopyWith<$Res> get failedValue;
}

/// @nodoc
class __$FailureDetailsCopyWithImpl<$Res>
    extends _$FailureDetailsCopyWithImpl<$Res>
    implements _$FailureDetailsCopyWith<$Res> {
  __$FailureDetailsCopyWithImpl(
      _FailureDetails _value, $Res Function(_FailureDetails) _then)
      : super(_value, (v) => _then(v as _FailureDetails));

  @override
  _FailureDetails get _value => super._value as _FailureDetails;

  @override
  $Res call({
    Object? message = freezed,
    Object? failedValue = freezed,
  }) {
    return _then(_FailureDetails(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as AuthFailure,
    ));
  }
}

/// @nodoc

class _$_FailureDetails implements _FailureDetails {
  _$_FailureDetails({required this.message, required this.failedValue});

  @override
  final String message;
  @override
  final AuthFailure failedValue;

  @override
  String toString() {
    return 'FailureDetails(message: $message, failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FailureDetails &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  _$FailureDetailsCopyWith<_FailureDetails> get copyWith =>
      __$FailureDetailsCopyWithImpl<_FailureDetails>(this, _$identity);
}

abstract class _FailureDetails implements FailureDetails {
  factory _FailureDetails(
      {required String message,
      required AuthFailure failedValue}) = _$_FailureDetails;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  AuthFailure get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FailureDetailsCopyWith<_FailureDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
