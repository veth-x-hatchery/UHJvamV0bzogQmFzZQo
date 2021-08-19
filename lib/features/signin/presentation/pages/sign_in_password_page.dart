import 'package:flutter/material.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

class SignInPasswordPage extends StatelessWidget {
  final String? email;

  const SignInPasswordPage({
    Key? key,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return signInScaffold(
      context,
      child: FormPassword(informedEmail: email),
    );
  }
}
