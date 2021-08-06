import 'package:vethx_login/core/consts/vethx_connect_texts.dart';
import 'package:vethx_login/ui/widgets/shared/platform_alert_dialog.widget.dart';
import 'package:flutter/material.dart';

enum VethxNotificationType {
  alert,
  snack,
  notification,
}

class VethxNotification {
  VethxNotification({
    required this.type,
    required this.message,
    this.title = '',
  });
  String title;
  String message;
  VethxNotificationType type;
}

void vethxNotify(BuildContext context, VethxNotification notification) {
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    switch (notification.type) {
      case VethxNotificationType.snack:
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(notification.message, textAlign: TextAlign.center),
          duration: const Duration(seconds: 3),
        ));
        break;
      case VethxNotificationType.alert:
        PlatformAlertDialog(
          title: notification.title,
          content: notification.message,
          defaultActionText: Texts.oK,
          cancelActionText: Texts.cancel,
        ).show(context);
        break;
      case VethxNotificationType.notification:
        break;
    }
  });
}
