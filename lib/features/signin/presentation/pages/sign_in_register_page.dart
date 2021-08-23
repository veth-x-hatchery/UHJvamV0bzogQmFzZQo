import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/notifications/messages.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/features/signin/sign_in_service_locator.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';

class SignInRegisterPage extends StatefulWidget {
  final Credential? credential;

  const SignInRegisterPage({
    Key? key,
    this.credential,
  }) : super(key: key);

  @override
  State<SignInRegisterPage> createState() => _SignInRegisterPageState();

  static Widget create({
    required ISignInServiceLocator serviceLocator,
    Credential? credential,
  }) {
    Logger.widget('SignInRegisterPage -> create');
    return BlocProvider(
      create: (_) => serviceLocator.get<SignInRegisterBloc>(),
      child: SignInRegisterPage(credential: credential),
    );
  }
}

class _SignInRegisterPageState extends State<SignInRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _credentialFocusNode = FocusNode();
  final _credentialTextEditingController = TextEditingController();

  final _secretFocusNode = FocusNode();
  final _secretTextEditingController = TextEditingController();

  SignInRegisterBloc get bloc => BlocProvider.of<SignInRegisterBloc>(context);
  SignInRegisterState get current => bloc.state;

  void _validateForm() {
    if (_formKey.currentState?.validate() == true) {
      bloc.add(
          const SignInRegisterEvent.registerWithCredentialAndSecretPressed());
    }
  }

  @override
  void initState() {
    if (widget.credential?.isValid() == true) {
      final credentialStr = widget.credential!.getOrCrash();
      bloc.add(SignInRegisterEvent.credentialChanged(credentialStr));
      _credentialTextEditingController.text = credentialStr;
      _secretFocusNode.requestFocus();
    } else {
      _credentialFocusNode.requestFocus();
    }
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();

    _credentialFocusNode.dispose();
    _credentialTextEditingController.dispose();

    _secretFocusNode.dispose();
    _secretTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return signInScaffold(
      context,
      child: BlocConsumer<SignInRegisterBloc, SignInRegisterState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.map((a) {
            a.fold(
              (l) => null,
              (_) => Navigator.pop(context),
            );
          });
          state.notification.fold(
            () {},
            (notification) {
              Logger.presentation(
                  'SignInRegisterPage -> notification: $notification');
              vethxNotify(context, notification);
            },
          );
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: FormColumn(
              children: [
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                SignInLoader(
                  title: Texts.signInRegisterEntryTitle,
                  size: SizeConfig.screenHeight * 0.25,
                  loading: state.isLoading,
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                FieldCredential(
                  controller: _credentialTextEditingController,
                  focusNode: _credentialFocusNode,
                  key: const Key(
                      SignInPageKeys.signInRegisterPageCredentialTextField),
                  onChanged: (value) =>
                      bloc.add(SignInRegisterEvent.credentialChanged(value)),
                  validator: (_) => current.credential.validation,
                  onEditingComplete: state.isLoading
                      ? () {}
                      : () {
                          if (current.credential.isValid()) {
                            _secretFocusNode.requestFocus();
                          }
                        },
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                FieldSecret(
                  controller: _secretTextEditingController,
                  focusNode: _secretFocusNode,
                  key: const Key(
                      SignInPageKeys.signInRegisterPageSecretTextField),
                  onChanged: (value) =>
                      bloc.add(SignInRegisterEvent.secretChanged(value)),
                  validator: (_) => current.secret.validation,
                  onEditingComplete: state.isLoading ? () {} : _validateForm,
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                CustomRaisedButton(
                  key: const Key(
                      SignInPageKeys.signInRegisterPageValidateButton),
                  onPressed: state.isLoading ? () {} : () => _validateForm(),
                  child: Text(
                    Texts.goToNextStep,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
