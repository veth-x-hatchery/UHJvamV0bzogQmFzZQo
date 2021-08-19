import 'package:flutter/material.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

class SignInRegisterPage extends StatelessWidget {
  final String? email;

  const SignInRegisterPage({
    Key? key,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return signInScaffold(context, child: FormRegister(informedEmail: email));
  }
}
