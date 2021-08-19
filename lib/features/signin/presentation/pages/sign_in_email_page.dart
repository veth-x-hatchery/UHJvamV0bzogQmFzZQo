import 'package:flutter/material.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

class SignInEmailPage extends StatelessWidget {
  const SignInEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return signInScaffold(
      context,
      child: const FormEmail(),
    );
  }
}
