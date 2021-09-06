import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hatchery/l10n/l10n.dart';
import 'package:hatchery/ui/widgets/shared/platform_alert_dialog.widget.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog(
    BuildContext context, {
    required String title,
    required Exception exception,
    required String alternativeMessage,
  }) : super(
            title: title,
            content: _message(exception, alternativeMessage),
            defaultActionText: context.l10n.comum_ok,
            cancelActionText: context.l10n.comum_cancel);

  static String _message(Exception exception, String alternativeMessage) {
    if (exception is PlatformException) {
      if (exception.message == '') {
        if (exception.code == '') {
          return '';
        }
      }
    }

    return 'PlatformExceptionAlertDialog => TODO: ERROR';
  }
}
