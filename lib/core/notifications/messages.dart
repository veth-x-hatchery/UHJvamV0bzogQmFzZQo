import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/ui/widgets/shared/platform_alert_dialog.widget.dart';

const snackBarNotificationDuration = Duration(seconds: 3);

void vethxNotify(BuildContext context, VethxNotification notification) {
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    switch (notification.type) {
      case VethxNotificationType.snack:
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(notification.message, textAlign: TextAlign.center),
          duration: snackBarNotificationDuration,
        ));
        break;
      case VethxNotificationType.alert:
        PlatformAlertDialog(
          title: notification.title ?? '',
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
