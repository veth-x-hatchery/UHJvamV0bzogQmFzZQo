import 'package:flutter/material.dart';
import 'package:vethx_login/core/consts/vethx_connect_texts.dart';
import 'package:vethx_login/core/consts/size_config.dart';
import 'package:vethx_login/ui/login/email_log_in.page.dart';
import 'package:vethx_login/ui/widgets/login/field_email.widget.dart';
import 'package:vethx_login/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_login/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_login/ui/widgets/shared/forms/logo_text_loading.widget.dart';

class FormEmail extends StatefulWidget {
  const FormEmail({
    Key? key,
    required this.nextForm,
  }) : super(key: key);

  final void Function(EmailLoginPageIndex delta) nextForm;

  @override
  _FormEmailState createState() => _FormEmailState();
}

class _FormEmailState extends State<FormEmail> {
  bool _realizandoRequisicao = false;

  final _emailFormKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();

  Future<void> _validarEmail() async {
    if (_emailFormKey.currentState!.validate()) {
      _emailFormKey.currentState!.save();
      setState(() {
        _realizandoRequisicao = true;
      });
      await Future.delayed(Duration(seconds: 1)).then((void _) {
        setState(() {
          _realizandoRequisicao = false;
        });
        widget.nextForm(EmailLoginPageIndex.signIn);
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
    return FormColumn(
      children: [
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        LogoTextLoading(
            size: SizeConfig.screenHeight * 0.25,
            loading: _realizandoRequisicao),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        CampoDeEmail(
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
    );
  }
}
