import 'package:flutter/material.dart';
import 'package:vethx_beta/l10n/l10n.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/field_styles.dart';

class FieldCredential extends StatelessWidget {
  const FieldCredential({
    Key? key,
    this.focusNode,
    this.onEditingComplete,
    this.controller,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: vethxInputDecoration(
        context,
        hintText: context.l10n.signin_credentialHint,
      ),
      style: Theme.of(context).textTheme.bodyText1,
      validator: validator,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
    );
  }
}
