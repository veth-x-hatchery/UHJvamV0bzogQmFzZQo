import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/field_styles.dart';

class FiedEmail extends StatelessWidget {
  const FiedEmail({
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
        // initialValue: _gerenciador.email,
        focusNode: emailFocusNode,
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: vethxInputDecoration(
          context,
          hintText: Texts.emailHint,
        ),
        style: Theme.of(context).textTheme.bodyText1,
        validator: (value) {
          return null;
        },
        onEditingComplete: validateEmail,
      ),
    );
  }
}
