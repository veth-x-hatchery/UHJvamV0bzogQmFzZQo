// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavigationEventTearOff {
  const _$NavigationEventTearOff();

  _Started started() {
    return const _Started();
  }

  NavigationEventGoTo goTo(SignInPageGoTo params) {
    return NavigationEventGoTo(
      params,
    );
  }
}

/// @nodoc
const $NavigationEvent = _$NavigationEventTearOff();

/// @nodoc
mixin _$NavigationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(SignInPageGoTo params) goTo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignInPageGoTo params)? goTo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignInPageGoTo params)? goTo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(NavigationEventGoTo value) goTo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(NavigationEventGoTo value)? goTo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(NavigationEventGoTo value)? goTo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationEventCopyWith<$Res> {
  factory $NavigationEventCopyWith(
          NavigationEvent value, $Res Function(NavigationEvent) then) =
      _$NavigationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationEventCopyWithImpl<$Res>
    implements $NavigationEventCopyWith<$Res> {
  _$NavigationEventCopyWithImpl(this._value, this._then);

  final NavigationEvent _value;
  // ignore: unused_field
  final $Res Function(NavigationEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
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
    return 'NavigationEvent.started()';
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
    required TResult Function(SignInPageGoTo params) goTo,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignInPageGoTo params)? goTo,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignInPageGoTo params)? goTo,
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
    required TResult Function(NavigationEventGoTo value) goTo,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(NavigationEventGoTo value)? goTo,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(NavigationEventGoTo value)? goTo,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements NavigationEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class $NavigationEventGoToCopyWith<$Res> {
  factory $NavigationEventGoToCopyWith(
          NavigationEventGoTo value, $Res Function(NavigationEventGoTo) then) =
      _$NavigationEventGoToCopyWithImpl<$Res>;
  $Res call({SignInPageGoTo params});

  $SignInPageGoToCopyWith<$Res> get params;
}

/// @nodoc
class _$NavigationEventGoToCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res>
    implements $NavigationEventGoToCopyWith<$Res> {
  _$NavigationEventGoToCopyWithImpl(
      NavigationEventGoTo _value, $Res Function(NavigationEventGoTo) _then)
      : super(_value, (v) => _then(v as NavigationEventGoTo));

  @override
  NavigationEventGoTo get _value => super._value as NavigationEventGoTo;

  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(NavigationEventGoTo(
      params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as SignInPageGoTo,
    ));
  }

  @override
  $SignInPageGoToCopyWith<$Res> get params {
    return $SignInPageGoToCopyWith<$Res>(_value.params, (value) {
      return _then(_value.copyWith(params: value));
    });
  }
}

/// @nodoc

class _$NavigationEventGoTo implements NavigationEventGoTo {
  const _$NavigationEventGoTo(this.params);

  @override
  final SignInPageGoTo params;

  @override
  String toString() {
    return 'NavigationEvent.goTo(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NavigationEventGoTo &&
            (identical(other.params, params) ||
                const DeepCollectionEquality().equals(other.params, params)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(params);

  @JsonKey(ignore: true)
  @override
  $NavigationEventGoToCopyWith<NavigationEventGoTo> get copyWith =>
      _$NavigationEventGoToCopyWithImpl<NavigationEventGoTo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(SignInPageGoTo params) goTo,
  }) {
    return goTo(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignInPageGoTo params)? goTo,
  }) {
    return goTo?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(SignInPageGoTo params)? goTo,
    required TResult orElse(),
  }) {
    if (goTo != null) {
      return goTo(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(NavigationEventGoTo value) goTo,
  }) {
    return goTo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(NavigationEventGoTo value)? goTo,
  }) {
    return goTo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(NavigationEventGoTo value)? goTo,
    required TResult orElse(),
  }) {
    if (goTo != null) {
      return goTo(this);
    }
    return orElse();
  }
}

abstract class NavigationEventGoTo implements NavigationEvent {
  const factory NavigationEventGoTo(SignInPageGoTo params) =
      _$NavigationEventGoTo;

  SignInPageGoTo get params => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NavigationEventGoToCopyWith<NavigationEventGoTo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$NavigationStateTearOff {
  const _$NavigationStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _GoTo goTo(SignInPageGoTo params) {
    return _GoTo(
      params,
    );
  }
}

/// @nodoc
const $NavigationState = _$NavigationStateTearOff();

/// @nodoc
mixin _$NavigationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SignInPageGoTo params) goTo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SignInPageGoTo params)? goTo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SignInPageGoTo params)? goTo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GoTo value) goTo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GoTo value)? goTo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GoTo value)? goTo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  final NavigationState _value;
  // ignore: unused_field
  final $Res Function(NavigationState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$NavigationStateCopyWithImpl<$Res>
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
    return 'NavigationState.initial()';
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
    required TResult Function(SignInPageGoTo params) goTo,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SignInPageGoTo params)? goTo,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SignInPageGoTo params)? goTo,
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
    required TResult Function(_GoTo value) goTo,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GoTo value)? goTo,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GoTo value)? goTo,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NavigationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$GoToCopyWith<$Res> {
  factory _$GoToCopyWith(_GoTo value, $Res Function(_GoTo) then) =
      __$GoToCopyWithImpl<$Res>;
  $Res call({SignInPageGoTo params});

  $SignInPageGoToCopyWith<$Res> get params;
}

/// @nodoc
class __$GoToCopyWithImpl<$Res> extends _$NavigationStateCopyWithImpl<$Res>
    implements _$GoToCopyWith<$Res> {
  __$GoToCopyWithImpl(_GoTo _value, $Res Function(_GoTo) _then)
      : super(_value, (v) => _then(v as _GoTo));

  @override
  _GoTo get _value => super._value as _GoTo;

  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_GoTo(
      params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as SignInPageGoTo,
    ));
  }

  @override
  $SignInPageGoToCopyWith<$Res> get params {
    return $SignInPageGoToCopyWith<$Res>(_value.params, (value) {
      return _then(_value.copyWith(params: value));
    });
  }
}

/// @nodoc

class _$_GoTo implements _GoTo {
  const _$_GoTo(this.params);

  @override
  final SignInPageGoTo params;

  @override
  String toString() {
    return 'NavigationState.goTo(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoTo &&
            (identical(other.params, params) ||
                const DeepCollectionEquality().equals(other.params, params)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(params);

  @JsonKey(ignore: true)
  @override
  _$GoToCopyWith<_GoTo> get copyWith =>
      __$GoToCopyWithImpl<_GoTo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SignInPageGoTo params) goTo,
  }) {
    return goTo(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SignInPageGoTo params)? goTo,
  }) {
    return goTo?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SignInPageGoTo params)? goTo,
    required TResult orElse(),
  }) {
    if (goTo != null) {
      return goTo(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_GoTo value) goTo,
  }) {
    return goTo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GoTo value)? goTo,
  }) {
    return goTo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_GoTo value)? goTo,
    required TResult orElse(),
  }) {
    if (goTo != null) {
      return goTo(this);
    }
    return orElse();
  }
}

abstract class _GoTo implements NavigationState {
  const factory _GoTo(SignInPageGoTo params) = _$_GoTo;

  SignInPageGoTo get params => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$GoToCopyWith<_GoTo> get copyWith => throw _privateConstructorUsedError;
}
