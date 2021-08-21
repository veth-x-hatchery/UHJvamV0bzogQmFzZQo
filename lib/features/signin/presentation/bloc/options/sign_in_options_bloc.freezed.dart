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
class _$SignInEventTearOff {
  const _$SignInEventTearOff();

  _Started started() {
    return const _Started();
  }

  SignInWithCredentialEvent signInWithCredentialEvent(
      {required Credential credential, required Secret secret}) {
    return SignInWithCredentialEvent(
      credential: credential,
      secret: secret,
    );
  }

  SignInWithGoogleEvent signInWithGoogleEvent() {
    return const SignInWithGoogleEvent();
  }
}

/// @nodoc
const $SignInEvent = _$SignInEventTearOff();

/// @nodoc
mixin _$SignInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Credential credential, Secret secret)
        signInWithCredentialEvent,
    required TResult Function() signInWithGoogleEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Credential credential, Secret secret)?
        signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Credential credential, Secret secret)?
        signInWithCredentialEvent,
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
    required TResult Function(Credential credential, Secret secret)
        signInWithCredentialEvent,
    required TResult Function() signInWithGoogleEvent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Credential credential, Secret secret)?
        signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Credential credential, Secret secret)?
        signInWithCredentialEvent,
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

abstract class _Started implements SignInEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class $SignInWithCredentialEventCopyWith<$Res> {
  factory $SignInWithCredentialEventCopyWith(SignInWithCredentialEvent value,
          $Res Function(SignInWithCredentialEvent) then) =
      _$SignInWithCredentialEventCopyWithImpl<$Res>;
  $Res call({Credential credential, Secret secret});
}

/// @nodoc
class _$SignInWithCredentialEventCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements $SignInWithCredentialEventCopyWith<$Res> {
  _$SignInWithCredentialEventCopyWithImpl(SignInWithCredentialEvent _value,
      $Res Function(SignInWithCredentialEvent) _then)
      : super(_value, (v) => _then(v as SignInWithCredentialEvent));

  @override
  SignInWithCredentialEvent get _value =>
      super._value as SignInWithCredentialEvent;

  @override
  $Res call({
    Object? credential = freezed,
    Object? secret = freezed,
  }) {
    return _then(SignInWithCredentialEvent(
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as Credential,
      secret: secret == freezed
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as Secret,
    ));
  }
}

/// @nodoc

class _$SignInWithCredentialEvent implements SignInWithCredentialEvent {
  const _$SignInWithCredentialEvent(
      {required this.credential, required this.secret});

  @override
  final Credential credential;
  @override
  final Secret secret;

  @override
  String toString() {
    return 'SignInEvent.signInWithCredentialEvent(credential: $credential, secret: $secret)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignInWithCredentialEvent &&
            (identical(other.credential, credential) ||
                const DeepCollectionEquality()
                    .equals(other.credential, credential)) &&
            (identical(other.secret, secret) ||
                const DeepCollectionEquality().equals(other.secret, secret)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(credential) ^
      const DeepCollectionEquality().hash(secret);

  @JsonKey(ignore: true)
  @override
  $SignInWithCredentialEventCopyWith<SignInWithCredentialEvent> get copyWith =>
      _$SignInWithCredentialEventCopyWithImpl<SignInWithCredentialEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Credential credential, Secret secret)
        signInWithCredentialEvent,
    required TResult Function() signInWithGoogleEvent,
  }) {
    return signInWithCredentialEvent(credential, secret);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Credential credential, Secret secret)?
        signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
  }) {
    return signInWithCredentialEvent?.call(credential, secret);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Credential credential, Secret secret)?
        signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
    required TResult orElse(),
  }) {
    if (signInWithCredentialEvent != null) {
      return signInWithCredentialEvent(credential, secret);
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

abstract class SignInWithCredentialEvent implements SignInEvent {
  const factory SignInWithCredentialEvent(
      {required Credential credential,
      required Secret secret}) = _$SignInWithCredentialEvent;

  Credential get credential => throw _privateConstructorUsedError;
  Secret get secret => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInWithCredentialEventCopyWith<SignInWithCredentialEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithGoogleEventCopyWith<$Res> {
  factory $SignInWithGoogleEventCopyWith(SignInWithGoogleEvent value,
          $Res Function(SignInWithGoogleEvent) then) =
      _$SignInWithGoogleEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithGoogleEventCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
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
    return 'SignInEvent.signInWithGoogleEvent()';
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
    required TResult Function(Credential credential, Secret secret)
        signInWithCredentialEvent,
    required TResult Function() signInWithGoogleEvent,
  }) {
    return signInWithGoogleEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Credential credential, Secret secret)?
        signInWithCredentialEvent,
    TResult Function()? signInWithGoogleEvent,
  }) {
    return signInWithGoogleEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Credential credential, Secret secret)?
        signInWithCredentialEvent,
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

abstract class SignInWithGoogleEvent implements SignInEvent {
  const factory SignInWithGoogleEvent() = _$SignInWithGoogleEvent;
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

  _CredentialAlreadyRegistered credentialAlreadyRegistered() {
    return const _CredentialAlreadyRegistered();
  }

