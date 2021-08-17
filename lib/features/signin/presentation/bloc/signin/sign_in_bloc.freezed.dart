// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInEventTearOff {
  const _$SignInEventTearOff();

  _Started started() {
    return const _Started();
  }
}

/// @nodoc
const $SignInEvent = _$SignInEventTearOff();

/// @nodoc
mixin _$SignInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInEventCopyWithImpl<$Res> implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  final SignInEvent _value;
  // ignore: unused_field
  final $Res Function(SignInEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$SignInEventCopyWithImpl<$Res>
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
    return 'SignInEvent.started()';
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
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
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
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SignInEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
class _$SignInStateTearOff {
  const _$SignInStateTearOff();

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

  _EmailAlreadyRegistered emailAlreadyRegistered() {
    return const _EmailAlreadyRegistered();
  }

  _EmailNotFound emailNotFound() {
    return const _EmailNotFound();
  }
}

/// @nodoc
const $SignInState = _$SignInStateTearOff();

/// @nodoc
mixin _$SignInState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() signInAllowed,
    required TResult Function() signInDenied,
    required TResult Function() signInCancelled,
    required TResult Function(String message) signInNotification,
    required TResult Function() emailAlreadyRegistered,
    required TResult Function() emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    required TResult Function(_EmailAlreadyRegistered value)
        emailAlreadyRegistered,
    required TResult Function(_EmailNotFound value) emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res> implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  final SignInState _value;
  // ignore: unused_field
  final $Res Function(SignInState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
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
    return 'SignInState.initial()';
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
    required TResult Function() emailAlreadyRegistered,
    required TResult Function() emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    required TResult Function(_EmailAlreadyRegistered value)
        emailAlreadyRegistered,
    required TResult Function(_EmailNotFound value) emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SignInState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$SignInLoadingCopyWith<$Res> {
  factory _$SignInLoadingCopyWith(
          _SignInLoading value, $Res Function(_SignInLoading) then) =
      __$SignInLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInLoadingCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
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
    return 'SignInState.loading()';
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
    required TResult Function() emailAlreadyRegistered,
    required TResult Function() emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    required TResult Function(_EmailAlreadyRegistered value)
        emailAlreadyRegistered,
    required TResult Function(_EmailNotFound value) emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignInLoading implements SignInState {
  const factory _SignInLoading() = _$_SignInLoading;
}

/// @nodoc
abstract class _$SignInAllowedCopyWith<$Res> {
  factory _$SignInAllowedCopyWith(
          _SignInAllowed value, $Res Function(_SignInAllowed) then) =
      __$SignInAllowedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInAllowedCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
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
    return 'SignInState.signInAllowed()';
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
    required TResult Function() emailAlreadyRegistered,
    required TResult Function() emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    required TResult Function(_EmailAlreadyRegistered value)
        emailAlreadyRegistered,
    required TResult Function(_EmailNotFound value) emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (signInAllowed != null) {
      return signInAllowed(this);
    }
    return orElse();
  }
}

abstract class _SignInAllowed implements SignInState {
  const factory _SignInAllowed() = _$_SignInAllowed;
}

/// @nodoc
abstract class _$SignInDeniedCopyWith<$Res> {
  factory _$SignInDeniedCopyWith(
          _SignInDenied value, $Res Function(_SignInDenied) then) =
      __$SignInDeniedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignInDeniedCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
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
    return 'SignInState.signInDenied()';
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
    required TResult Function() emailAlreadyRegistered,
    required TResult Function() emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    required TResult Function(_EmailAlreadyRegistered value)
        emailAlreadyRegistered,
    required TResult Function(_EmailNotFound value) emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (signInDenied != null) {
      return signInDenied(this);
    }
    return orElse();
  }
}

abstract class _SignInDenied implements SignInState {
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
    extends _$SignInStateCopyWithImpl<$Res>
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
    return 'SignInState.signInCancelled()';
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
    required TResult Function() emailAlreadyRegistered,
    required TResult Function() emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    required TResult Function(_EmailAlreadyRegistered value)
        emailAlreadyRegistered,
    required TResult Function(_EmailNotFound value) emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (signInCancelled != null) {
      return signInCancelled(this);
    }
    return orElse();
  }
}

