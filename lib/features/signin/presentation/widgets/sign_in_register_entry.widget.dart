import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/field_email.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/field_password.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/logo_text_loading.widget.dart';

class SignInRegisterEntry extends StatefulWidget {
  const SignInRegisterEntry({
    Key? key,
    this.email,
  }) : super(key: key);

  final String? email;

  @override
  _SignInRegisterEntryState createState() => _SignInRegisterEntryState();
}

class _SignInRegisterEntryState extends State<SignInRegisterEntry> {
  bool _loading = false;

  final _emailFormKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _emailEditingController = TextEditingController();

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
      await Future.delayed(const Duration(seconds: 1)).then((void _) {
        setState(() {
          _loading = false;
        });
        BlocProvider.of<SignInBloc>(context).goToPage(const SignInPageGoTo(
          from: SignInPageRoutes.registerEmailSignIn,
          to: SignInPageRoutes.passwordEntry,
        ));
      });
    }
  }

  @override
  void initState() {
    if (widget.email != null) {
      _emailEditingController.text = widget.email!;
      _passwordFocusNode.requestFocus();
    } else {
      _emailFocusNode.requestFocus();
    }
    super.initState();
  }

  @override
  void dispose() {
    _emailFormKey.currentState?.dispose();
    _emailFocusNode.dispose();
    _emailEditingController.dispose();

    _passwordFormKey.currentState?.dispose();
    _passwordFocusNode.dispose();
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
              title: Texts.signInRegisterEntryTitle,
              size: SizeConfig.screenHeight * 0.25,
              loading: _loading),
          SizedBox(height: SizeConfig.defaultEdgeSpace),
          EmailFormField(
            emailEditingController: _emailEditingController,
            emailFormKey: _emailFormKey,
            emailFocusNode: _emailFocusNode,
            emailValidate: _validateEmail,
          ),
          SizedBox(height: SizeConfig.defaultEdgeSpace),
          PasswordFormField(
            passwordFormKey: _passwordFormKey,
            passwordFocusNode: _passwordFocusNode,
            hidePassword: _validatePassword,
          ),
          SizedBox(height: SizeConfig.defaultEdgeSpace),
          CustomRaisedButton(
            onPressed: _validatePassword,
            child: Text(
              Texts.goToNextStep,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ],
      ),
    );
  }
}
