import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/l10n/l10n.dart';

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
    required dynamic message,
    dynamic title,
  }) = _VethxNotification;

  factory VethxNotification.snack({
    required dynamic message,
  }) =>
      VethxNotification._internal(
        message: message,
        type: VethxNotificationType.snack,
      );

  factory VethxNotification.alert({
    required dynamic message,
    required dynamic title,
  }) =>
      VethxNotification._internal(
        title: title,
        message: message,
        type: VethxNotificationType.alert,
      );

  String reasonMessage(AppLocalizations? _) =>
      (message as MessageFromLocations).call(_)!;

  String? reasonTitle(AppLocalizations? _) =>
      (title as MessageFromLocations).call(_)!;
}
