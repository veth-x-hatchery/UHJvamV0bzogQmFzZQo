import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vethx_login/core/consts/size_config.dart';
import 'package:vethx_login/core/consts/vethx_connect_texts.dart';
import 'package:vethx_login/ui/login/sign_in_page.dart';
import 'package:vethx_login/ui/widgets/login/field_email.widget.dart';
import 'package:vethx_login/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_login/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_login/ui/widgets/shared/forms/logo_text_loading.widget.dart';

class SignInEmailEntry extends StatefulWidget {
  const SignInEmailEntry({
    Key? key,
    required this.nextForm,
  }) : super(key: key);

  final void Function(SignInPageRoutes delta) nextForm;

  @override
  _SignInEmailEntryState createState() => _SignInEmailEntryState();
}

class _SignInEmailEntryState extends State<SignInEmailEntry> {
  bool _loading = false;

  final _emailFormKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();

  Future<void> _validarEmail() async {
    if (_emailFormKey.currentState!.validate()) {
      _emailFormKey.currentState!.save();
      setState(() {
        _loading = true;
      });
      await Future.delayed(Duration(seconds: 1)).then((void _) {
        setState(() {
          _loading = false;
        });
        widget.nextForm(SignInPageRoutes.registerEmailSignIn);
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
              size: SizeConfig.screenHeight * 0.25, loading: _loading),
          SizedBox(height: SizeConfig.defaultEdgeSpace),
          EmailFormField(
            emailFormKey: _emailFormKey,
            emailFocusNode: _emailFocusNode,
            emailValidate: _validarEmail,
          ),
          SizedBox(height: SizeConfig.defaultEdgeSpace),
          CustomRaisedButton(
            child: Text(
              Texts.goToNextStep,
              style: Theme.of(context).textTheme.button,
            ),
            onPressed: _validarEmail,
          ),
        ],
      ),
    );
  }
}
