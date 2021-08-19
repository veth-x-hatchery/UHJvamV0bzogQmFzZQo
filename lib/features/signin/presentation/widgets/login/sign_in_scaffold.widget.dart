import 'package:flutter/material.dart';

Scaffold signInScaffold(
  BuildContext context, {
  required Widget child,
  bool leading = true,
}) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: leading
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => Navigator.maybePop(context),
            )
          : null,
    ),
    body: child,
  );
}
