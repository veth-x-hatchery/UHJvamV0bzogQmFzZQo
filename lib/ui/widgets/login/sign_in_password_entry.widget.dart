import 'package:flutter/material.dart';
import 'package:vethx_login/core/consts/vethx_connect_texts.dart';
import 'package:vethx_login/core/consts/size_config.dart';
import 'package:vethx_login/core/notifications/messages.dart';
import 'package:vethx_login/ui/login/sign_in_page.dart';
import 'package:vethx_login/ui/widgets/login/field_password.widget.dart';
import 'package:vethx_login/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_login/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_login/ui/widgets/shared/forms/logo_text_loading.widget.dart';

class SignInPasswordEntry extends StatefulWidget {
  const SignInPasswordEntry({
    Key? key,
    required this.nextForm,
  }) : super(key: key);

  final void Function(SignInPageRoutes delta) nextForm;

  @override
  _SignInPasswordEntryState createState() => _SignInPasswordEntryState();
}

class _SignInPasswordEntryState extends State<SignInPasswordEntry> {
  bool _loading = false;

  final _senhaFormKey = GlobalKey<FormState>();
  final _senhaFocusNode = FocusNode();

  Future<void> _newPassword() async {
    if (_loading) {
      return;
    }
    vethxNotify(
      context,
      VethxNotification(
        title: 'Password',
        message: Texts.resetPasswordRequestAnswer,
        type: VethxNotificationType.snack,
      ),
    );
  }

  Future<void> _passwordVerify() async {
    if (_loading) {
      return;
    }
    if (_senhaFormKey.currentState!.validate()) {
      _senhaFormKey.currentState!.save();
      setState(() {
        _loading = true;
      });
      await Future.delayed(Duration(seconds: 1)).then((void _) {
        setState(() {
          _loading = false;
        });
        widget.nextForm(SignInPageRoutes.emailEntry);
      });
    }
  }

  @override
  void initState() {
    _senhaFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _senhaFormKey.currentState?.dispose();
    _senhaFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormColumn(
      children: [
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        LogoTextLoading(
          size: SizeConfig.screenHeight * 0.25,
          loading: _loading,
        ),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        PasswordFormField(
          passwordFormKey: _senhaFormKey,
          passwordFocusNode: _senhaFocusNode,
          hidePassword: _passwordVerify,
        ),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        CustomRaisedButton(
          child: Text(
            Texts.goToAccess,
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: _passwordVerify,
        ),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        TextButton(
          child: Text(
            Texts.forgotMyPassword,
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: _newPassword,
        ),
        TextButton(
          child: Text(
            Texts.changeEmail,
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: _loading
              ? null
              : () => widget.nextForm(SignInPageRoutes.emailEntry),
        ),
      ],
    );
  }
}
