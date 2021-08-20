// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_email_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInEmailEventTearOff {
  const _$SignInEmailEventTearOff();

  EmailChanged emailChanged(String emailStr) {
    return EmailChanged(
      emailStr,
    );
  }

  AnalyseEmailPressed analyseEmailPressed() {
    return const AnalyseEmailPressed();
  }
}

/// @nodoc
const $SignInEmailEvent = _$SignInEmailEventTearOff();

/// @nodoc
mixin _$SignInEmailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function() analyseEmailPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function()? analyseEmailPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function()? analyseEmailPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(AnalyseEmailPressed value) analyseEmailPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(AnalyseEmailPressed value)? analyseEmailPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(AnalyseEmailPressed value)? analyseEmailPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEmailEventCopyWith<$Res> {
  factory $SignInEmailEventCopyWith(
          SignInEmailEvent value, $Res Function(SignInEmailEvent) then) =
      _$SignInEmailEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInEmailEventCopyWithImpl<$Res>
    implements $SignInEmailEventCopyWith<$Res> {
  _$SignInEmailEventCopyWithImpl(this._value, this._then);

  final SignInEmailEvent _value;
  // ignore: unused_field
  final $Res Function(SignInEmailEvent) _then;
}

/// @nodoc
abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String emailStr});
}

/// @nodoc
class _$EmailChangedCopyWithImpl<$Res>
    extends _$SignInEmailEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object? emailStr = freezed,
  }) {
    return _then(EmailChanged(
      emailStr == freezed
          ? _value.emailStr
          : emailStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.emailStr);

  @override
  final String emailStr;

  @override
  String toString() {
    return 'SignInEmailEvent.emailChanged(emailStr: $emailStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.emailStr, emailStr) ||
                const DeepCollectionEquality()
                    .equals(other.emailStr, emailStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(emailStr);

  @JsonKey(ignore: true)
  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function() analyseEmailPressed,
  }) {
    return emailChanged(emailStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function()? analyseEmailPressed,
  }) {
    return emailChanged?.call(emailStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function()? analyseEmailPressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(emailStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(AnalyseEmailPressed value) analyseEmailPressed,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(AnalyseEmailPressed value)? analyseEmailPressed,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(AnalyseEmailPressed value)? analyseEmailPressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements SignInEmailEvent {
  const factory EmailChanged(String emailStr) = _$EmailChanged;

  String get emailStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyseEmailPressedCopyWith<$Res> {
  factory $AnalyseEmailPressedCopyWith(
          AnalyseEmailPressed value, $Res Function(AnalyseEmailPressed) then) =
      _$AnalyseEmailPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AnalyseEmailPressedCopyWithImpl<$Res>
    extends _$SignInEmailEventCopyWithImpl<$Res>
    implements $AnalyseEmailPressedCopyWith<$Res> {
  _$AnalyseEmailPressedCopyWithImpl(
      AnalyseEmailPressed _value, $Res Function(AnalyseEmailPressed) _then)
      : super(_value, (v) => _then(v as AnalyseEmailPressed));

  @override
  AnalyseEmailPressed get _value => super._value as AnalyseEmailPressed;
}

/// @nodoc

class _$AnalyseEmailPressed implements AnalyseEmailPressed {
  const _$AnalyseEmailPressed();

  @override
  String toString() {
    return 'SignInEmailEvent.analyseEmailPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AnalyseEmailPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailStr) emailChanged,
    required TResult Function() analyseEmailPressed,
  }) {
    return analyseEmailPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function()? analyseEmailPressed,
  }) {
    return analyseEmailPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailStr)? emailChanged,
    TResult Function()? analyseEmailPressed,
    required TResult orElse(),
  }) {
    if (analyseEmailPressed != null) {
      return analyseEmailPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(AnalyseEmailPressed value) analyseEmailPressed,
  }) {
    return analyseEmailPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(AnalyseEmailPressed value)? analyseEmailPressed,
  }) {
    return analyseEmailPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(AnalyseEmailPressed value)? analyseEmailPressed,
    required TResult orElse(),
  }) {
    if (analyseEmailPressed != null) {
      return analyseEmailPressed(this);
    }
    return orElse();
  }
}

abstract class AnalyseEmailPressed implements SignInEmailEvent {
  const factory AnalyseEmailPressed() = _$AnalyseEmailPressed;
}

/// @nodoc
class _$SignInEmailStateTearOff {
  const _$SignInEmailStateTearOff();

  _EmailState call(
      {required EmailAddress email,
      required bool isLoading,
      required Option<Either<FailureDetails, Unit>>
          authFailureOrSuccessOption}) {
    return _EmailState(
      email: email,
      isLoading: isLoading,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $SignInEmailState = _$SignInEmailStateTearOff();

/// @nodoc
mixin _$SignInEmailState {
  EmailAddress get email => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<FailureDetails, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInEmailStateCopyWith<SignInEmailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEmailStateCopyWith<$Res> {
  factory $SignInEmailStateCopyWith(
          SignInEmailState value, $Res Function(SignInEmailState) then) =
      _$SignInEmailStateCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress email,
      bool isLoading,
      Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class _$SignInEmailStateCopyWithImpl<$Res>
    implements $SignInEmailStateCopyWith<$Res> {
  _$SignInEmailStateCopyWithImpl(this._value, this._then);

  final SignInEmailState _value;
  // ignore: unused_field
  final $Res Function(SignInEmailState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? isLoading = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
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
abstract class _$EmailStateCopyWith<$Res>
    implements $SignInEmailStateCopyWith<$Res> {
  factory _$EmailStateCopyWith(
          _EmailState value, $Res Function(_EmailState) then) =
      __$EmailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress email,
      bool isLoading,
      Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption});
}

/// @nodoc
class __$EmailStateCopyWithImpl<$Res>
    extends _$SignInEmailStateCopyWithImpl<$Res>
    implements _$EmailStateCopyWith<$Res> {
  __$EmailStateCopyWithImpl(
      _EmailState _value, $Res Function(_EmailState) _then)
      : super(_value, (v) => _then(v as _EmailState));

  @override
  _EmailState get _value => super._value as _EmailState;

  @override
  $Res call({
    Object? email = freezed,
    Object? isLoading = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_EmailState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
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

class _$_EmailState implements _EmailState {
  const _$_EmailState(
      {required this.email,
      required this.isLoading,
      required this.authFailureOrSuccessOption});

  @override
  final EmailAddress email;
  @override
  final bool isLoading;
  @override
  final Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'SignInEmailState(email: $email, isLoading: $isLoading, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmailState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
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
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$EmailStateCopyWith<_EmailState> get copyWith =>
      __$EmailStateCopyWithImpl<_EmailState>(this, _$identity);
}

abstract class _EmailState implements SignInEmailState {
  const factory _EmailState(
      {required EmailAddress email,
      required bool isLoading,
      required Option<Either<FailureDetails, Unit>>
          authFailureOrSuccessOption}) = _$_EmailState;

  @override
  EmailAddress get email => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Option<Either<FailureDetails, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EmailStateCopyWith<_EmailState> get copyWith =>
      throw _privateConstructorUsedError;
}
