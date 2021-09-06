import 'package:flutter/material.dart';
import 'package:hatchery/features/signin/presentation/widgets/sign_in.widgets.dart';

Scaffold signInScaffold(
  BuildContext context, {
  bool leading = true,
  Function()? onPressed,
  required Widget child,
}) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: leading
          ? IconButton(
              key: const Key(SignInPageKeys.signInBackPageButton),
              icon: Icon(
                Icons.arrow_back_ios,
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
