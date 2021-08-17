// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_go_to.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInPageGoToTearOff {
  const _$SignInPageGoToTearOff();

  _SignInPageGoTo call(
      {required SignInPageRoutes from,
      required SignInPageRoutes to,
      Object? parameters}) {
    return _SignInPageGoTo(
      from: from,
      to: to,
      parameters: parameters,
    );
  }
}

/// @nodoc
const $SignInPageGoTo = _$SignInPageGoToTearOff();

/// @nodoc
mixin _$SignInPageGoTo {
  SignInPageRoutes get from => throw _privateConstructorUsedError;
  SignInPageRoutes get to => throw _privateConstructorUsedError;
  Object? get parameters => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInPageGoToCopyWith<SignInPageGoTo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPageGoToCopyWith<$Res> {
  factory $SignInPageGoToCopyWith(
          SignInPageGoTo value, $Res Function(SignInPageGoTo) then) =
      _$SignInPageGoToCopyWithImpl<$Res>;
  $Res call({SignInPageRoutes from, SignInPageRoutes to, Object? parameters});
}

/// @nodoc
class _$SignInPageGoToCopyWithImpl<$Res>
    implements $SignInPageGoToCopyWith<$Res> {
  _$SignInPageGoToCopyWithImpl(this._value, this._then);

  final SignInPageGoTo _value;
  // ignore: unused_field
  final $Res Function(SignInPageGoTo) _then;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_value.copyWith(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as SignInPageRoutes,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as SignInPageRoutes,
      parameters: parameters == freezed ? _value.parameters : parameters,
    ));
  }
}

/// @nodoc
abstract class _$SignInPageGoToCopyWith<$Res>
    implements $SignInPageGoToCopyWith<$Res> {
  factory _$SignInPageGoToCopyWith(
          _SignInPageGoTo value, $Res Function(_SignInPageGoTo) then) =
      __$SignInPageGoToCopyWithImpl<$Res>;
  @override
  $Res call({SignInPageRoutes from, SignInPageRoutes to, Object? parameters});
}

/// @nodoc
class __$SignInPageGoToCopyWithImpl<$Res>
    extends _$SignInPageGoToCopyWithImpl<$Res>
    implements _$SignInPageGoToCopyWith<$Res> {
  __$SignInPageGoToCopyWithImpl(
      _SignInPageGoTo _value, $Res Function(_SignInPageGoTo) _then)
      : super(_value, (v) => _then(v as _SignInPageGoTo));

  @override
  _SignInPageGoTo get _value => super._value as _SignInPageGoTo;

  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? parameters = freezed,
  }) {
    return _then(_SignInPageGoTo(
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as SignInPageRoutes,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as SignInPageRoutes,
      parameters: parameters == freezed ? _value.parameters : parameters,
    ));
  }
}

/// @nodoc

class _$_SignInPageGoTo implements _SignInPageGoTo {
  _$_SignInPageGoTo({required this.from, required this.to, this.parameters});

  @override
  final SignInPageRoutes from;
  @override
  final SignInPageRoutes to;
  @override
  final Object? parameters;

  @override
  String toString() {
    return 'SignInPageGoTo(from: $from, to: $to, parameters: $parameters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInPageGoTo &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.parameters, parameters) ||
                const DeepCollectionEquality()
                    .equals(other.parameters, parameters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(parameters);

  @JsonKey(ignore: true)
  @override
  _$SignInPageGoToCopyWith<_SignInPageGoTo> get copyWith =>
      __$SignInPageGoToCopyWithImpl<_SignInPageGoTo>(this, _$identity);
}

abstract class _SignInPageGoTo implements SignInPageGoTo {
  factory _SignInPageGoTo(
      {required SignInPageRoutes from,
      required SignInPageRoutes to,
      Object? parameters}) = _$_SignInPageGoTo;

  @override
  SignInPageRoutes get from => throw _privateConstructorUsedError;
  @override
  SignInPageRoutes get to => throw _privateConstructorUsedError;
  @override
  Object? get parameters => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignInPageGoToCopyWith<_SignInPageGoTo> get copyWith =>
      throw _privateConstructorUsedError;
}
