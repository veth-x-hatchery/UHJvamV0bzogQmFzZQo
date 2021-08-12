import 'package:flutter/material.dart';
import 'package:vethx_login/core/consts/size_config.dart';
import 'package:vethx_login/core/notifications/messages.dart';
import 'package:vethx_login/ui/login/sign_in_page.dart';
import 'package:vethx_login/ui/widgets/login/sign_in_button.widget.dart';
import 'package:vethx_login/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_login/ui/widgets/shared/forms/logo_text_loading.widget.dart';

class SignInOptions extends StatefulWidget {
  const SignInOptions({
    Key? key,
    required this.nextForm,
  }) : super(key: key);

  final void Function(SignInPageRoutes delta) nextForm;

  @override
  _SignInOptionsState createState() => _SignInOptionsState();
}

class _SignInOptionsState extends State<SignInOptions> {
  bool _loading = false;

  Future<void> _signIn() async {
    if (_loading) {
      return;
    }
    setState(() => _loading = !_loading);
    await Future.delayed(Duration(seconds: 1)).then((void _) {
      vethxNotify(
        context,
        VethxNotification(
          title: 'Sign In',
          message: 'Not today my friend...',
          type: VethxNotificationType.alert,
        ),
      );
      setState(() => _loading = !_loading);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormColumn(
      children: [
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        LogoTextLoading(
            size: SizeConfig.screenHeight * 0.25, loading: _loading),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        SignInButton(
          assetName: 'assets/images/google-logo.png',
          text: 'Sign in with Google',
          textColor: Colors.black87,
          color: Colors.white,
          // ignore: avoid_returning_null_for_void
          onPressed: _signIn,
        ),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        SignInButton(
          assetName: 'assets/images/facebook-logo.png',
          text: 'Sign in with Facebook',
          textColor: Colors.white,
          color: Color(0xFF334D92),
          // ignore: avoid_returning_null_for_void
          onPressed: _signIn,
        ),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        SignInButton(
          assetName: 'assets/images/mail-logo.png',
          text: 'Sign in with email',
          textColor: Colors.white,
          color: Colors.teal[700],
          onPressed: () => widget.nextForm(SignInPageRoutes.emailEntry),
        ),
      ],
    );
  }
}
