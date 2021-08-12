import 'package:flutter/material.dart';
import 'package:vethx_login/core/consts/vethx_connect_texts.dart';
import 'package:vethx_login/ui/widgets/shared/forms/field_styles.dart';
import 'package:vethx_login/ui/widgets/validators/custom.validators.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    Key? key,
    required this.emailFormKey,
    required this.emailFocusNode,
    required this.emailValidate,
  }) : super(key: key);

  final GlobalKey<FormState> emailFormKey;
  final FocusNode emailFocusNode;
  final void Function() emailValidate;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: emailFormKey,
      child: TextFormField(
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
          if (!CustomValidators.isValidEmail(value)) {
            return Texts.invalidEmail;
          }
          return null;
        },
        onEditingComplete: emailValidate,
        // onSaved: (input) => _gerenciador.email = input!,
      ),
    );
  }
}
