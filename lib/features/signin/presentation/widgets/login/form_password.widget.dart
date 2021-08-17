import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/field_password.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/logo_text_loading.widget.dart';

class FormPassword extends StatefulWidget {
  const FormPassword({
    Key? key,
    this.informedEmail,
  }) : super(key: key);

  final String? informedEmail;

  @override
  _FormPasswordState createState() => _FormPasswordState();
}

class _FormPasswordState extends State<FormPassword> {
  final _passwordFormKey = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();
  final _passwordTextEditingController = TextEditingController();

  @override
  void initState() {
    _passwordFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFormKey.currentState?.dispose();
    _passwordFocusNode.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
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
  Widget build(BuildContext context) {
    return FormColumn(
      children: [
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        LogoTextLoading(
          size: SizeConfig.screenHeight * 0.25,
          loading: false,
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
            Texts.goToAccess,
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () => _authenticate(() => Future.value(false)),
        ),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        TextButton(
          child: Text(
            Texts.forgotMyPassword,
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () => {},
        ),
        TextButton(
          child: Text(
            Texts.changeEmail,
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () => {},
        ),
      ],
    );
  }
}
