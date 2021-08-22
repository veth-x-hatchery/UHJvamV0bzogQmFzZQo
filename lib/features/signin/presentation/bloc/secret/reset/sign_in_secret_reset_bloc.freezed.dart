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
class _$SignInPasswordResetEventTearOff {
  const _$SignInPasswordResetEventTearOff();

  ResetPasswordRequest resetPasswordRequest() {
    return const ResetPasswordRequest();
  }
}

/// @nodoc
const $SignInPasswordResetEvent = _$SignInPasswordResetEventTearOff();

/// @nodoc
mixin _$SignInPasswordResetEvent {
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
abstract class $SignInPasswordResetEventCopyWith<$Res> {
  factory $SignInPasswordResetEventCopyWith(SignInPasswordResetEvent value,
          $Res Function(SignInPasswordResetEvent) then) =
      _$SignInPasswordResetEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInPasswordResetEventCopyWithImpl<$Res>
    implements $SignInPasswordResetEventCopyWith<$Res> {
  _$SignInPasswordResetEventCopyWithImpl(this._value, this._then);

  final SignInPasswordResetEvent _value;
  // ignore: unused_field
  final $Res Function(SignInPasswordResetEvent) _then;
}

/// @nodoc
abstract class $ResetPasswordRequestCopyWith<$Res> {
  factory $ResetPasswordRequestCopyWith(ResetPasswordRequest value,
          $Res Function(ResetPasswordRequest) then) =
      _$ResetPasswordRequestCopyWithImpl<$Res>;
}

/// @nodoc
class _$ResetPasswordRequestCopyWithImpl<$Res>
    extends _$SignInPasswordResetEventCopyWithImpl<$Res>
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
    return 'SignInPasswordResetEvent.resetPasswordRequest()';
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

abstract class ResetPasswordRequest implements SignInPasswordResetEvent {
  const factory ResetPasswordRequest() = _$ResetPasswordRequest;
}

/// @nodoc
class _$SignInPasswordResetStateTearOff {
  const _$SignInPasswordResetStateTearOff();

  _SignInPasswordResetState call(
      {required Option<VethxNotification> notification}) {
    return _SignInPasswordResetState(
      notification: notification,
    );
  }
}

/// @nodoc
const $SignInPasswordResetState = _$SignInPasswordResetStateTearOff();

/// @nodoc
mixin _$SignInPasswordResetState {
  Option<VethxNotification> get notification =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInPasswordResetStateCopyWith<SignInPasswordResetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPasswordResetStateCopyWith<$Res> {
  factory $SignInPasswordResetStateCopyWith(SignInPasswordResetState value,
          $Res Function(SignInPasswordResetState) then) =
      _$SignInPasswordResetStateCopyWithImpl<$Res>;
  $Res call({Option<VethxNotification> notification});
}

/// @nodoc
class _$SignInPasswordResetStateCopyWithImpl<$Res>
    implements $SignInPasswordResetStateCopyWith<$Res> {
  _$SignInPasswordResetStateCopyWithImpl(this._value, this._then);

  final SignInPasswordResetState _value;
  // ignore: unused_field
  final $Res Function(SignInPasswordResetState) _then;

  @override
  $Res call({
    Object? notification = freezed,
  }) {
    return _then(_value.copyWith(
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Option<VethxNotification>,
    ));
  }
}

/// @nodoc
abstract class _$SignInPasswordResetStateCopyWith<$Res>
    implements $SignInPasswordResetStateCopyWith<$Res> {
  factory _$SignInPasswordResetStateCopyWith(_SignInPasswordResetState value,
          $Res Function(_SignInPasswordResetState) then) =
      __$SignInPasswordResetStateCopyWithImpl<$Res>;
  @override
  $Res call({Option<VethxNotification> notification});
}

/// @nodoc
class __$SignInPasswordResetStateCopyWithImpl<$Res>
    extends _$SignInPasswordResetStateCopyWithImpl<$Res>
    implements _$SignInPasswordResetStateCopyWith<$Res> {
  __$SignInPasswordResetStateCopyWithImpl(_SignInPasswordResetState _value,
      $Res Function(_SignInPasswordResetState) _then)
      : super(_value, (v) => _then(v as _SignInPasswordResetState));

  @override
  _SignInPasswordResetState get _value =>
      super._value as _SignInPasswordResetState;

  @override
  $Res call({
    Object? notification = freezed,
  }) {
    return _then(_SignInPasswordResetState(
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Option<VethxNotification>,
    ));
  }
}

/// @nodoc

class _$_SignInPasswordResetState implements _SignInPasswordResetState {
  const _$_SignInPasswordResetState({required this.notification});

  @override
  final Option<VethxNotification> notification;

  @override
  String toString() {
    return 'SignInPasswordResetState(notification: $notification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInPasswordResetState &&
            (identical(other.notification, notification) ||
                const DeepCollectionEquality()
                    .equals(other.notification, notification)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(notification);

  @JsonKey(ignore: true)
  @override
  _$SignInPasswordResetStateCopyWith<_SignInPasswordResetState> get copyWith =>
      __$SignInPasswordResetStateCopyWithImpl<_SignInPasswordResetState>(
          this, _$identity);
}

abstract class _SignInPasswordResetState implements SignInPasswordResetState {
  const factory _SignInPasswordResetState(
          {required Option<VethxNotification> notification}) =
      _$_SignInPasswordResetState;

  @override
  Option<VethxNotification> get notification =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignInPasswordResetStateCopyWith<_SignInPasswordResetState> get copyWith =>
      throw _privateConstructorUsedError;
}
