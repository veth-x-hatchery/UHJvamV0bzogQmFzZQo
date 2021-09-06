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
class _$SignInSecretEventTearOff {
  const _$SignInSecretEventTearOff();

  SecretChanged secretChanged(String secretStr) {
    return SecretChanged(
      secretStr,
    );
  }

  AnalyseSecretPressed analyseSecretPressed() {
    return const AnalyseSecretPressed();
  }
}

/// @nodoc
const $SignInSecretEvent = _$SignInSecretEventTearOff();

/// @nodoc
mixin _$SignInSecretEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String secretStr) secretChanged,
    required TResult Function() analyseSecretPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? analyseSecretPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? analyseSecretPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SecretChanged value) secretChanged,
    required TResult Function(AnalyseSecretPressed value) analyseSecretPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SecretChanged value)? secretChanged,
    TResult Function(AnalyseSecretPressed value)? analyseSecretPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SecretChanged value)? secretChanged,
    TResult Function(AnalyseSecretPressed value)? analyseSecretPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInSecretEventCopyWith<$Res> {
  factory $SignInSecretEventCopyWith(
          SignInSecretEvent value, $Res Function(SignInSecretEvent) then) =
      _$SignInSecretEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInSecretEventCopyWithImpl<$Res>
    implements $SignInSecretEventCopyWith<$Res> {
  _$SignInSecretEventCopyWithImpl(this._value, this._then);

  final SignInSecretEvent _value;
  // ignore: unused_field
  final $Res Function(SignInSecretEvent) _then;
}

/// @nodoc
abstract class $SecretChangedCopyWith<$Res> {
  factory $SecretChangedCopyWith(
          SecretChanged value, $Res Function(SecretChanged) then) =
      _$SecretChangedCopyWithImpl<$Res>;
  $Res call({String secretStr});
}

/// @nodoc
class _$SecretChangedCopyWithImpl<$Res>
    extends _$SignInSecretEventCopyWithImpl<$Res>
    implements $SecretChangedCopyWith<$Res> {
  _$SecretChangedCopyWithImpl(
      SecretChanged _value, $Res Function(SecretChanged) _then)
      : super(_value, (v) => _then(v as SecretChanged));

  @override
  SecretChanged get _value => super._value as SecretChanged;

  @override
  $Res call({
    Object? secretStr = freezed,
  }) {
    return _then(SecretChanged(
      secretStr == freezed
          ? _value.secretStr
          : secretStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SecretChanged implements SecretChanged {
  const _$SecretChanged(this.secretStr);

  @override
  final String secretStr;

  @override
  String toString() {
    return 'SignInSecretEvent.secretChanged(secretStr: $secretStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SecretChanged &&
            (identical(other.secretStr, secretStr) ||
                const DeepCollectionEquality()
                    .equals(other.secretStr, secretStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(secretStr);

  @JsonKey(ignore: true)
  @override
  $SecretChangedCopyWith<SecretChanged> get copyWith =>
      _$SecretChangedCopyWithImpl<SecretChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String secretStr) secretChanged,
    required TResult Function() analyseSecretPressed,
  }) {
    return secretChanged(secretStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? analyseSecretPressed,
  }) {
    return secretChanged?.call(secretStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? analyseSecretPressed,
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
    required TResult Function(SecretChanged value) secretChanged,
    required TResult Function(AnalyseSecretPressed value) analyseSecretPressed,
  }) {
    return secretChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SecretChanged value)? secretChanged,
    TResult Function(AnalyseSecretPressed value)? analyseSecretPressed,
  }) {
    return secretChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SecretChanged value)? secretChanged,
    TResult Function(AnalyseSecretPressed value)? analyseSecretPressed,
    required TResult orElse(),
  }) {
    if (secretChanged != null) {
      return secretChanged(this);
    }
    return orElse();
  }
}

abstract class SecretChanged implements SignInSecretEvent {
  const factory SecretChanged(String secretStr) = _$SecretChanged;

  String get secretStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecretChangedCopyWith<SecretChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyseSecretPressedCopyWith<$Res> {
  factory $AnalyseSecretPressedCopyWith(AnalyseSecretPressed value,
          $Res Function(AnalyseSecretPressed) then) =
      _$AnalyseSecretPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AnalyseSecretPressedCopyWithImpl<$Res>
    extends _$SignInSecretEventCopyWithImpl<$Res>
    implements $AnalyseSecretPressedCopyWith<$Res> {
  _$AnalyseSecretPressedCopyWithImpl(
      AnalyseSecretPressed _value, $Res Function(AnalyseSecretPressed) _then)
      : super(_value, (v) => _then(v as AnalyseSecretPressed));

  @override
  AnalyseSecretPressed get _value => super._value as AnalyseSecretPressed;
}

/// @nodoc

class _$AnalyseSecretPressed implements AnalyseSecretPressed {
  const _$AnalyseSecretPressed();

  @override
  String toString() {
    return 'SignInSecretEvent.analyseSecretPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AnalyseSecretPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String secretStr) secretChanged,
    required TResult Function() analyseSecretPressed,
  }) {
    return analyseSecretPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? analyseSecretPressed,
  }) {
    return analyseSecretPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String secretStr)? secretChanged,
    TResult Function()? analyseSecretPressed,
    required TResult orElse(),
  }) {
    if (analyseSecretPressed != null) {
      return analyseSecretPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SecretChanged value) secretChanged,
    required TResult Function(AnalyseSecretPressed value) analyseSecretPressed,
  }) {
    return analyseSecretPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SecretChanged value)? secretChanged,
    TResult Function(AnalyseSecretPressed value)? analyseSecretPressed,
  }) {
    return analyseSecretPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SecretChanged value)? secretChanged,
    TResult Function(AnalyseSecretPressed value)? analyseSecretPressed,
    required TResult orElse(),
  }) {
    if (analyseSecretPressed != null) {
      return analyseSecretPressed(this);
    }
    return orElse();
  }
}

