// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInPasswordEventTearOff {
  const _$SignInPasswordEventTearOff();

  PasswordChanged passwordChanged(String passwordStr) {
    return PasswordChanged(
      passwordStr,
    );
  }

  AnalysePasswordPressed analysePasswordPressed() {
    return const AnalysePasswordPressed();
  }
}

/// @nodoc
const $SignInPasswordEvent = _$SignInPasswordEventTearOff();

/// @nodoc
mixin _$SignInPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() analysePasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? analysePasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? analysePasswordPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(AnalysePasswordPressed value)
        analysePasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(AnalysePasswordPressed value)? analysePasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(AnalysePasswordPressed value)? analysePasswordPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPasswordEventCopyWith<$Res> {
  factory $SignInPasswordEventCopyWith(
          SignInPasswordEvent value, $Res Function(SignInPasswordEvent) then) =
      _$SignInPasswordEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInPasswordEventCopyWithImpl<$Res>
    implements $SignInPasswordEventCopyWith<$Res> {
  _$SignInPasswordEventCopyWithImpl(this._value, this._then);

  final SignInPasswordEvent _value;
  // ignore: unused_field
  final $Res Function(SignInPasswordEvent) _then;
}

/// @nodoc
abstract class $PasswordChangedCopyWith<$Res> {
  factory $PasswordChangedCopyWith(
          PasswordChanged value, $Res Function(PasswordChanged) then) =
      _$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String passwordStr});
}

/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    extends _$SignInPasswordEventCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(
      PasswordChanged _value, $Res Function(PasswordChanged) _then)
      : super(_value, (v) => _then(v as PasswordChanged));

  @override
  PasswordChanged get _value => super._value as PasswordChanged;

  @override
  $Res call({
    Object? passwordStr = freezed,
  }) {
    return _then(PasswordChanged(
      passwordStr == freezed
          ? _value.passwordStr
          : passwordStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.passwordStr);

  @override
  final String passwordStr;

  @override
  String toString() {
    return 'SignInPasswordEvent.passwordChanged(passwordStr: $passwordStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChanged &&
            (identical(other.passwordStr, passwordStr) ||
                const DeepCollectionEquality()
                    .equals(other.passwordStr, passwordStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(passwordStr);

  @JsonKey(ignore: true)
  @override
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() analysePasswordPressed,
  }) {
    return passwordChanged(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? analysePasswordPressed,
  }) {
    return passwordChanged?.call(passwordStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? analysePasswordPressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(passwordStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(AnalysePasswordPressed value)
        analysePasswordPressed,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(AnalysePasswordPressed value)? analysePasswordPressed,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(AnalysePasswordPressed value)? analysePasswordPressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements SignInPasswordEvent {
  const factory PasswordChanged(String passwordStr) = _$PasswordChanged;

  String get passwordStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysePasswordPressedCopyWith<$Res> {
  factory $AnalysePasswordPressedCopyWith(AnalysePasswordPressed value,
          $Res Function(AnalysePasswordPressed) then) =
      _$AnalysePasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AnalysePasswordPressedCopyWithImpl<$Res>
    extends _$SignInPasswordEventCopyWithImpl<$Res>
    implements $AnalysePasswordPressedCopyWith<$Res> {
  _$AnalysePasswordPressedCopyWithImpl(AnalysePasswordPressed _value,
      $Res Function(AnalysePasswordPressed) _then)
      : super(_value, (v) => _then(v as AnalysePasswordPressed));

  @override
  AnalysePasswordPressed get _value => super._value as AnalysePasswordPressed;
}

/// @nodoc

class _$AnalysePasswordPressed implements AnalysePasswordPressed {
  const _$AnalysePasswordPressed();

  @override
  String toString() {
    return 'SignInPasswordEvent.analysePasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AnalysePasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String passwordStr) passwordChanged,
    required TResult Function() analysePasswordPressed,
  }) {
    return analysePasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? analysePasswordPressed,
  }) {
    return analysePasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String passwordStr)? passwordChanged,
    TResult Function()? analysePasswordPressed,
    required TResult orElse(),
  }) {
    if (analysePasswordPressed != null) {
      return analysePasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(AnalysePasswordPressed value)
        analysePasswordPressed,
  }) {
    return analysePasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(AnalysePasswordPressed value)? analysePasswordPressed,
  }) {
    return analysePasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(AnalysePasswordPressed value)? analysePasswordPressed,
    required TResult orElse(),
  }) {
    if (analysePasswordPressed != null) {
      return analysePasswordPressed(this);
    }
    return orElse();
  }
}

abstract class AnalysePasswordPressed implements SignInPasswordEvent {
  const factory AnalysePasswordPressed() = _$AnalysePasswordPressed;
}

/// @nodoc
class _$SignInPasswordStateTearOff {
  const _$SignInPasswordStateTearOff();

  _PasswordState call(
      {required Password password,
      required bool isLoading,
      required Option<Either<FailureDetails, Unit>>
          authFailureOrSuccessOption}) {
    return _PasswordState(
      password: password,
      isLoading: isLoading,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $SignInPasswordState = _$SignInPasswordStateTearOff();

/// @nodoc
mixin _$SignInPasswordState {
  Password get password => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<FailureDetails, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInPasswordStateCopyWith<SignInPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPasswordStateCopyWith<$Res> {
  factory $SignInPasswordStateCopyWith(
          SignInPasswordState value, $Res Function(SignInPasswordState) then) =
      _$SignInPasswordStateCopyWithImpl<$Res>;
  $Res call(
      {Password password,
      bool isLoading,
      Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$SignInPasswordStateCopyWithImpl<$Res>
    implements $SignInPasswordStateCopyWith<$Res> {
  _$SignInPasswordStateCopyWithImpl(this._value, this._then);

  final SignInPasswordState _value;
  // ignore: unused_field
  final $Res Function(SignInPasswordState) _then;

  @override
  $Res call({
    Object? password = freezed,
    Object? isLoading = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
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
abstract class _$PasswordStateCopyWith<$Res>
    implements $SignInPasswordStateCopyWith<$Res> {
  factory _$PasswordStateCopyWith(
          _PasswordState value, $Res Function(_PasswordState) then) =
      __$PasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Password password,
      bool isLoading,
      Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$PasswordStateCopyWithImpl<$Res>
    extends _$SignInPasswordStateCopyWithImpl<$Res>
    implements _$PasswordStateCopyWith<$Res> {
  __$PasswordStateCopyWithImpl(
      _PasswordState _value, $Res Function(_PasswordState) _then)
      : super(_value, (v) => _then(v as _PasswordState));

  @override
  _PasswordState get _value => super._value as _PasswordState;

  @override
  $Res call({
    Object? password = freezed,
    Object? isLoading = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_PasswordState(
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
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

class _$_PasswordState implements _PasswordState {
  const _$_PasswordState(
      {required this.password,
      required this.isLoading,
      required this.authFailureOrSuccessOption});

  @override
  final Password password;
  @override
  final bool isLoading;
  @override
  final Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'SignInPasswordState(password: $password, isLoading: $isLoading, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PasswordState &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
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
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$PasswordStateCopyWith<_PasswordState> get copyWith =>
      __$PasswordStateCopyWithImpl<_PasswordState>(this, _$identity);
}

abstract class _PasswordState implements SignInPasswordState {
  const factory _PasswordState(
      {required Password password,
      required bool isLoading,
      required Option<Either<FailureDetails, Unit>>
          authFailureOrSuccessOption}) = _$_PasswordState;

  @override
  Password get password => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Option<Either<FailureDetails, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PasswordStateCopyWith<_PasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