  _CredentialNotFound credentialNotFound() {
    return const _CredentialNotFound();
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
    required TResult Function() credentialAlreadyRegistered,
    required TResult Function() credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    required TResult Function(_CredentialAlreadyRegistered value)
        credentialAlreadyRegistered,
    required TResult Function(_CredentialNotFound value) credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    required TResult Function() credentialAlreadyRegistered,
    required TResult Function() credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    required TResult Function(_CredentialAlreadyRegistered value)
        credentialAlreadyRegistered,
    required TResult Function(_CredentialNotFound value) credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    required TResult Function() credentialAlreadyRegistered,
    required TResult Function() credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    required TResult Function(_CredentialAlreadyRegistered value)
        credentialAlreadyRegistered,
    required TResult Function(_CredentialNotFound value) credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    required TResult Function() credentialAlreadyRegistered,
    required TResult Function() credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    required TResult Function(_CredentialAlreadyRegistered value)
        credentialAlreadyRegistered,
    required TResult Function(_CredentialNotFound value) credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    required TResult Function() credentialAlreadyRegistered,
    required TResult Function() credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    required TResult Function(_CredentialAlreadyRegistered value)
        credentialAlreadyRegistered,
    required TResult Function(_CredentialNotFound value) credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    required TResult Function() credentialAlreadyRegistered,
    required TResult Function() credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    required TResult Function(_CredentialAlreadyRegistered value)
        credentialAlreadyRegistered,
    required TResult Function(_CredentialNotFound value) credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    required TResult Function() credentialAlreadyRegistered,
    required TResult Function() credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
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
    required TResult Function(_CredentialAlreadyRegistered value)
        credentialAlreadyRegistered,
    required TResult Function(_CredentialNotFound value) credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
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
abstract class _$CredentialAlreadyRegisteredCopyWith<$Res> {
  factory _$CredentialAlreadyRegisteredCopyWith(
          _CredentialAlreadyRegistered value,
          $Res Function(_CredentialAlreadyRegistered) then) =
      __$CredentialAlreadyRegisteredCopyWithImpl<$Res>;
}

/// @nodoc
class __$CredentialAlreadyRegisteredCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements _$CredentialAlreadyRegisteredCopyWith<$Res> {
  __$CredentialAlreadyRegisteredCopyWithImpl(
      _CredentialAlreadyRegistered _value,
      $Res Function(_CredentialAlreadyRegistered) _then)
      : super(_value, (v) => _then(v as _CredentialAlreadyRegistered));

  @override
  _CredentialAlreadyRegistered get _value =>
      super._value as _CredentialAlreadyRegistered;
}

/// @nodoc

class _$_CredentialAlreadyRegistered implements _CredentialAlreadyRegistered {
  const _$_CredentialAlreadyRegistered();

  @override
  String toString() {
    return 'SignInState.credentialAlreadyRegistered()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _CredentialAlreadyRegistered);
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
    required TResult Function() credentialAlreadyRegistered,
    required TResult Function() credentialNotFound,
  }) {
    return credentialAlreadyRegistered();
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
  }) {
    return credentialAlreadyRegistered?.call();
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
    required TResult orElse(),
  }) {
    if (credentialAlreadyRegistered != null) {
      return credentialAlreadyRegistered();
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
    required TResult Function(_CredentialAlreadyRegistered value)
        credentialAlreadyRegistered,
    required TResult Function(_CredentialNotFound value) credentialNotFound,
  }) {
    return credentialAlreadyRegistered(this);
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
  }) {
    return credentialAlreadyRegistered?.call(this);
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
    required TResult orElse(),
  }) {
    if (credentialAlreadyRegistered != null) {
      return credentialAlreadyRegistered(this);
    }
    return orElse();
  }
}

abstract class _CredentialAlreadyRegistered implements SignInState {
  const factory _CredentialAlreadyRegistered() = _$_CredentialAlreadyRegistered;
}

/// @nodoc
abstract class _$CredentialNotFoundCopyWith<$Res> {
  factory _$CredentialNotFoundCopyWith(
          _CredentialNotFound value, $Res Function(_CredentialNotFound) then) =
      __$CredentialNotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$CredentialNotFoundCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements _$CredentialNotFoundCopyWith<$Res> {
  __$CredentialNotFoundCopyWithImpl(
      _CredentialNotFound _value, $Res Function(_CredentialNotFound) _then)
      : super(_value, (v) => _then(v as _CredentialNotFound));

  @override
  _CredentialNotFound get _value => super._value as _CredentialNotFound;
}

/// @nodoc

class _$_CredentialNotFound implements _CredentialNotFound {
  const _$_CredentialNotFound();

  @override
  String toString() {
    return 'SignInState.credentialNotFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _CredentialNotFound);
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
    required TResult Function() credentialAlreadyRegistered,
    required TResult Function() credentialNotFound,
  }) {
    return credentialNotFound();
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
  }) {
    return credentialNotFound?.call();
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
    TResult Function()? credentialAlreadyRegistered,
    TResult Function()? credentialNotFound,
    required TResult orElse(),
  }) {
    if (credentialNotFound != null) {
      return credentialNotFound();
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
    required TResult Function(_CredentialAlreadyRegistered value)
        credentialAlreadyRegistered,
    required TResult Function(_CredentialNotFound value) credentialNotFound,
  }) {
    return credentialNotFound(this);
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
  }) {
    return credentialNotFound?.call(this);
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
    TResult Function(_CredentialAlreadyRegistered value)?
        credentialAlreadyRegistered,
    TResult Function(_CredentialNotFound value)? credentialNotFound,
    required TResult orElse(),
  }) {
    if (credentialNotFound != null) {
      return credentialNotFound(this);
    }
    return orElse();
  }
}

abstract class _CredentialNotFound implements SignInState {
  const factory _CredentialNotFound() = _$_CredentialNotFound;
}
