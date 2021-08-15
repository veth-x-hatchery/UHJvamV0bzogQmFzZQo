import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/notifications/messages.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/field_password.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/logo_text_loading.widget.dart';

class SignInPasswordEntry extends StatefulWidget {
  const SignInPasswordEntry({Key? key}) : super(key: key);

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
      await Future.delayed(const Duration(seconds: 1)).then((void _) {
        setState(() {
          _loading = false;
        });
        BlocProvider.of<SignInBloc>(context).goToPage(const SignInPageGoTo(
          from: SignInPageRoutes.passwordEntry,
          to: SignInPageRoutes.emailEntry,
        ));
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: Navigator.of(context).maybePop,
        ),
      ),
      body: FormColumn(
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
            onPressed: _passwordVerify,
            child: Text(
              Texts.goToAccess,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          SizedBox(height: SizeConfig.defaultEdgeSpace),
          TextButton(
            onPressed: _newPassword,
            child: Text(
              Texts.forgotMyPassword,
              style: Theme.of(context).textTheme.button,
            ),
          ),
          TextButton(
            onPressed: _loading
                ? null
                : () => BlocProvider.of<SignInBloc>(context)
                        .goToPage(const SignInPageGoTo(
                      from: SignInPageRoutes.passwordEntry,
                      to: SignInPageRoutes.emailEntry,
                    )),
            child: Text(
              Texts.changeEmail,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ],
      ),
    );
  }
}
