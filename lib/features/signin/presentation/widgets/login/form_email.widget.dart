import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/field_email.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/logo_text_loading.widget.dart';

class FormEmail extends StatefulWidget {
  const FormEmail({Key? key}) : super(key: key);

  @override
  _FormEmailState createState() => _FormEmailState();
}

class _FormEmailState extends State<FormEmail> {
  final _emailFormKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _emailTextEditingController = TextEditingController();

  @override
  void initState() {
    _emailFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _emailFormKey.currentState?.dispose();
    _emailFocusNode.dispose();
    _emailTextEditingController.dispose();
    super.dispose();
  }

  Future<void> _validateEmail(void Function() managerMethod) async {
    if (_emailFormKey.currentState != null) {
      if (_emailFormKey.currentState!.validate()) {
        _emailFormKey.currentState!.save();
        managerMethod();
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
        FiedEmail(
          controller: _emailTextEditingController,
          emailFormKey: _emailFormKey,
          emailFocusNode: _emailFocusNode,
          validateEmail: () => _validateEmail(() => Future.value()),
        ),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        CustomRaisedButton(
          child: Text(
            Texts.goToNextStep,
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () => _validateEmail(() => Future.value()),
        ),
      ],
    );
  }
}
