// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_options_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInOptionsEventTearOff {
  const _$SignInOptionsEventTearOff();

  _Started started() {
    return const _Started();
  }

  SignInWithCredentialEvent signInWithCredentialEvent() {
    return const SignInWithCredentialEvent();
  }

  SignInWithGoogleEvent signInWithGoogleEvent() {
    return const SignInWithGoogleEvent();
  }
}

/// @nodoc
const $SignInOptionsEvent = _$SignInOptionsEventTearOff();

/// @nodoc
mixin _$SignInOptionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() signInWithCredentialEvent,
    required TResult Function() signInWithGoogleEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SignInWithCredentialEvent value)
        signInWithCredentialEvent,
    required TResult Function(SignInWithGoogleEvent value)
        signInWithGoogleEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInWithCredentialEvent value)?
        signInWithCredentialEvent,
    TResult Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInWithCredentialEvent value)?
        signInWithCredentialEvent,
    TResult Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInOptionsEventCopyWith<$Res> {
  factory $SignInOptionsEventCopyWith(
          SignInOptionsEvent value, $Res Function(SignInOptionsEvent) then) =
      _$SignInOptionsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInOptionsEventCopyWithImpl<$Res>
    implements $SignInOptionsEventCopyWith<$Res> {
  _$SignInOptionsEventCopyWithImpl(this._value, this._then);

  final SignInOptionsEvent _value;
  // ignore: unused_field
  final $Res Function(SignInOptionsEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res>
    extends _$SignInOptionsEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'SignInOptionsEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() signInWithCredentialEvent,
    required TResult Function() signInWithGoogleEvent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SignInWithCredentialEvent value)
        signInWithCredentialEvent,
    required TResult Function(SignInWithGoogleEvent value)
        signInWithGoogleEvent,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInWithCredentialEvent value)?
        signInWithCredentialEvent,
    TResult Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInWithCredentialEvent value)?
        signInWithCredentialEvent,
    TResult Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SignInOptionsEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class $SignInWithCredentialEventCopyWith<$Res> {
  factory $SignInWithCredentialEventCopyWith(SignInWithCredentialEvent value,
          $Res Function(SignInWithCredentialEvent) then) =
      _$SignInWithCredentialEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithCredentialEventCopyWithImpl<$Res>
    extends _$SignInOptionsEventCopyWithImpl<$Res>
    implements $SignInWithCredentialEventCopyWith<$Res> {
  _$SignInWithCredentialEventCopyWithImpl(SignInWithCredentialEvent _value,
      $Res Function(SignInWithCredentialEvent) _then)
      : super(_value, (v) => _then(v as SignInWithCredentialEvent));

  @override
  SignInWithCredentialEvent get _value =>
      super._value as SignInWithCredentialEvent;
}

/// @nodoc

class _$SignInWithCredentialEvent implements SignInWithCredentialEvent {
  const _$SignInWithCredentialEvent();

  @override
  String toString() {
    return 'SignInOptionsEvent.signInWithCredentialEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignInWithCredentialEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() signInWithCredentialEvent,
    required TResult Function() signInWithGoogleEvent,
  }) {
    return signInWithCredentialEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
  }) {
    return signInWithCredentialEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (signInWithCredentialEvent != null) {
      return signInWithCredentialEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SignInWithCredentialEvent value)
        signInWithCredentialEvent,
    required TResult Function(SignInWithGoogleEvent value)
        signInWithGoogleEvent,
  }) {
    return signInWithCredentialEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInWithCredentialEvent value)?
        signInWithCredentialEvent,
    TResult Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
  }) {
    return signInWithCredentialEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInWithCredentialEvent value)?
        signInWithCredentialEvent,
    TResult Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (signInWithCredentialEvent != null) {
      return signInWithCredentialEvent(this);
    }
    return orElse();
  }
}

abstract class SignInWithCredentialEvent implements SignInOptionsEvent {
  const factory SignInWithCredentialEvent() = _$SignInWithCredentialEvent;
}

