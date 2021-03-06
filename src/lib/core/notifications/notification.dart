import 'package:equatable/equatable.dart';
import 'package:hatchery/l10n/l10n.dart';

enum VethxNotificationType {
  alert,
  snack,
  notification,
}

class VethxNotification extends Equatable {
  final VethxNotificationType type;
  final MessageFromLocalizations message;
  final MessageFromLocalizations? title;
  // final int hash

  const VethxNotification._internal({
    required this.type,
    required this.message,
    this.title,
  });

  factory VethxNotification.snack({
    required MessageFromLocalizations message,
  }) =>
      VethxNotification._internal(
        message: message,
        type: VethxNotificationType.snack,
      );

  factory VethxNotification.alert({
    required MessageFromLocalizations message,
    required MessageFromLocalizations title,
  }) =>
      VethxNotification._internal(
        title: title,
        message: message,
        type: VethxNotificationType.alert,
      );

  @override
  List<Object?> get props => [
        type,
        message.overridedHash,
      ];
}
