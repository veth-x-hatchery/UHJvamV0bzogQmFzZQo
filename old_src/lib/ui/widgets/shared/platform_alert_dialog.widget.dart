import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform.widget.dart';

class PlatformAlertDialog extends PlatformWidget {
  const PlatformAlertDialog({
    required this.title,
    required this.content,
    required this.cancelActionText,
    required this.defaultActionText,
  });

  final String title;
  final String content;
  final String cancelActionText;
  final String defaultActionText;

  Future<bool?> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
            context: context,
            builder: (context) => this,
          )
        : await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (context) => this,
          );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final actions = <Widget>[];
    actions.add(PlatformAlertDialogAction(
      onPressed: () => Navigator.of(context).pop(false),
      child: Text(cancelActionText),
    ));
    actions.add(PlatformAlertDialogAction(
      onPressed: () => Navigator.of(context).pop(true),
      child: Text(defaultActionText),
    ));
    return actions;
  }
}

class PlatformAlertDialogAction extends PlatformWidget {
  const PlatformAlertDialogAction({
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      onPressed: onPressed,
      child: child,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

void muellerSnackBar(
  String message, {
  Duration duration = const Duration(seconds: 2),
  required GlobalKey<ScaffoldState> scaffoldKey,
}) {
  // ignore: deprecated_member_use
  scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(message, textAlign: TextAlign.center),
      duration: duration,
    ),
  );
}
