import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';

class SignInCredentialPage extends StatefulWidget {
  const SignInCredentialPage({Key? key}) : super(key: key);
  @override
  State<SignInCredentialPage> createState() => _SignInCredentialPageState();

  static Widget create({
    BuildContext? context,
    required SignInCredentialBloc bloc,
  }) {
    return BlocProvider(
      create: (_) => bloc,
      child: const SignInCredentialPage(),
    );
  }
}

class _SignInCredentialPageState extends State<SignInCredentialPage> {
  final _formKey = GlobalKey<FormState>();
  final _credentialFocusNode = FocusNode();
  final _credentialTextEditingController = TextEditingController();

  SignInCredentialBloc get bloc =>
      BlocProvider.of<SignInCredentialBloc>(context);
  SignInCredentialState get current => bloc.state;

  @override
  void initState() {
    _credentialFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _credentialTextEditingController.dispose();
    _formKey.currentState?.dispose();
    _credentialFocusNode.dispose();
    super.dispose();
  }

  Future<void> _validateCredential() async {
    // ignore: leading_newlines_in_multiline_strings
    Logger.presentation('''\n
        FormKey:    ${_formKey.currentState?.validate()}
        Controller: ${_credentialTextEditingController.text}
        Validation: ${current.credential.validation}
        ''');
    if (_formKey.currentState?.validate() == true) {
      bloc.add(const SignInCredentialEvent.analyseCredentialPressed());
    }
  }

  @override
  Widget build(BuildContext context) {
    return signInScaffold(
      context,
      child: BlocConsumer<SignInCredentialBloc, SignInCredentialState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
            () {},
            (either) {
              either.fold(
                (failure) {
                  Logger.presentation('SignInCredentialBloc $state: $failure');
                },
                (_) {
                  Logger.presentation('SignInCredentialBloc $state');
                },
              );
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
                  size: SizeConfig.screenHeight * 0.25,
                  loading: state.isLoading,
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                FieldCredential(
                  key: const Key(
                      SignInPageKeys.signInCredentialPageCredentialTextField),
                  controller: _credentialTextEditingController,
                  focusNode: _credentialFocusNode,
                  onEditingComplete: () =>
                      state.isLoading ? {} : _validateCredential(),
                  onChanged: (value) =>
                      bloc.add(SignInCredentialEvent.credentialChanged(value)),
                  validator: (_) => current.credential.validation,
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                CustomRaisedButton(
                  key: const Key(
                      SignInPageKeys.signInCredentialPageValidateButton),
                  onPressed: () => state.isLoading ? {} : _validateCredential(),
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
