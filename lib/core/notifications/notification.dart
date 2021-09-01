import 'package:equatable/equatable.dart';
import 'package:vethx_beta/l10n/l10n.dart';

enum VethxNotificationType {
  alert,
  snack,
  notification,
}

class VethxNotification extends Equatable {
  final VethxNotificationType type;
  final MessageFromLocations message;
  final MessageFromLocations? title;

  const VethxNotification._internal({
    required this.type,
    required this.message,
    this.title,
  });

  factory VethxNotification.snack({
    required MessageFromLocations message,
  }) =>
      VethxNotification._internal(
        message: message,
        type: VethxNotificationType.snack,
      );

  factory VethxNotification.alert({
    required MessageFromLocations message,
    required MessageFromLocations title,
  }) =>
      VethxNotification._internal(
        title: title,
        message: message,
        type: VethxNotificationType.alert,
      );

  @override
  List<Object?> get props => [message.toString()];
}
