import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

enum VethxNotificationType {
  alert,
  snack,
  notification,
}

@freezed
class VethxNotification with _$VethxNotification {
  factory VethxNotification._internal({
    required VethxNotificationType type,
    required String message,
    String? title,
  }) = _VethxNotification;

  factory VethxNotification.snack({required String message}) =>
      VethxNotification._internal(
        message: message,
        type: VethxNotificationType.snack,
      );

  factory VethxNotification.alert({
    required String message,
    required String title,
  }) =>
      VethxNotification._internal(
        title: title,
        message: message,
        type: VethxNotificationType.alert,
      );
}
