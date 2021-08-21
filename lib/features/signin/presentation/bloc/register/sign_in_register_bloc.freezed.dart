// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInRegisterEventTearOff {
  const _$SignInRegisterEventTearOff();

  CredentialChanged credentialChanged(String credentialStr) {
    return CredentialChanged(
      credentialStr,
    );
  }

  PasswordChanged secretChanged(String secretStr) {
    return PasswordChanged(
      secretStr,
    );
  }

  RegisterWithCredentialAndPasswordPressed
      registerWithCredentialAndPasswordPressed() {
    return const RegisterWithCredentialAndPasswordPressed();
  }
}

/// @nodoc
const $SignInRegisterEvent = _$SignInRegisterEventTearOff();

/// @nodoc
mixin _$SignInRegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String credentialStr) credentialChanged,
    required TResult Function(String secretStr) secretChanged,
    required TResult Function() registerWithCredentialAndPasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String credentialStr)? credentialChanged,
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? registerWithCredentialAndPasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String credentialStr)? credentialChanged,
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? registerWithCredentialAndPasswordPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialChanged value) credentialChanged,
    required TResult Function(PasswordChanged value) secretChanged,
    required TResult Function(RegisterWithCredentialAndPasswordPressed value)
        registerWithCredentialAndPasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CredentialChanged value)? credentialChanged,
    TResult Function(PasswordChanged value)? secretChanged,
    TResult Function(RegisterWithCredentialAndPasswordPressed value)?
        registerWithCredentialAndPasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CredentialChanged value)? credentialChanged,
    TResult Function(PasswordChanged value)? secretChanged,
    TResult Function(RegisterWithCredentialAndPasswordPressed value)?
        registerWithCredentialAndPasswordPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInRegisterEventCopyWith<$Res> {
  factory $SignInRegisterEventCopyWith(
          SignInRegisterEvent value, $Res Function(SignInRegisterEvent) then) =
      _$SignInRegisterEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInRegisterEventCopyWithImpl<$Res>
    implements $SignInRegisterEventCopyWith<$Res> {
  _$SignInRegisterEventCopyWithImpl(this._value, this._then);

  final SignInRegisterEvent _value;
  // ignore: unused_field
  final $Res Function(SignInRegisterEvent) _then;
}

/// @nodoc
abstract class $CredentialChangedCopyWith<$Res> {
  factory $CredentialChangedCopyWith(
          CredentialChanged value, $Res Function(CredentialChanged) then) =
      _$CredentialChangedCopyWithImpl<$Res>;
  $Res call({String credentialStr});
}

/// @nodoc
class _$CredentialChangedCopyWithImpl<$Res>
    extends _$SignInRegisterEventCopyWithImpl<$Res>
    implements $CredentialChangedCopyWith<$Res> {
  _$CredentialChangedCopyWithImpl(
      CredentialChanged _value, $Res Function(CredentialChanged) _then)
      : super(_value, (v) => _then(v as CredentialChanged));

  @override
  CredentialChanged get _value => super._value as CredentialChanged;

  @override
  $Res call({
    Object? credentialStr = freezed,
  }) {
    return _then(CredentialChanged(
      credentialStr == freezed
          ? _value.credentialStr
          : credentialStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CredentialChanged implements CredentialChanged {
  const _$CredentialChanged(this.credentialStr);

  @override
  final String credentialStr;

  @override
  String toString() {
    return 'SignInRegisterEvent.credentialChanged(credentialStr: $credentialStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CredentialChanged &&
            (identical(other.credentialStr, credentialStr) ||
                const DeepCollectionEquality()
                    .equals(other.credentialStr, credentialStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(credentialStr);

  @JsonKey(ignore: true)
  @override
  $CredentialChangedCopyWith<CredentialChanged> get copyWith =>
      _$CredentialChangedCopyWithImpl<CredentialChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String credentialStr) credentialChanged,
    required TResult Function(String secretStr) secretChanged,
    required TResult Function() registerWithCredentialAndPasswordPressed,
  }) {
    return credentialChanged(credentialStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String credentialStr)? credentialChanged,
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? registerWithCredentialAndPasswordPressed,
  }) {
    return credentialChanged?.call(credentialStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String credentialStr)? credentialChanged,
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? registerWithCredentialAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (credentialChanged != null) {
      return credentialChanged(credentialStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialChanged value) credentialChanged,
    required TResult Function(PasswordChanged value) secretChanged,
    required TResult Function(RegisterWithCredentialAndPasswordPressed value)
        registerWithCredentialAndPasswordPressed,
  }) {
    return credentialChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CredentialChanged value)? credentialChanged,
    TResult Function(PasswordChanged value)? secretChanged,
    TResult Function(RegisterWithCredentialAndPasswordPressed value)?
        registerWithCredentialAndPasswordPressed,
  }) {
    return credentialChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CredentialChanged value)? credentialChanged,
    TResult Function(PasswordChanged value)? secretChanged,
    TResult Function(RegisterWithCredentialAndPasswordPressed value)?
        registerWithCredentialAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (credentialChanged != null) {
      return credentialChanged(this);
    }
    return orElse();
  }
}

abstract class CredentialChanged implements SignInRegisterEvent {
  const factory CredentialChanged(String credentialStr) = _$CredentialChanged;

  String get credentialStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CredentialChangedCopyWith<CredentialChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordChangedCopyWith<$Res> {
  factory $PasswordChangedCopyWith(
          PasswordChanged value, $Res Function(PasswordChanged) then) =
      _$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String secretStr});
}

