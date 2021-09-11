// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_in_credential_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInCredentialEventTearOff {
  const _$SignInCredentialEventTearOff();

  CredentialChanged credentialChanged(String credentialStr) {
    return CredentialChanged(
      credentialStr,
    );
  }

  AnalyseCredentialPressed analyseCredentialPressed() {
    return const AnalyseCredentialPressed();
  }
}

/// @nodoc
const $SignInCredentialEvent = _$SignInCredentialEventTearOff();

/// @nodoc
mixin _$SignInCredentialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String credentialStr) credentialChanged,
    required TResult Function() analyseCredentialPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String credentialStr)? credentialChanged,
    TResult Function()? analyseCredentialPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialChanged value) credentialChanged,
    required TResult Function(AnalyseCredentialPressed value)
        analyseCredentialPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CredentialChanged value)? credentialChanged,
    TResult Function(AnalyseCredentialPressed value)? analyseCredentialPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInCredentialEventCopyWith<$Res> {
  factory $SignInCredentialEventCopyWith(SignInCredentialEvent value,
          $Res Function(SignInCredentialEvent) then) =
      _$SignInCredentialEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInCredentialEventCopyWithImpl<$Res>
    implements $SignInCredentialEventCopyWith<$Res> {
  _$SignInCredentialEventCopyWithImpl(this._value, this._then);

  final SignInCredentialEvent _value;
  // ignore: unused_field
  final $Res Function(SignInCredentialEvent) _then;
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
    extends _$SignInCredentialEventCopyWithImpl<$Res>
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
    return 'SignInCredentialEvent.credentialChanged(credentialStr: $credentialStr)';
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
    required TResult Function() analyseCredentialPressed,
  }) {
    return credentialChanged(credentialStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String credentialStr)? credentialChanged,
    TResult Function()? analyseCredentialPressed,
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
    required TResult Function(AnalyseCredentialPressed value)
        analyseCredentialPressed,
  }) {
    return credentialChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CredentialChanged value)? credentialChanged,
    TResult Function(AnalyseCredentialPressed value)? analyseCredentialPressed,
    required TResult orElse(),
  }) {
    if (credentialChanged != null) {
      return credentialChanged(this);
    }
    return orElse();
  }
}

abstract class CredentialChanged implements SignInCredentialEvent {
  const factory CredentialChanged(String credentialStr) = _$CredentialChanged;

  String get credentialStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CredentialChangedCopyWith<CredentialChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyseCredentialPressedCopyWith<$Res> {
  factory $AnalyseCredentialPressedCopyWith(AnalyseCredentialPressed value,
          $Res Function(AnalyseCredentialPressed) then) =
      _$AnalyseCredentialPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AnalyseCredentialPressedCopyWithImpl<$Res>
    extends _$SignInCredentialEventCopyWithImpl<$Res>
    implements $AnalyseCredentialPressedCopyWith<$Res> {
  _$AnalyseCredentialPressedCopyWithImpl(AnalyseCredentialPressed _value,
      $Res Function(AnalyseCredentialPressed) _then)
      : super(_value, (v) => _then(v as AnalyseCredentialPressed));

  @override
  AnalyseCredentialPressed get _value =>
      super._value as AnalyseCredentialPressed;
}

/// @nodoc

class _$AnalyseCredentialPressed implements AnalyseCredentialPressed {
  const _$AnalyseCredentialPressed();

  @override
  String toString() {
    return 'SignInCredentialEvent.analyseCredentialPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AnalyseCredentialPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String credentialStr) credentialChanged,
    required TResult Function() analyseCredentialPressed,
  }) {
    return analyseCredentialPressed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String credentialStr)? credentialChanged,
    TResult Function()? analyseCredentialPressed,
    required TResult orElse(),
  }) {
    if (analyseCredentialPressed != null) {
      return analyseCredentialPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CredentialChanged value) credentialChanged,
    required TResult Function(AnalyseCredentialPressed value)
        analyseCredentialPressed,
  }) {
    return analyseCredentialPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CredentialChanged value)? credentialChanged,
    TResult Function(AnalyseCredentialPressed value)? analyseCredentialPressed,
    required TResult orElse(),
  }) {
    if (analyseCredentialPressed != null) {
      return analyseCredentialPressed(this);
    }
    return orElse();
  }
}

