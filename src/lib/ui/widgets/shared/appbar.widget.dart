import 'dart:io';
import 'package:flutter/material.dart';

AppBar vethxAppBar(
  BuildContext context, {
  String? title,
  bool leading = true,
  bool automaticallyImplyLeading = true,
  List<Widget>? actions,
  VoidCallback? onBackPress,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    bottom: bottom,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    actions: actions,
    // flexibleSpace: muellerAppBarImage(),
    elevation: 0,
    centerTitle: true,
    title: Text(
      title ?? '',
      style: Theme.of(context).textTheme.headline1!.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
    ),
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: leading
        ? IconButton(
            icon: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              if (onBackPress != null) {
                onBackPress();
              }
              _return(context);
            },
          )
        : null,
  );
}

void _return(BuildContext context) => Navigator.of(context).maybePop();