/// @nodoc
abstract class $SignInWithGoogleEventCopyWith<$Res> {
  factory $SignInWithGoogleEventCopyWith(SignInWithGoogleEvent value,
          $Res Function(SignInWithGoogleEvent) then) =
      _$SignInWithGoogleEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithGoogleEventCopyWithImpl<$Res>
    extends _$SignInOptionsEventCopyWithImpl<$Res>
    implements $SignInWithGoogleEventCopyWith<$Res> {
  _$SignInWithGoogleEventCopyWithImpl(
      SignInWithGoogleEvent _value, $Res Function(SignInWithGoogleEvent) _then)
      : super(_value, (v) => _then(v as SignInWithGoogleEvent));

  @override
  SignInWithGoogleEvent get _value => super._value as SignInWithGoogleEvent;
}

/// @nodoc

class _$SignInWithGoogleEvent implements SignInWithGoogleEvent {
  const _$SignInWithGoogleEvent();

  @override
  String toString() {
    return 'SignInOptionsEvent.signInWithGoogleEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignInWithGoogleEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() signInWithCredentialEvent,
    required TResult Function() signInWithGoogleEvent,
  }) {
    return signInWithGoogleEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
  }) {
    return signInWithGoogleEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (signInWithGoogleEvent != null) {
      return signInWithGoogleEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SignInWithCredentialEvent value)
        signInWithCredentialEvent,
    required TResult Function(SignInWithGoogleEvent value)
        signInWithGoogleEvent,
  }) {
    return signInWithGoogleEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInWithCredentialEvent value)?
        signInWithCredentialEvent,
    TResult Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
  }) {
    return signInWithGoogleEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInWithCredentialEvent value)?
        signInWithCredentialEvent,
    TResult Function(SignInWithGoogleEvent value)? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (signInWithGoogleEvent != null) {
      return signInWithGoogleEvent(this);
    }
    return orElse();
  }
}

abstract class SignInWithGoogleEvent implements SignInOptionsEvent {
  const factory SignInWithGoogleEvent() = _$SignInWithGoogleEvent;
}

/// @nodoc
class _$SignInOptionsStateTearOff {
  const _$SignInOptionsStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _SignInLoading loading() {
    return const _SignInLoading();
  }

  _SignInAllowed signInAllowed() {
    return const _SignInAllowed();
  }

  _SignInDenied signInDenied() {
    return const _SignInDenied();
  }

  _SignInCancelled signInCancelled() {
    return const _SignInCancelled();
  }

  _SignInNotification signInNotification({required String message}) {
    return _SignInNotification(
      message: message,
    );
  }
}

/// @nodoc
const $SignInOptionsState = _$SignInOptionsStateTearOff();