abstract class AnalyseCredentialPressed implements SignInCredentialEvent {
  const factory AnalyseCredentialPressed() = _$AnalyseCredentialPressed;
}

/// @nodoc
class _$SignInCredentialStateTearOff {
  const _$SignInCredentialStateTearOff();

  _CredentialState call(
      {required Credential credential,
      required bool isLoading,
      required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
      required Option<VethxNotification> notification}) {
    return _CredentialState(
      credential: credential,
      isLoading: isLoading,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
      notification: notification,
    );
  }
}

/// @nodoc
const $SignInCredentialState = _$SignInCredentialStateTearOff();

/// @nodoc
mixin _$SignInCredentialState {
  Credential get credential => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<FailureDetails, Unit>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<VethxNotification> get notification =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInCredentialStateCopyWith<SignInCredentialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInCredentialStateCopyWith<$Res> {
  factory $SignInCredentialStateCopyWith(SignInCredentialState value,
          $Res Function(SignInCredentialState) then) =
      _$SignInCredentialStateCopyWithImpl<$Res>;
  $Res call(
      {Credential credential,
      bool isLoading,
      Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
      Option<VethxNotification> notification});
}

/// @nodoc
class _$SignInCredentialStateCopyWithImpl<$Res>
    implements $SignInCredentialStateCopyWith<$Res> {
  _$SignInCredentialStateCopyWithImpl(this._value, this._then);

  final SignInCredentialState _value;
  // ignore: unused_field
  final $Res Function(SignInCredentialState) _then;

  @override
  $Res call({
    Object? credential = freezed,
    Object? isLoading = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? notification = freezed,
  }) {
    return _then(_value.copyWith(
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as Credential,
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
abstract class _$CredentialStateCopyWith<$Res>
    implements $SignInCredentialStateCopyWith<$Res> {
  factory _$CredentialStateCopyWith(
          _CredentialState value, $Res Function(_CredentialState) then) =
      __$CredentialStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Credential credential,
      bool isLoading,
      Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
      Option<VethxNotification> notification});
}

/// @nodoc
class __$CredentialStateCopyWithImpl<$Res>
    extends _$SignInCredentialStateCopyWithImpl<$Res>
    implements _$CredentialStateCopyWith<$Res> {
  __$CredentialStateCopyWithImpl(
      _CredentialState _value, $Res Function(_CredentialState) _then)
      : super(_value, (v) => _then(v as _CredentialState));

  @override
  _CredentialState get _value => super._value as _CredentialState;

  @override
  $Res call({
    Object? credential = freezed,
    Object? isLoading = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? notification = freezed,
  }) {
    return _then(_CredentialState(
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as Credential,
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

class _$_CredentialState implements _CredentialState {
  const _$_CredentialState(
      {required this.credential,
      required this.isLoading,
      required this.authFailureOrSuccessOption,
      required this.notification});

  @override
  final Credential credential;
  @override
  final bool isLoading;
  @override
  final Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption;
  @override
  final Option<VethxNotification> notification;

  @override
  String toString() {
    return 'SignInCredentialState(credential: $credential, isLoading: $isLoading, authFailureOrSuccessOption: $authFailureOrSuccessOption, notification: $notification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CredentialState &&
            (identical(other.credential, credential) ||
                const DeepCollectionEquality()
                    .equals(other.credential, credential)) &&
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
      const DeepCollectionEquality().hash(credential) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption) ^
      const DeepCollectionEquality().hash(notification);

  @JsonKey(ignore: true)
  @override
  _$CredentialStateCopyWith<_CredentialState> get copyWith =>
      __$CredentialStateCopyWithImpl<_CredentialState>(this, _$identity);
}

abstract class _CredentialState implements SignInCredentialState {
  const factory _CredentialState(
      {required Credential credential,
      required bool isLoading,
      required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
      required Option<VethxNotification> notification}) = _$_CredentialState;

  @override
  Credential get credential => throw _privateConstructorUsedError;
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
  _$CredentialStateCopyWith<_CredentialState> get copyWith =>
      throw _privateConstructorUsedError;
}
