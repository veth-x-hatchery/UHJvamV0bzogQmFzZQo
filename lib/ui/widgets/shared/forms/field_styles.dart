import 'package:flutter/material.dart';

InputDecoration vethxInputDecoration(
  BuildContext context, {
  required String hintText,
  Widget? suffixIcon,
}) =>
    InputDecoration(
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.only(left: 20, right: 20),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      hintText: hintText,
      labelStyle: Theme.of(context).textTheme.bodyText1,
    );
