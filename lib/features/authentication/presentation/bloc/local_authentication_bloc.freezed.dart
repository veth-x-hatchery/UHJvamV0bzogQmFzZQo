// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'local_authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocalAuthenticationEventTearOff {
  const _$LocalAuthenticationEventTearOff();

  _Started started() {
    return const _Started();
  }

  _Request request() {
    return const _Request();
  }
}

/// @nodoc
const $LocalAuthenticationEvent = _$LocalAuthenticationEventTearOff();

/// @nodoc
mixin _$LocalAuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() request,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? request,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? request,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Request value) request,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Request value)? request,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Request value)? request,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalAuthenticationEventCopyWith<$Res> {
  factory $LocalAuthenticationEventCopyWith(LocalAuthenticationEvent value,
          $Res Function(LocalAuthenticationEvent) then) =
      _$LocalAuthenticationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocalAuthenticationEventCopyWithImpl<$Res>
    implements $LocalAuthenticationEventCopyWith<$Res> {
  _$LocalAuthenticationEventCopyWithImpl(this._value, this._then);

  final LocalAuthenticationEvent _value;
  // ignore: unused_field
  final $Res Function(LocalAuthenticationEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res>
    extends _$LocalAuthenticationEventCopyWithImpl<$Res>
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
    return 'LocalAuthenticationEvent.started()';
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
    required TResult Function() request,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? request,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? request,
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
    required TResult Function(_Request value) request,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Request value)? request,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Request value)? request,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements LocalAuthenticationEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$RequestCopyWith<$Res> {
  factory _$RequestCopyWith(_Request value, $Res Function(_Request) then) =
      __$RequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$RequestCopyWithImpl<$Res>
    extends _$LocalAuthenticationEventCopyWithImpl<$Res>
    implements _$RequestCopyWith<$Res> {
  __$RequestCopyWithImpl(_Request _value, $Res Function(_Request) _then)
      : super(_value, (v) => _then(v as _Request));

  @override
  _Request get _value => super._value as _Request;
}

/// @nodoc

class _$_Request implements _Request {
  const _$_Request();

  @override
  String toString() {
    return 'LocalAuthenticationEvent.request()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Request);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() request,
  }) {
    return request();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? request,
  }) {
    return request?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? request,
    required TResult orElse(),
  }) {
    if (request != null) {
      return request();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Request value) request,
  }) {
    return request(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Request value)? request,
  }) {
    return request?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Request value)? request,
    required TResult orElse(),
  }) {
    if (request != null) {
      return request(this);
    }
    return orElse();
  }
}

abstract class _Request implements LocalAuthenticationEvent {
  const factory _Request() = _$_Request;
}

/// @nodoc
class _$LocalAuthenticationStateTearOff {
  const _$LocalAuthenticationStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Authorized authorized() {
    return const _Authorized();
  }

  _Unauthorized unauthorized() {
    return const _Unauthorized();
  }
}

/// @nodoc
const $LocalAuthenticationState = _$LocalAuthenticationStateTearOff();

/// @nodoc
mixin _$LocalAuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorized,
    required TResult Function() unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Unauthorized value) unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Unauthorized value)? unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalAuthenticationStateCopyWith<$Res> {
  factory $LocalAuthenticationStateCopyWith(LocalAuthenticationState value,
          $Res Function(LocalAuthenticationState) then) =
      _$LocalAuthenticationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocalAuthenticationStateCopyWithImpl<$Res>
    implements $LocalAuthenticationStateCopyWith<$Res> {
  _$LocalAuthenticationStateCopyWithImpl(this._value, this._then);

  final LocalAuthenticationState _value;
  // ignore: unused_field
  final $Res Function(LocalAuthenticationState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$LocalAuthenticationStateCopyWithImpl<$Res>
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
    return 'LocalAuthenticationState.initial()';
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
    required TResult Function() authorized,
    required TResult Function() unauthorized,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? unauthorized,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? unauthorized,
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
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Unauthorized value)? unauthorized,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LocalAuthenticationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$AuthorizedCopyWith<$Res> {
  factory _$AuthorizedCopyWith(
          _Authorized value, $Res Function(_Authorized) then) =
      __$AuthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthorizedCopyWithImpl<$Res>
    extends _$LocalAuthenticationStateCopyWithImpl<$Res>
    implements _$AuthorizedCopyWith<$Res> {
  __$AuthorizedCopyWithImpl(
      _Authorized _value, $Res Function(_Authorized) _then)
      : super(_value, (v) => _then(v as _Authorized));

  @override
  _Authorized get _value => super._value as _Authorized;
}

/// @nodoc

class _$_Authorized implements _Authorized {
  const _$_Authorized();

  @override
  String toString() {
    return 'LocalAuthenticationState.authorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Authorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorized,
    required TResult Function() unauthorized,
  }) {
    return authorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? unauthorized,
  }) {
    return authorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Unauthorized value)? unauthorized,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class _Authorized implements LocalAuthenticationState {
  const factory _Authorized() = _$_Authorized;
}

/// @nodoc
abstract class _$UnauthorizedCopyWith<$Res> {
  factory _$UnauthorizedCopyWith(
          _Unauthorized value, $Res Function(_Unauthorized) then) =
      __$UnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnauthorizedCopyWithImpl<$Res>
    extends _$LocalAuthenticationStateCopyWithImpl<$Res>
    implements _$UnauthorizedCopyWith<$Res> {
  __$UnauthorizedCopyWithImpl(
      _Unauthorized _value, $Res Function(_Unauthorized) _then)
      : super(_value, (v) => _then(v as _Unauthorized));

  @override
  _Unauthorized get _value => super._value as _Unauthorized;
}

/// @nodoc

class _$_Unauthorized implements _Unauthorized {
  const _$_Unauthorized();

  @override
  String toString() {
    return 'LocalAuthenticationState.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Unauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorized,
    required TResult Function() unauthorized,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? unauthorized,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Unauthorized value) unauthorized,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Unauthorized value)? unauthorized,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Unauthorized value)? unauthorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized implements LocalAuthenticationState {
  const factory _Unauthorized() = _$_Unauthorized;
}
