// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_secret_reset_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInSecretResetEventTearOff {
  const _$SignInSecretResetEventTearOff();

  ResetPasswordRequest resetPasswordRequest() {
    return const ResetPasswordRequest();
  }
}

/// @nodoc
const $SignInSecretResetEvent = _$SignInSecretResetEventTearOff();

/// @nodoc
mixin _$SignInSecretResetEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() resetPasswordRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? resetPasswordRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? resetPasswordRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPasswordRequest value) resetPasswordRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ResetPasswordRequest value)? resetPasswordRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPasswordRequest value)? resetPasswordRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInSecretResetEventCopyWith<$Res> {
  factory $SignInSecretResetEventCopyWith(SignInSecretResetEvent value,
          $Res Function(SignInSecretResetEvent) then) =
      _$SignInSecretResetEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInSecretResetEventCopyWithImpl<$Res>
    implements $SignInSecretResetEventCopyWith<$Res> {
  _$SignInSecretResetEventCopyWithImpl(this._value, this._then);

  final SignInSecretResetEvent _value;
  // ignore: unused_field
  final $Res Function(SignInSecretResetEvent) _then;
}

/// @nodoc
abstract class $ResetPasswordRequestCopyWith<$Res> {
  factory $ResetPasswordRequestCopyWith(ResetPasswordRequest value,
          $Res Function(ResetPasswordRequest) then) =
      _$ResetPasswordRequestCopyWithImpl<$Res>;
}

/// @nodoc
class _$ResetPasswordRequestCopyWithImpl<$Res>
    extends _$SignInSecretResetEventCopyWithImpl<$Res>
    implements $ResetPasswordRequestCopyWith<$Res> {
  _$ResetPasswordRequestCopyWithImpl(
      ResetPasswordRequest _value, $Res Function(ResetPasswordRequest) _then)
      : super(_value, (v) => _then(v as ResetPasswordRequest));

  @override
  ResetPasswordRequest get _value => super._value as ResetPasswordRequest;
}

/// @nodoc

class _$ResetPasswordRequest implements ResetPasswordRequest {
  const _$ResetPasswordRequest();

  @override
  String toString() {
    return 'SignInSecretResetEvent.resetPasswordRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ResetPasswordRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() resetPasswordRequest,
  }) {
    return resetPasswordRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? resetPasswordRequest,
  }) {
    return resetPasswordRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? resetPasswordRequest,
    required TResult orElse(),
  }) {
    if (resetPasswordRequest != null) {
      return resetPasswordRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPasswordRequest value) resetPasswordRequest,
  }) {
    return resetPasswordRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ResetPasswordRequest value)? resetPasswordRequest,
  }) {
    return resetPasswordRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPasswordRequest value)? resetPasswordRequest,
    required TResult orElse(),
  }) {
    if (resetPasswordRequest != null) {
      return resetPasswordRequest(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordRequest implements SignInSecretResetEvent {
  const factory ResetPasswordRequest() = _$ResetPasswordRequest;
}

/// @nodoc
class _$SignInSecretResetStateTearOff {
  const _$SignInSecretResetStateTearOff();

  _SignInSecretResetState call(
      {required bool isLoading,
      required Option<VethxNotification> notification}) {
    return _SignInSecretResetState(
      isLoading: isLoading,
      notification: notification,
    );
  }
}

/// @nodoc
const $SignInSecretResetState = _$SignInSecretResetStateTearOff();

/// @nodoc
mixin _$SignInSecretResetState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<VethxNotification> get notification =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInSecretResetStateCopyWith<SignInSecretResetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInSecretResetStateCopyWith<$Res> {
  factory $SignInSecretResetStateCopyWith(SignInSecretResetState value,
          $Res Function(SignInSecretResetState) then) =
      _$SignInSecretResetStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, Option<VethxNotification> notification});
}

/// @nodoc
class _$SignInSecretResetStateCopyWithImpl<$Res>
    implements $SignInSecretResetStateCopyWith<$Res> {
  _$SignInSecretResetStateCopyWithImpl(this._value, this._then);

  final SignInSecretResetState _value;
  // ignore: unused_field
  final $Res Function(SignInSecretResetState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? notification = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Option<VethxNotification>,
    ));
  }
}

/// @nodoc
abstract class _$SignInSecretResetStateCopyWith<$Res>
    implements $SignInSecretResetStateCopyWith<$Res> {
  factory _$SignInSecretResetStateCopyWith(_SignInSecretResetState value,
          $Res Function(_SignInSecretResetState) then) =
      __$SignInSecretResetStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, Option<VethxNotification> notification});
}

/// @nodoc
class __$SignInSecretResetStateCopyWithImpl<$Res>
    extends _$SignInSecretResetStateCopyWithImpl<$Res>
    implements _$SignInSecretResetStateCopyWith<$Res> {
  __$SignInSecretResetStateCopyWithImpl(_SignInSecretResetState _value,
      $Res Function(_SignInSecretResetState) _then)
      : super(_value, (v) => _then(v as _SignInSecretResetState));

  @override
  _SignInSecretResetState get _value => super._value as _SignInSecretResetState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? notification = freezed,
  }) {
    return _then(_SignInSecretResetState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Option<VethxNotification>,
    ));
  }
}

/// @nodoc

class _$_SignInSecretResetState implements _SignInSecretResetState {
  const _$_SignInSecretResetState(
      {required this.isLoading, required this.notification});

  @override
  final bool isLoading;
  @override
  final Option<VethxNotification> notification;

  @override
  String toString() {
    return 'SignInSecretResetState(isLoading: $isLoading, notification: $notification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInSecretResetState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.notification, notification) ||
                const DeepCollectionEquality()
                    .equals(other.notification, notification)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(notification);

  @JsonKey(ignore: true)
  @override
  _$SignInSecretResetStateCopyWith<_SignInSecretResetState> get copyWith =>
      __$SignInSecretResetStateCopyWithImpl<_SignInSecretResetState>(
          this, _$identity);
}

abstract class _SignInSecretResetState implements SignInSecretResetState {
  const factory _SignInSecretResetState(
          {required bool isLoading,
          required Option<VethxNotification> notification}) =
      _$_SignInSecretResetState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Option<VethxNotification> get notification =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignInSecretResetStateCopyWith<_SignInSecretResetState> get copyWith =>
      throw _privateConstructorUsedError;
}
