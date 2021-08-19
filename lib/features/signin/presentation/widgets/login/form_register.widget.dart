import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/field_email.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/field_password.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({
    Key? key,
    this.informedEmail,
  }) : super(key: key);

  final String? informedEmail;

  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final _emailFormKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _emailTextEditingController = TextEditingController();

  final _passwordFormKey = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();
  final _passwordTextEditingController = TextEditingController();

  Future<void> _validateEmail(Future<bool> Function() managerMethod) async {
    if (_emailFormKey.currentState != null) {
      if (_emailFormKey.currentState!.validate()) {
        _emailFormKey.currentState!.save();
        if (await managerMethod()) {
          _passwordFocusNode.requestFocus();
        }
      }
    }
  }

  Future<void> _authenticate(Future<bool> Function() managerMethod) async {
    if (_passwordFormKey.currentState != null) {
      if (_passwordFormKey.currentState!.validate()) {
        _passwordFormKey.currentState!.save();
        if (await managerMethod()) {
          await Navigator.of(context).maybePop();
        }
      }
    }
  }

  @override
  void initState() {
    if (widget.informedEmail != null) {
      _emailTextEditingController.text = widget.informedEmail!;
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
    _emailTextEditingController.dispose();

    _passwordFormKey.currentState?.dispose();
    _passwordFocusNode.dispose();
    _passwordTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormColumn(
      children: [
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        LogoTextLoading(
            title: Texts.signInRegisterEntryTitle,
            size: SizeConfig.screenHeight * 0.25,
            loading: false),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        FiedEmail(
          controller: _emailTextEditingController,
          emailFormKey: _emailFormKey,
          emailFocusNode: _emailFocusNode,
          validateEmail: () => _validateEmail(() => Future.value(false)),
        ),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        FieldPassword(
          controller: _passwordTextEditingController,
          passwordFormKey: _passwordFormKey,
          passwordFocusNode: _passwordFocusNode,
          validatePassword: () => _authenticate(() => Future.value(false)),
        ),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        CustomRaisedButton(
          child: Text(
            Texts.goToNextStep,
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () => _emailFocusNode.hasFocus
              ? _validateEmail(() => Future.value(false))
              : _authenticate(() => Future.value(false)),
        ),
      ],
    );
  }
}
