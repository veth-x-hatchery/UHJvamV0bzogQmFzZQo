// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VethxNotificationTearOff {
  const _$VethxNotificationTearOff();

  _VethxNotification _internal(
      {required VethxNotificationType type,
      required dynamic message,
      dynamic title}) {
    return _VethxNotification(
      type: type,
      message: message,
      title: title,
    );
  }
}

/// @nodoc
const $VethxNotification = _$VethxNotificationTearOff();

/// @nodoc
mixin _$VethxNotification {
  VethxNotificationType get type => throw _privateConstructorUsedError;
  dynamic get message => throw _privateConstructorUsedError;
  dynamic get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VethxNotificationCopyWith<VethxNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VethxNotificationCopyWith<$Res> {
  factory $VethxNotificationCopyWith(
          VethxNotification value, $Res Function(VethxNotification) then) =
      _$VethxNotificationCopyWithImpl<$Res>;
  $Res call({VethxNotificationType type, dynamic message, dynamic title});
}

/// @nodoc
class _$VethxNotificationCopyWithImpl<$Res>
    implements $VethxNotificationCopyWith<$Res> {
  _$VethxNotificationCopyWithImpl(this._value, this._then);

  final VethxNotification _value;
  // ignore: unused_field
  final $Res Function(VethxNotification) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? message = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VethxNotificationType,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$VethxNotificationCopyWith<$Res>
    implements $VethxNotificationCopyWith<$Res> {
  factory _$VethxNotificationCopyWith(
          _VethxNotification value, $Res Function(_VethxNotification) then) =
      __$VethxNotificationCopyWithImpl<$Res>;
  @override
  $Res call({VethxNotificationType type, dynamic message, dynamic title});
}

/// @nodoc
class __$VethxNotificationCopyWithImpl<$Res>
    extends _$VethxNotificationCopyWithImpl<$Res>
    implements _$VethxNotificationCopyWith<$Res> {
  __$VethxNotificationCopyWithImpl(
      _VethxNotification _value, $Res Function(_VethxNotification) _then)
      : super(_value, (v) => _then(v as _VethxNotification));

  @override
  _VethxNotification get _value => super._value as _VethxNotification;

  @override
  $Res call({
    Object? type = freezed,
    Object? message = freezed,
    Object? title = freezed,
  }) {
    return _then(_VethxNotification(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VethxNotificationType,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_VethxNotification implements _VethxNotification {
  _$_VethxNotification({required this.type, required this.message, this.title});

  @override
  final VethxNotificationType type;
  @override
  final dynamic message;
  @override
  final dynamic title;

  @override
  String toString() {
    return 'VethxNotification._internal(type: $type, message: $message, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VethxNotification &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$VethxNotificationCopyWith<_VethxNotification> get copyWith =>
      __$VethxNotificationCopyWithImpl<_VethxNotification>(this, _$identity);
}

abstract class _VethxNotification implements VethxNotification {
  factory _VethxNotification(
      {required VethxNotificationType type,
      required dynamic message,
      dynamic title}) = _$_VethxNotification;

  @override
  VethxNotificationType get type => throw _privateConstructorUsedError;
  @override
  dynamic get message => throw _privateConstructorUsedError;
  @override
  dynamic get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VethxNotificationCopyWith<_VethxNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