/// @nodoc
mixin _$SignInOptionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() signInAllowed,
    required TResult Function() signInDenied,
    required TResult Function() signInCancelled,
    required TResult Function(String message) signInNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignInLoading value) loading,
    required TResult Function(_SignInAllowed value) signInAllowed,
    required TResult Function(_SignInDenied value) signInDenied,
    required TResult Function(_SignInCancelled value) signInCancelled,
    required TResult Function(_SignInNotification value) signInNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInOptionsStateCopyWith<$Res> {
  factory $SignInOptionsStateCopyWith(
          SignInOptionsState value, $Res Function(SignInOptionsState) then) =
      _$SignInOptionsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInOptionsStateCopyWithImpl<$Res>
    implements $SignInOptionsStateCopyWith<$Res> {
  _$SignInOptionsStateCopyWithImpl(this._value, this._then);

  final SignInOptionsState _value;
  // ignore: unused_field
  final $Res Function(SignInOptionsState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$SignInOptionsStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SignInOptionsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() signInAllowed,
    required TResult Function() signInDenied,
    required TResult Function() signInCancelled,
    required TResult Function(String message) signInNotification,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignInLoading value) loading,
    required TResult Function(_SignInAllowed value) signInAllowed,
    required TResult Function(_SignInDenied value) signInDenied,
    required TResult Function(_SignInCancelled value) signInCancelled,
    required TResult Function(_SignInNotification value) signInNotification,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SignInOptionsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$SignInLoadingCopyWith<$Res> {
  factory _$SignInLoadingCopyWith(
          _SignInLoading value, $Res Function(_SignInLoading) then) =
      __$SignInLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInLoadingCopyWithImpl<$Res>
    extends _$SignInOptionsStateCopyWithImpl<$Res>
    implements _$SignInLoadingCopyWith<$Res> {
  __$SignInLoadingCopyWithImpl(
      _SignInLoading _value, $Res Function(_SignInLoading) _then)
      : super(_value, (v) => _then(v as _SignInLoading));

  @override
  _SignInLoading get _value => super._value as _SignInLoading;
}

/// @nodoc

class _$_SignInLoading implements _SignInLoading {
  const _$_SignInLoading();

  @override
  String toString() {
    return 'SignInOptionsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignInLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() signInAllowed,
    required TResult Function() signInDenied,
    required TResult Function() signInCancelled,
    required TResult Function(String message) signInNotification,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignInLoading value) loading,
    required TResult Function(_SignInAllowed value) signInAllowed,
    required TResult Function(_SignInDenied value) signInDenied,
    required TResult Function(_SignInCancelled value) signInCancelled,
    required TResult Function(_SignInNotification value) signInNotification,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignInLoading implements SignInOptionsState {
  const factory _SignInLoading() = _$_SignInLoading;
}

/// @nodoc
abstract class _$SignInAllowedCopyWith<$Res> {
  factory _$SignInAllowedCopyWith(
          _SignInAllowed value, $Res Function(_SignInAllowed) then) =
      __$SignInAllowedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInAllowedCopyWithImpl<$Res>
    extends _$SignInOptionsStateCopyWithImpl<$Res>
    implements _$SignInAllowedCopyWith<$Res> {
  __$SignInAllowedCopyWithImpl(
      _SignInAllowed _value, $Res Function(_SignInAllowed) _then)
      : super(_value, (v) => _then(v as _SignInAllowed));

  @override
  _SignInAllowed get _value => super._value as _SignInAllowed;
}

/// @nodoc

class _$_SignInAllowed implements _SignInAllowed {
  const _$_SignInAllowed();

  @override
  String toString() {
    return 'SignInOptionsState.signInAllowed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignInAllowed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() signInAllowed,
    required TResult Function() signInDenied,
    required TResult Function() signInCancelled,
    required TResult Function(String message) signInNotification,
  }) {
    return signInAllowed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
  }) {
    return signInAllowed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
    required TResult orElse(),
  }) {
    if (signInAllowed != null) {
      return signInAllowed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignInLoading value) loading,
    required TResult Function(_SignInAllowed value) signInAllowed,
    required TResult Function(_SignInDenied value) signInDenied,
    required TResult Function(_SignInCancelled value) signInCancelled,
    required TResult Function(_SignInNotification value) signInNotification,
  }) {
    return signInAllowed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
  }) {
    return signInAllowed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
    required TResult orElse(),
  }) {
    if (signInAllowed != null) {
      return signInAllowed(this);
    }
    return orElse();
  }
}

abstract class _SignInAllowed implements SignInOptionsState {
  const factory _SignInAllowed() = _$_SignInAllowed;
}

/// @nodoc
abstract class _$SignInDeniedCopyWith<$Res> {
  factory _$SignInDeniedCopyWith(
          _SignInDenied value, $Res Function(_SignInDenied) then) =
      __$SignInDeniedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInDeniedCopyWithImpl<$Res>
    extends _$SignInOptionsStateCopyWithImpl<$Res>
    implements _$SignInDeniedCopyWith<$Res> {
  __$SignInDeniedCopyWithImpl(
      _SignInDenied _value, $Res Function(_SignInDenied) _then)
      : super(_value, (v) => _then(v as _SignInDenied));

  @override
  _SignInDenied get _value => super._value as _SignInDenied;
}

/// @nodoc

class _$_SignInDenied implements _SignInDenied {
  const _$_SignInDenied();

  @override
  String toString() {
    return 'SignInOptionsState.signInDenied()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignInDenied);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() signInAllowed,
    required TResult Function() signInDenied,
    required TResult Function() signInCancelled,
    required TResult Function(String message) signInNotification,
  }) {
    return signInDenied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
  }) {
    return signInDenied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
    required TResult orElse(),
  }) {
    if (signInDenied != null) {
      return signInDenied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignInLoading value) loading,
    required TResult Function(_SignInAllowed value) signInAllowed,
    required TResult Function(_SignInDenied value) signInDenied,
    required TResult Function(_SignInCancelled value) signInCancelled,
    required TResult Function(_SignInNotification value) signInNotification,
  }) {
    return signInDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
  }) {
    return signInDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
    required TResult orElse(),
  }) {
    if (signInDenied != null) {
      return signInDenied(this);
    }
    return orElse();
  }
}

