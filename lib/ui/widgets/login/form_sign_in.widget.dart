import 'package:flutter/material.dart';
import 'package:vethx_login/core/consts/vethx_connect_texts.dart';
import 'package:vethx_login/core/consts/size_config.dart';
import 'package:vethx_login/core/notifications/messages.dart';
import 'package:vethx_login/ui/login/email_log_in.page.dart';
import 'package:vethx_login/ui/widgets/login/field_email.widget.dart';
import 'package:vethx_login/ui/widgets/login/field_password.widget.dart';
import 'package:vethx_login/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_login/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_login/ui/widgets/shared/forms/logo_text_loading.widget.dart';

class FormRegisterEmailSignIn extends StatefulWidget {
  const FormRegisterEmailSignIn({
    Key? key,
    required this.nextForm,
  }) : super(key: key);

  final void Function(EmailLoginPageIndex delta) nextForm;

  @override
  _FormRegisterEmailSignInState createState() =>
      _FormRegisterEmailSignInState();
}

class _FormRegisterEmailSignInState extends State<FormRegisterEmailSignIn> {
  bool _loading = false;

  final _emailFormKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();

  final _passwordFormKey = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();

  void _validateEmail() {
    if (_emailFormKey.currentState!.validate()) {
      _emailFormKey.currentState!.save();
      FocusScope.of(context).requestFocus(_passwordFocusNode);
    }
  }

  Future<void> _validatePassword() async {
    if (_passwordFormKey.currentState!.validate()) {
      _passwordFormKey.currentState!.save();
      setState(() {
        _loading = true;
      });
      await Future.delayed(Duration(seconds: 1)).then((void _) {
        setState(() {
          _loading = false;
        });
        widget.nextForm(EmailLoginPageIndex.password);
      });
    }
  }

  @override
  void initState() {
    _emailFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _emailFormKey.currentState?.dispose();
    _emailFocusNode.dispose();

    _passwordFormKey.currentState?.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormColumn(children: [
      SizedBox(height: SizeConfig.defaultEdgeSpace),
      LogoTextLoading(
          title: Texts.signInPageTitle,
          size: SizeConfig.screenHeight * 0.25,
          loading: _loading),
      SizedBox(height: SizeConfig.defaultEdgeSpace),
      CampoDeEmail(
        emailFormKey: _emailFormKey,
        emailFocusNode: _emailFocusNode,
        emailValidate: _validateEmail,
      ),
      SizedBox(height: SizeConfig.defaultEdgeSpace),
      FieldPassword(
        passwordFormKey: _passwordFormKey,
        passwordFocusNode: _passwordFocusNode,
        hidePassword: _validatePassword,
      ),
      SizedBox(height: SizeConfig.defaultEdgeSpace),
      CustomRaisedButton(
        child: Text(
          Texts.goToNextStep,
          style: Theme.of(context).textTheme.button,
        ),
        onPressed: _validatePassword,
      ),
    ]);
  }
}
