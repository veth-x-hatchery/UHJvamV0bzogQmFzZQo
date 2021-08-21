// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_secret_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInPasswordEventTearOff {
  const _$SignInPasswordEventTearOff();

  PasswordChanged secretChanged(String secretStr) {
    return PasswordChanged(
      secretStr,
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
    required TResult Function(String secretStr) secretChanged,
    required TResult Function() analysePasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? analysePasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? analysePasswordPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordChanged value) secretChanged,
    required TResult Function(AnalysePasswordPressed value)
        analysePasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordChanged value)? secretChanged,
    TResult Function(AnalysePasswordPressed value)? analysePasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordChanged value)? secretChanged,
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
  $Res call({String secretStr});
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
    return 'SignInPasswordEvent.secretChanged(secretStr: $secretStr)';
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
    required TResult Function(String secretStr) secretChanged,
    required TResult Function() analysePasswordPressed,
  }) {
    return secretChanged(secretStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? analysePasswordPressed,
  }) {
    return secretChanged?.call(secretStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? analysePasswordPressed,
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
    required TResult Function(PasswordChanged value) secretChanged,
    required TResult Function(AnalysePasswordPressed value)
        analysePasswordPressed,
  }) {
    return secretChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordChanged value)? secretChanged,
    TResult Function(AnalysePasswordPressed value)? analysePasswordPressed,
  }) {
    return secretChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordChanged value)? secretChanged,
    TResult Function(AnalysePasswordPressed value)? analysePasswordPressed,
    required TResult orElse(),
  }) {
    if (secretChanged != null) {
      return secretChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements SignInPasswordEvent {
  const factory PasswordChanged(String secretStr) = _$PasswordChanged;

  String get secretStr => throw _privateConstructorUsedError;
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
    required TResult Function(String secretStr) secretChanged,
    required TResult Function() analysePasswordPressed,
  }) {
    return analysePasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? analysePasswordPressed,
  }) {
    return analysePasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String secretStr)? secretChanged,
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
    required TResult Function(PasswordChanged value) secretChanged,
    required TResult Function(AnalysePasswordPressed value)
        analysePasswordPressed,
  }) {
    return analysePasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordChanged value)? secretChanged,
    TResult Function(AnalysePasswordPressed value)? analysePasswordPressed,
  }) {
    return analysePasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordChanged value)? secretChanged,
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
      {required Password secret,
      required bool isLoading,
      required Option<Either<FailureDetails, Unit>>
          authFailureOrSuccessOption}) {
    return _PasswordState(
      secret: secret,
      isLoading: isLoading,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $SignInPasswordState = _$SignInPasswordStateTearOff();

/// @nodoc
mixin _$SignInPasswordState {
  Password get secret => throw _privateConstructorUsedError;
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
      {Password secret,
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
    Object? secret = freezed,
    Object? isLoading = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$PasswordStateCopyWith<$Res>
    implements $SignInPasswordStateCopyWith<$Res> {
  factory _$PasswordStateCopyWith(
          _PasswordState value, $Res Function(_PasswordState) then) =
      __$PasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Password secret,
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
    Object? secret = freezed,
    Object? isLoading = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_PasswordState(
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

class _$_PasswordState implements _PasswordState {
  const _$_PasswordState(
      {required this.secret,
      required this.isLoading,
      required this.authFailureOrSuccessOption});

  @override
  final Password secret;
  @override
  final bool isLoading;
  @override
  final Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'SignInPasswordState(secret: $secret, isLoading: $isLoading, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PasswordState &&
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
      const DeepCollectionEquality().hash(secret) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$PasswordStateCopyWith<_PasswordState> get copyWith =>
      __$PasswordStateCopyWithImpl<_PasswordState>(this, _$identity);
}

abstract class _PasswordState implements SignInPasswordState {
  const factory _PasswordState(
      {required Password secret,
      required bool isLoading,
      required Option<Either<FailureDetails, Unit>>
          authFailureOrSuccessOption}) = _$_PasswordState;

  @override
  Password get secret => throw _privateConstructorUsedError;
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
