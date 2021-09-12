// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  InvalidCredential<T> invalidCredential<T>({required T failedValue}) {
    return InvalidCredential<T>(
      failedValue: failedValue,
    );
  }

  ShortSecret<T> shortSecret<T>({required T failedValue}) {
    return ShortSecret<T>(
      failedValue: failedValue,
    );
  }

  Empty<T> empty<T>({required T failedValue}) {
    return Empty<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure<T> {
  T get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidCredential,
    required TResult Function(T failedValue) shortSecret,
    required TResult Function(T failedValue) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidCredential,
    TResult Function(T failedValue)? shortSecret,
    TResult Function(T failedValue)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredential<T> value) invalidCredential,
    required TResult Function(ShortSecret<T> value) shortSecret,
    required TResult Function(Empty<T> value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredential<T> value)? invalidCredential,
    TResult Function(ShortSecret<T> value)? shortSecret,
    TResult Function(Empty<T> value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class $InvalidCredentialCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidCredentialCopyWith(InvalidCredential<T> value,
          $Res Function(InvalidCredential<T>) then) =
      _$InvalidCredentialCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$InvalidCredentialCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidCredentialCopyWith<T, $Res> {
  _$InvalidCredentialCopyWithImpl(
      InvalidCredential<T> _value, $Res Function(InvalidCredential<T>) _then)
      : super(_value, (v) => _then(v as InvalidCredential<T>));

  @override
  InvalidCredential<T> get _value => super._value as InvalidCredential<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(InvalidCredential<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidCredential<T> implements InvalidCredential<T> {
  const _$InvalidCredential({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidCredential(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidCredential<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $InvalidCredentialCopyWith<T, InvalidCredential<T>> get copyWith =>
      _$InvalidCredentialCopyWithImpl<T, InvalidCredential<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidCredential,
    required TResult Function(T failedValue) shortSecret,
    required TResult Function(T failedValue) empty,
  }) {
    return invalidCredential(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidCredential,
    TResult Function(T failedValue)? shortSecret,
    TResult Function(T failedValue)? empty,
    required TResult orElse(),
  }) {
    if (invalidCredential != null) {
      return invalidCredential(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredential<T> value) invalidCredential,
    required TResult Function(ShortSecret<T> value) shortSecret,
    required TResult Function(Empty<T> value) empty,
  }) {
    return invalidCredential(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredential<T> value)? invalidCredential,
    TResult Function(ShortSecret<T> value)? shortSecret,
    TResult Function(Empty<T> value)? empty,
    required TResult orElse(),
  }) {
    if (invalidCredential != null) {
      return invalidCredential(this);
    }
    return orElse();
  }
}

abstract class InvalidCredential<T> implements ValueFailure<T> {
  const factory InvalidCredential({required T failedValue}) =
      _$InvalidCredential<T>;

  @override
  T get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InvalidCredentialCopyWith<T, InvalidCredential<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortSecretCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $ShortSecretCopyWith(
          ShortSecret<T> value, $Res Function(ShortSecret<T>) then) =
      _$ShortSecretCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$ShortSecretCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ShortSecretCopyWith<T, $Res> {
  _$ShortSecretCopyWithImpl(
      ShortSecret<T> _value, $Res Function(ShortSecret<T>) _then)
      : super(_value, (v) => _then(v as ShortSecret<T>));

  @override
  ShortSecret<T> get _value => super._value as ShortSecret<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(ShortSecret<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ShortSecret<T> implements ShortSecret<T> {
  const _$ShortSecret({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.shortSecret(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShortSecret<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $ShortSecretCopyWith<T, ShortSecret<T>> get copyWith =>
      _$ShortSecretCopyWithImpl<T, ShortSecret<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidCredential,
    required TResult Function(T failedValue) shortSecret,
    required TResult Function(T failedValue) empty,
  }) {
    return shortSecret(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidCredential,
    TResult Function(T failedValue)? shortSecret,
    TResult Function(T failedValue)? empty,
    required TResult orElse(),
  }) {
    if (shortSecret != null) {
      return shortSecret(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredential<T> value) invalidCredential,
    required TResult Function(ShortSecret<T> value) shortSecret,
    required TResult Function(Empty<T> value) empty,
  }) {
    return shortSecret(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredential<T> value)? invalidCredential,
    TResult Function(ShortSecret<T> value)? shortSecret,
    TResult Function(Empty<T> value)? empty,
    required TResult orElse(),
  }) {
    if (shortSecret != null) {
      return shortSecret(this);
    }
    return orElse();
  }
}

abstract class ShortSecret<T> implements ValueFailure<T> {
  const factory ShortSecret({required T failedValue}) = _$ShortSecret<T>;

  @override
  T get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $ShortSecretCopyWith<T, ShortSecret<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) then) =
      _$EmptyCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$EmptyCopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $EmptyCopyWith<T, $Res> {
  _$EmptyCopyWithImpl(Empty<T> _value, $Res Function(Empty<T>) _then)
      : super(_value, (v) => _then(v as Empty<T>));

  @override
  Empty<T> get _value => super._value as Empty<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(Empty<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Empty<T> implements Empty<T> {
  const _$Empty({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.empty(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Empty<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $EmptyCopyWith<T, Empty<T>> get copyWith =>
      _$EmptyCopyWithImpl<T, Empty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) invalidCredential,
    required TResult Function(T failedValue) shortSecret,
    required TResult Function(T failedValue) empty,
  }) {
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? invalidCredential,
    TResult Function(T failedValue)? shortSecret,
    TResult Function(T failedValue)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredential<T> value) invalidCredential,
    required TResult Function(ShortSecret<T> value) shortSecret,
    required TResult Function(Empty<T> value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredential<T> value)? invalidCredential,
    TResult Function(ShortSecret<T> value)? shortSecret,
    TResult Function(Empty<T> value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements ValueFailure<T> {
  const factory Empty({required T failedValue}) = _$Empty<T>;

  @override
  T get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $EmptyCopyWith<T, Empty<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
