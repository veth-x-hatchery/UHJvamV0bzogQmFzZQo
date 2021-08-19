import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/field_email.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/logo_text_loading.widget.dart';

import '../sign_in.widgets.dart';

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

  Future<void> _validateEmail() async {
    if (_emailFormKey.currentState != null) {
      if (_emailFormKey.currentState!.validate()) {
        _emailFormKey.currentState!.save();
        BlocProvider.of<SignInBloc>(context).add(
          SignInEvent.checkEmailEvent(
            email: EmailAddress(_emailTextEditingController.text),
            fromPage: SignInPageRoutes.emailEntry,
          ),
        );
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
          key: const Key(SignInPageKeys.signInEmailPageEmailTextField),
          controller: _emailTextEditingController,
          emailFormKey: _emailFormKey,
          emailFocusNode: _emailFocusNode,
          validateEmail: _validateEmail,
        ),
        SizedBox(height: SizeConfig.defaultEdgeSpace),
        CustomRaisedButton(
          key: const Key(SignInPageKeys.signInEmailPageValidateButton),
          onPressed: _validateEmail,
          child: Text(
            Texts.goToNextStep,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ],
    );
  }
}
