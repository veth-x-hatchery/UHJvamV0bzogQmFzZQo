import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/field_styles.dart';

class FieldEmail extends StatelessWidget {
  const FieldEmail({
    Key? key,
    required this.emailFormKey,
    required this.emailFocusNode,
    required this.validateEmail,
    required this.controller,
  }) : super(key: key);

  final GlobalKey<FormState> emailFormKey;
  final FocusNode emailFocusNode;
  final void Function() validateEmail;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: emailFormKey,
      child: TextFormField(
        controller: controller,
        focusNode: emailFocusNode,
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: vethxInputDecoration(
          context,
          hintText: Texts.emailHint,
        ),
        style: Theme.of(context).textTheme.bodyText1,
        validator: (value) => EmailAddress(value).validation,
        onEditingComplete: validateEmail,
      ),
    );
  }
}
