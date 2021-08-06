import 'package:vethx_login/core/consts/vethx_connect_texts.dart';
import 'package:vethx_login/ui/widgets/shared/platform_alert_dialog.widget.dart';
import 'package:flutter/services.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    required String title,
    required Exception exception,
    required String alternativeMessage,
  }) : super(
            title: title,
            content: _message(exception, alternativeMessage),
            defaultActionText: Texts.oK,
            cancelActionText: Texts.cancel);

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