abstract class _SignInDenied implements SignInOptionsState {
  const factory _SignInDenied() = _$_SignInDenied;
}

/// @nodoc
abstract class _$SignInCancelledCopyWith<$Res> {
  factory _$SignInCancelledCopyWith(
          _SignInCancelled value, $Res Function(_SignInCancelled) then) =
      __$SignInCancelledCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInCancelledCopyWithImpl<$Res>
    extends _$SignInOptionsStateCopyWithImpl<$Res>
    implements _$SignInCancelledCopyWith<$Res> {
  __$SignInCancelledCopyWithImpl(
      _SignInCancelled _value, $Res Function(_SignInCancelled) _then)
      : super(_value, (v) => _then(v as _SignInCancelled));

  @override
  _SignInCancelled get _value => super._value as _SignInCancelled;
}

/// @nodoc

class _$_SignInCancelled implements _SignInCancelled {
  const _$_SignInCancelled();

  @override
  String toString() {
    return 'SignInOptionsState.signInCancelled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignInCancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() signInAllowed,
    required TResult Function() signInDenied,
    required TResult Function() signInCancelled,
    required TResult Function(String message) signInNotification,
  }) {
    return signInCancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
  }) {
    return signInCancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
    required TResult orElse(),
  }) {
    if (signInCancelled != null) {
      return signInCancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignInLoading value) loading,
    required TResult Function(_SignInAllowed value) signInAllowed,
    required TResult Function(_SignInDenied value) signInDenied,
    required TResult Function(_SignInCancelled value) signInCancelled,
    required TResult Function(_SignInNotification value) signInNotification,
  }) {
    return signInCancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
  }) {
    return signInCancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
    required TResult orElse(),
  }) {
    if (signInCancelled != null) {
      return signInCancelled(this);
    }
    return orElse();
  }
}

abstract class _SignInCancelled implements SignInOptionsState {
  const factory _SignInCancelled() = _$_SignInCancelled;
}

/// @nodoc
abstract class _$SignInNotificationCopyWith<$Res> {
  factory _$SignInNotificationCopyWith(
          _SignInNotification value, $Res Function(_SignInNotification) then) =
      __$SignInNotificationCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$SignInNotificationCopyWithImpl<$Res>
    extends _$SignInOptionsStateCopyWithImpl<$Res>
    implements _$SignInNotificationCopyWith<$Res> {
  __$SignInNotificationCopyWithImpl(
      _SignInNotification _value, $Res Function(_SignInNotification) _then)
      : super(_value, (v) => _then(v as _SignInNotification));

  @override
  _SignInNotification get _value => super._value as _SignInNotification;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_SignInNotification(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignInNotification implements _SignInNotification {
  const _$_SignInNotification({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SignInOptionsState.signInNotification(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInNotification &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$SignInNotificationCopyWith<_SignInNotification> get copyWith =>
      __$SignInNotificationCopyWithImpl<_SignInNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() signInAllowed,
    required TResult Function() signInDenied,
    required TResult Function() signInCancelled,
    required TResult Function(String message) signInNotification,
  }) {
    return signInNotification(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
  }) {
    return signInNotification?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? signInAllowed,
    TResult Function()? signInDenied,
    TResult Function()? signInCancelled,
    TResult Function(String message)? signInNotification,
    required TResult orElse(),
  }) {
    if (signInNotification != null) {
      return signInNotification(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignInLoading value) loading,
    required TResult Function(_SignInAllowed value) signInAllowed,
    required TResult Function(_SignInDenied value) signInDenied,
    required TResult Function(_SignInCancelled value) signInCancelled,
    required TResult Function(_SignInNotification value) signInNotification,
  }) {
    return signInNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
  }) {
    return signInNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInLoading value)? loading,
    TResult Function(_SignInAllowed value)? signInAllowed,
    TResult Function(_SignInDenied value)? signInDenied,
    TResult Function(_SignInCancelled value)? signInCancelled,
    TResult Function(_SignInNotification value)? signInNotification,
    required TResult orElse(),
  }) {
    if (signInNotification != null) {
      return signInNotification(this);
    }
    return orElse();
  }
}

abstract class _SignInNotification implements SignInOptionsState {
  const factory _SignInNotification({required String message}) =
      _$_SignInNotification;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SignInNotificationCopyWith<_SignInNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
