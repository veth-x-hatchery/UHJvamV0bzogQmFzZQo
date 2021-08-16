import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/domain/core/value_validators.dart';
import 'package:vethx_beta/features/signin/presentation/utils/custom_validators.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/field_styles.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    Key? key,
    required this.emailFormKey,
    required this.emailFocusNode,
    required this.emailEditingController,
    required this.emailValidate,
  }) : super(key: key);

  final GlobalKey<FormState> emailFormKey;
  final FocusNode emailFocusNode;
  final void Function() emailValidate;
  final TextEditingController emailEditingController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: emailFormKey,
      child: TextFormField(
        controller: emailEditingController,
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
          if (value == null) {
            return 'invalid email';
          }
          validateEmailAddress(value).fold(
            (l) => 'invalid email',
            (r) => null,
          );
        },
        onEditingComplete: emailValidate,
        // onSaved: (input) => _gerenciador.email = input!,
      ),
    );
  }
}