abstract class _SignInCancelled implements SignInState {
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
    extends _$SignInStateCopyWithImpl<$Res>
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
    return 'SignInState.signInNotification(message: $message)';
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
    required TResult Function() emailAlreadyRegistered,
    required TResult Function() emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
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
    required TResult Function(_EmailAlreadyRegistered value)
        emailAlreadyRegistered,
    required TResult Function(_EmailNotFound value) emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (signInNotification != null) {
      return signInNotification(this);
    }
    return orElse();
  }
}

abstract class _SignInNotification implements SignInState {
  const factory _SignInNotification({required String message}) =
      _$_SignInNotification;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SignInNotificationCopyWith<_SignInNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$EmailAlreadyRegisteredCopyWith<$Res> {
  factory _$EmailAlreadyRegisteredCopyWith(_EmailAlreadyRegistered value,
          $Res Function(_EmailAlreadyRegistered) then) =
      __$EmailAlreadyRegisteredCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmailAlreadyRegisteredCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements _$EmailAlreadyRegisteredCopyWith<$Res> {
  __$EmailAlreadyRegisteredCopyWithImpl(_EmailAlreadyRegistered _value,
      $Res Function(_EmailAlreadyRegistered) _then)
      : super(_value, (v) => _then(v as _EmailAlreadyRegistered));

  @override
  _EmailAlreadyRegistered get _value => super._value as _EmailAlreadyRegistered;
}

/// @nodoc

class _$_EmailAlreadyRegistered implements _EmailAlreadyRegistered {
  const _$_EmailAlreadyRegistered();

  @override
  String toString() {
    return 'SignInState.emailAlreadyRegistered()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _EmailAlreadyRegistered);
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
    required TResult Function() emailAlreadyRegistered,
    required TResult Function() emailNotFound,
  }) {
    return emailAlreadyRegistered();
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
  }) {
    return emailAlreadyRegistered?.call();
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
    required TResult orElse(),
  }) {
    if (emailAlreadyRegistered != null) {
      return emailAlreadyRegistered();
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
    required TResult Function(_EmailAlreadyRegistered value)
        emailAlreadyRegistered,
    required TResult Function(_EmailNotFound value) emailNotFound,
  }) {
    return emailAlreadyRegistered(this);
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
  }) {
    return emailAlreadyRegistered?.call(this);
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (emailAlreadyRegistered != null) {
      return emailAlreadyRegistered(this);
    }
    return orElse();
  }
}

abstract class _EmailAlreadyRegistered implements SignInState {
  const factory _EmailAlreadyRegistered() = _$_EmailAlreadyRegistered;
}

/// @nodoc
abstract class _$EmailNotFoundCopyWith<$Res> {
  factory _$EmailNotFoundCopyWith(
          _EmailNotFound value, $Res Function(_EmailNotFound) then) =
      __$EmailNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmailNotFoundCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$EmailNotFoundCopyWith<$Res> {
  __$EmailNotFoundCopyWithImpl(
      _EmailNotFound _value, $Res Function(_EmailNotFound) _then)
      : super(_value, (v) => _then(v as _EmailNotFound));

  @override
  _EmailNotFound get _value => super._value as _EmailNotFound;
}

/// @nodoc

class _$_EmailNotFound implements _EmailNotFound {
  const _$_EmailNotFound();

  @override
  String toString() {
    return 'SignInState.emailNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _EmailNotFound);
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
    required TResult Function() emailAlreadyRegistered,
    required TResult Function() emailNotFound,
  }) {
    return emailNotFound();
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
  }) {
    return emailNotFound?.call();
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
    TResult Function()? emailAlreadyRegistered,
    TResult Function()? emailNotFound,
    required TResult orElse(),
  }) {
    if (emailNotFound != null) {
      return emailNotFound();
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
    required TResult Function(_EmailAlreadyRegistered value)
        emailAlreadyRegistered,
    required TResult Function(_EmailNotFound value) emailNotFound,
  }) {
    return emailNotFound(this);
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
  }) {
    return emailNotFound?.call(this);
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
    TResult Function(_EmailAlreadyRegistered value)? emailAlreadyRegistered,
    TResult Function(_EmailNotFound value)? emailNotFound,
    required TResult orElse(),
  }) {
    if (emailNotFound != null) {
      return emailNotFound(this);
    }
    return orElse();
  }
}

abstract class _EmailNotFound implements SignInState {
  const factory _EmailNotFound() = _$_EmailNotFound;
}
