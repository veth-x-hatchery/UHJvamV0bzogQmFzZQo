import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/field_email.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/logo_text_loading.widget.dart';

class SignInEmailEntry extends StatefulWidget {
  const SignInEmailEntry({Key? key}) : super(key: key);

  @override
  _SignInEmailEntryState createState() => _SignInEmailEntryState();
}

class _SignInEmailEntryState extends State<SignInEmailEntry> {
  final _emailFormKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _emailEditingController = TextEditingController();

  Future<void> _validateEmail() async {
    if (_emailFormKey.currentState!.validate()) {
      _emailFormKey.currentState!.save();
      BlocProvider.of<SignInBloc>(context).add(SignInCheckEmail(
        fromPage: SignInPageRoutes.emailEntry,
        email: _emailEditingController.text,
      ));
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
    _emailEditingController.dispose();
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
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          final _loading = state == SignInLoading();
          return FormColumn(
            children: [
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              LogoTextLoading(
                  size: SizeConfig.screenHeight * 0.25, loading: _loading),
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              EmailFormField(
                emailFormKey: _emailFormKey,
                emailEditingController: _emailEditingController,
                emailFocusNode: _emailFocusNode,
                emailValidate: _validateEmail,
              ),
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              CustomRaisedButton(
                onPressed: _validateEmail,
                child: Text(
                  Texts.goToNextStep,
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
