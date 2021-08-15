import 'package:flutter/material.dart';
import 'package:vethx_login/core/consts/vethx_connect_texts.dart';
import 'package:vethx_login/features/signin/presentation/utils/custom_validators.dart';
import 'package:vethx_login/ui/widgets/shared/forms/field_styles.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    Key? key,
    required this.passwordFormKey,
    required this.passwordFocusNode,
    required this.hidePassword,
    this.hint,
  }) : super(key: key);

  final GlobalKey<FormState> passwordFormKey;
  final FocusNode passwordFocusNode;
  final void Function() hidePassword;
  final String? hint;

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.passwordFormKey,
      child: TextFormField(
        // initialValue: _gerenciador.senha,
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
          CustomValidators().emailAnalysis(value).fold(
                (l) => l.message,
                (r) => null,
              );
        },
        onEditingComplete: widget.hidePassword,
        // onSaved: (input) => _gerenciador.senha = input!,
      ),
    );
  }
}
