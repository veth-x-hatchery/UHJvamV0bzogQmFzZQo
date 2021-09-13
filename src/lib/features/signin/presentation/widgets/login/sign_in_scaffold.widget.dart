import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hatchery/features/signin/presentation/widgets/sign_in.widgets.dart';

Scaffold signInScaffold(
  BuildContext context, {
  bool leading = true,
  IconData? icon,
  Function()? onPressed,
  required Widget child,
}) {
  icon ??= Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios;
  return Scaffold(
    resizeToAvoidBottomInset: true,
    appBar: AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: leading
          ? IconButton(
              key: const Key(SignInPageKeys.signInBackPageButton),
              icon: Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () =>
                  onPressed == null ? Navigator.maybePop(context) : onPressed(),
            )
          : null,
    ),
    body: child,
  );
}
