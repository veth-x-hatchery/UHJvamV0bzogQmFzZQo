import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/field_styles.dart';

class FieldPassword extends StatefulWidget {
  const FieldPassword({
    Key? key,
    required this.passwordFormKey,
    required this.passwordFocusNode,
    required this.validatePassword,
    required this.controller,
    this.dica,
  }) : super(key: key);

  final GlobalKey<FormState> passwordFormKey;
  final FocusNode passwordFocusNode;
  final void Function() validatePassword;
  final String? dica;
  final TextEditingController controller;

  @override
  _FieldPasswordState createState() => _FieldPasswordState();
}

class _FieldPasswordState extends State<FieldPassword> {
  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.passwordFormKey,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.passwordFocusNode,
        autofocus: true,
        keyboardType: TextInputType.text,
        obscureText: _hidePassword,
        decoration: vethxInputDecoration(
          context,
          hintText: Texts.passwordHint,
          suffixIcon: IconButton(
            icon: Icon(
              _hidePassword ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () => setState(() => _hidePassword = !_hidePassword),
          ),
        ),
        style: Theme.of(context).textTheme.bodyText1,
        validator: (value) {
          return null;
        },
        onEditingComplete: widget.validatePassword,
      ),
    );
  }
}