/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    extends _$SignInRegisterEventCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(
      PasswordChanged _value, $Res Function(PasswordChanged) _then)
      : super(_value, (v) => _then(v as PasswordChanged));

  @override
  PasswordChanged get _value => super._value as PasswordChanged;

  @override
  $Res call({
    Object? secretStr = freezed,
  }) {
    return _then(PasswordChanged(
      secretStr == freezed
          ? _value.secretStr
          : secretStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.secretStr);

  @override
  final String secretStr;

  @override
  String toString() {
    return 'SignInRegisterEvent.secretChanged(secretStr: $secretStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChanged &&
            (identical(other.secretStr, secretStr) ||
                const DeepCollectionEquality()
                    .equals(other.secretStr, secretStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(secretStr);

  @JsonKey(ignore: true)
  @override
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String credentialStr) credentialChanged,
    required TResult Function(String secretStr) secretChanged,
    required TResult Function() registerWithCredentialAndPasswordPressed,
  }) {
    return secretChanged(secretStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String credentialStr)? credentialChanged,
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? registerWithCredentialAndPasswordPressed,
  }) {
    return secretChanged?.call(secretStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String credentialStr)? credentialChanged,
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? registerWithCredentialAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (secretChanged != null) {
      return secretChanged(secretStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialChanged value) credentialChanged,
    required TResult Function(PasswordChanged value) secretChanged,
    required TResult Function(RegisterWithCredentialAndPasswordPressed value)
        registerWithCredentialAndPasswordPressed,
  }) {
    return secretChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CredentialChanged value)? credentialChanged,
    TResult Function(PasswordChanged value)? secretChanged,
    TResult Function(RegisterWithCredentialAndPasswordPressed value)?
        registerWithCredentialAndPasswordPressed,
  }) {
    return secretChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CredentialChanged value)? credentialChanged,
    TResult Function(PasswordChanged value)? secretChanged,
    TResult Function(RegisterWithCredentialAndPasswordPressed value)?
        registerWithCredentialAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (secretChanged != null) {
      return secretChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements SignInRegisterEvent {
  const factory PasswordChanged(String secretStr) = _$PasswordChanged;

  String get secretStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterWithCredentialAndPasswordPressedCopyWith<$Res> {
  factory $RegisterWithCredentialAndPasswordPressedCopyWith(
          RegisterWithCredentialAndPasswordPressed value,
          $Res Function(RegisterWithCredentialAndPasswordPressed) then) =
      _$RegisterWithCredentialAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterWithCredentialAndPasswordPressedCopyWithImpl<$Res>
    extends _$SignInRegisterEventCopyWithImpl<$Res>
    implements $RegisterWithCredentialAndPasswordPressedCopyWith<$Res> {
  _$RegisterWithCredentialAndPasswordPressedCopyWithImpl(
      RegisterWithCredentialAndPasswordPressed _value,
      $Res Function(RegisterWithCredentialAndPasswordPressed) _then)
      : super(_value,
            (v) => _then(v as RegisterWithCredentialAndPasswordPressed));

  @override
  RegisterWithCredentialAndPasswordPressed get _value =>
      super._value as RegisterWithCredentialAndPasswordPressed;
}

/// @nodoc

class _$RegisterWithCredentialAndPasswordPressed
    implements RegisterWithCredentialAndPasswordPressed {
  const _$RegisterWithCredentialAndPasswordPressed();

  @override
  String toString() {
    return 'SignInRegisterEvent.registerWithCredentialAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterWithCredentialAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String credentialStr) credentialChanged,
    required TResult Function(String secretStr) secretChanged,
    required TResult Function() registerWithCredentialAndPasswordPressed,
  }) {
    return registerWithCredentialAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String credentialStr)? credentialChanged,
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? registerWithCredentialAndPasswordPressed,
  }) {
    return registerWithCredentialAndPasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String credentialStr)? credentialChanged,
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? registerWithCredentialAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (registerWithCredentialAndPasswordPressed != null) {
      return registerWithCredentialAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialChanged value) credentialChanged,
    required TResult Function(PasswordChanged value) secretChanged,
    required TResult Function(RegisterWithCredentialAndPasswordPressed value)
        registerWithCredentialAndPasswordPressed,
  }) {
    return registerWithCredentialAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CredentialChanged value)? credentialChanged,
    TResult Function(PasswordChanged value)? secretChanged,
    TResult Function(RegisterWithCredentialAndPasswordPressed value)?
        registerWithCredentialAndPasswordPressed,
  }) {
    return registerWithCredentialAndPasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CredentialChanged value)? credentialChanged,
    TResult Function(PasswordChanged value)? secretChanged,
    TResult Function(RegisterWithCredentialAndPasswordPressed value)?
        registerWithCredentialAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (registerWithCredentialAndPasswordPressed != null) {
      return registerWithCredentialAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class RegisterWithCredentialAndPasswordPressed
    implements SignInRegisterEvent {
  const factory RegisterWithCredentialAndPasswordPressed() =
      _$RegisterWithCredentialAndPasswordPressed;
}

/// @nodoc
class _$SignInRegisterStateTearOff {
  const _$SignInRegisterStateTearOff();

  _RegisterState call(
      {required CredentialAddress credential,
      required Password secret,
      required bool isLoading,
      required Option<Either<FailureDetails, Unit>>
          authFailureOrSuccessOption}) {
    return _RegisterState(
      credential: credential,
      secret: secret,
      isLoading: isLoading,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $SignInRegisterState = _$SignInRegisterStateTearOff();

/// @nodoc
mixin _$SignInRegisterState {
  CredentialAddress get credential => throw _privateConstructorUsedError;
  Password get secret => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<FailureDetails, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInRegisterStateCopyWith<SignInRegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInRegisterStateCopyWith<$Res> {
  factory $SignInRegisterStateCopyWith(
          SignInRegisterState value, $Res Function(SignInRegisterState) then) =
      _$SignInRegisterStateCopyWithImpl<$Res>;
  $Res call(
      {CredentialAddress credential,
      Password secret,
      bool isLoading,
      Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$SignInRegisterStateCopyWithImpl<$Res>
    implements $SignInRegisterStateCopyWith<$Res> {
  _$SignInRegisterStateCopyWithImpl(this._value, this._then);

  final SignInRegisterState _value;
  // ignore: unused_field
  final $Res Function(SignInRegisterState) _then;

  @override
  $Res call({
    Object? credential = freezed,
    Object? secret = freezed,
    Object? isLoading = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as CredentialAddress,
      secret: secret == freezed
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as Password,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FailureDetails, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$RegisterStateCopyWith<$Res>
    implements $SignInRegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(
          _RegisterState value, $Res Function(_RegisterState) then) =
      __$RegisterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {CredentialAddress credential,
      Password secret,
      bool isLoading,
      Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    extends _$SignInRegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(
      _RegisterState _value, $Res Function(_RegisterState) _then)
      : super(_value, (v) => _then(v as _RegisterState));

  @override
  _RegisterState get _value => super._value as _RegisterState;

  @override
  $Res call({
    Object? credential = freezed,
    Object? secret = freezed,
    Object? isLoading = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_RegisterState(
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as CredentialAddress,
      secret: secret == freezed
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as Password,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FailureDetails, Unit>>,
    ));
  }
}

/// @nodoc

class _$_RegisterState implements _RegisterState {
  const _$_RegisterState(
      {required this.credential,
      required this.secret,
      required this.isLoading,
      required this.authFailureOrSuccessOption});

  @override
  final CredentialAddress credential;
  @override
  final Password secret;
  @override
  final bool isLoading;
  @override
  final Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'SignInRegisterState(credential: $credential, secret: $secret, isLoading: $isLoading, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterState &&
            (identical(other.credential, credential) ||
                const DeepCollectionEquality()
                    .equals(other.credential, credential)) &&
            (identical(other.secret, secret) ||
                const DeepCollectionEquality().equals(other.secret, secret)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(credential) ^
      const DeepCollectionEquality().hash(secret) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);
}

abstract class _RegisterState implements SignInRegisterState {
  const factory _RegisterState(
      {required CredentialAddress credential,
      required Password secret,
      required bool isLoading,
      required Option<Either<FailureDetails, Unit>>
          authFailureOrSuccessOption}) = _$_RegisterState;

  @override
  CredentialAddress get credential => throw _privateConstructorUsedError;
  @override
  Password get secret => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Option<Either<FailureDetails, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