abstract class AnalyseSecretPressed implements SignInSecretEvent {
  const factory AnalyseSecretPressed() = _$AnalyseSecretPressed;
}

/// @nodoc
class _$SignInSecretStateTearOff {
  const _$SignInSecretStateTearOff();

  _SecretState call(
      {required Secret secret,
      required bool isLoading,
      required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
      required Option<VethxNotification> notification}) {
    return _SecretState(
      secret: secret,
      isLoading: isLoading,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
      notification: notification,
    );
  }
}

/// @nodoc
const $SignInSecretState = _$SignInSecretStateTearOff();

/// @nodoc
mixin _$SignInSecretState {
  Secret get secret => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<FailureDetails, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<VethxNotification> get notification =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInSecretStateCopyWith<SignInSecretState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInSecretStateCopyWith<$Res> {
  factory $SignInSecretStateCopyWith(
          SignInSecretState value, $Res Function(SignInSecretState) then) =
      _$SignInSecretStateCopyWithImpl<$Res>;
  $Res call(
      {Secret secret,
      bool isLoading,
      Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
      Option<VethxNotification> notification});
}

/// @nodoc
class _$SignInSecretStateCopyWithImpl<$Res>
    implements $SignInSecretStateCopyWith<$Res> {
  _$SignInSecretStateCopyWithImpl(this._value, this._then);

  final SignInSecretState _value;
  // ignore: unused_field
  final $Res Function(SignInSecretState) _then;

  @override
  $Res call({
    Object? secret = freezed,
    Object? isLoading = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? notification = freezed,
  }) {
    return _then(_value.copyWith(
      secret: secret == freezed
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as Secret,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FailureDetails, Unit>>,
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Option<VethxNotification>,
    ));
  }
}

/// @nodoc
abstract class _$SecretStateCopyWith<$Res>
    implements $SignInSecretStateCopyWith<$Res> {
  factory _$SecretStateCopyWith(
          _SecretState value, $Res Function(_SecretState) then) =
      __$SecretStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Secret secret,
      bool isLoading,
      Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
      Option<VethxNotification> notification});
}

/// @nodoc
class __$SecretStateCopyWithImpl<$Res>
    extends _$SignInSecretStateCopyWithImpl<$Res>
    implements _$SecretStateCopyWith<$Res> {
  __$SecretStateCopyWithImpl(
      _SecretState _value, $Res Function(_SecretState) _then)
      : super(_value, (v) => _then(v as _SecretState));

  @override
  _SecretState get _value => super._value as _SecretState;

  @override
  $Res call({
    Object? secret = freezed,
    Object? isLoading = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? notification = freezed,
  }) {
    return _then(_SecretState(
      secret: secret == freezed
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as Secret,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FailureDetails, Unit>>,
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as Option<VethxNotification>,
    ));
  }
}

/// @nodoc

class _$_SecretState implements _SecretState {
  const _$_SecretState(
      {required this.secret,
      required this.isLoading,
      required this.authFailureOrSuccessOption,
      required this.notification});

  @override
  final Secret secret;
  @override
  final bool isLoading;
  @override
  final Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption;
  @override
  final Option<VethxNotification> notification;

  @override
  String toString() {
    return 'SignInSecretState(secret: $secret, isLoading: $isLoading, authFailureOrSuccessOption: $authFailureOrSuccessOption, notification: $notification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SecretState &&
            (identical(other.secret, secret) ||
                const DeepCollectionEquality().equals(other.secret, secret)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption)) &&
            (identical(other.notification, notification) ||
                const DeepCollectionEquality()
                    .equals(other.notification, notification)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(secret) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption) ^
      const DeepCollectionEquality().hash(notification);

  @JsonKey(ignore: true)
  @override
  _$SecretStateCopyWith<_SecretState> get copyWith =>
      __$SecretStateCopyWithImpl<_SecretState>(this, _$identity);
}

abstract class _SecretState implements SignInSecretState {
  const factory _SecretState(
      {required Secret secret,
      required bool isLoading,
      required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
      required Option<VethxNotification> notification}) = _$_SecretState;

  @override
  Secret get secret => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Option<Either<FailureDetails, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  Option<VethxNotification> get notification =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SecretStateCopyWith<_SecretState> get copyWith =>
      throw _privateConstructorUsedError;
}
