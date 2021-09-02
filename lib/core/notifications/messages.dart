import 'package:flutter/material.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/l10n/l10n.dart';
import 'package:vethx_beta/ui/widgets/shared/platform_alert_dialog.widget.dart';

const snackBarNotificationDuration = Duration(seconds: 3);

void vethxNotify(BuildContext context, VethxNotification notification) {
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    switch (notification.type) {
      case VethxNotificationType.snack:
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(notification.message.translate(context.l10n),
              textAlign: TextAlign.center),
          duration: snackBarNotificationDuration,
        ));
        break;
      case VethxNotificationType.alert:
        PlatformAlertDialog(
          title: notification.title?.translate(context.l10n) ?? '',
          content: notification.message.translate(context.l10n),
          defaultActionText: context.l10n.comum_ok,
          cancelActionText: context.l10n.comum_cancel,
        ).show(context);
        break;
      case VethxNotificationType.notification:
        break;
    }
  });
}
