import 'package:equatable/equatable.dart';

enum VethxNotificationType {
  alert,
  snack,
  notification,
}

class VethxNotification extends Equatable {
  final VethxNotificationType type;
  final String message;
  final String? title;

  const VethxNotification._internal({
    required this.type,
    required this.message,
    this.title,
  });

  factory VethxNotification.snack({
    required String message,
  }) =>
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

  @override
  List<Object?> get props => [message.toString()];
}
