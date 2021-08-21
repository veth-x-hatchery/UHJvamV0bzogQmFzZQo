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

class SignInEmailPage extends StatefulWidget {
  const SignInEmailPage({Key? key}) : super(key: key);
  @override
  State<SignInEmailPage> createState() => _SignInEmailPageState();

  static Widget create({
    BuildContext? context,
    required SignInEmailBloc bloc,
  }) {
    return BlocProvider(
      create: (_) => bloc,
      child: const SignInEmailPage(),
    );
  }
}

class _SignInEmailPageState extends State<SignInEmailPage> {
  final _credentialFormKey = GlobalKey<FormState>();
  final _credentialFocusNode = FocusNode();
  final _credentialTextEditingController = TextEditingController();

  SignInEmailBloc get bloc => BlocProvider.of<SignInEmailBloc>(context);
  SignInEmailState get current => bloc.state;

  @override
  void initState() {
    _credentialFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _credentialTextEditingController.dispose();
    _credentialFormKey.currentState?.dispose();
    _credentialFocusNode.dispose();
    super.dispose();
  }

  Future<void> _validateEmail() async {
    if (_credentialFormKey.currentState?.validate() == true) {
      bloc.add(const SignInEmailEvent.analyseEmailPressed());
    }
  }

  @override
  Widget build(BuildContext context) {
    return signInScaffold(
      context,
      child: BlocConsumer<SignInEmailBloc, SignInEmailState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
            () {},
            (either) {
              either.fold(
                (failure) {
                  Logger.presentation('SignInEmailBloc $state: $failure');
                },
                (_) {
                  Logger.presentation('SignInEmailBloc $state');
                },
              );
            },
          );
        },
        builder: (context, state) {
          return FormColumn(
            children: [
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              SignInLoader(
                size: SizeConfig.screenHeight * 0.25,
                loading: state.isLoading,
              ),
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              FieldEmail(
                key: const Key(SignInPageKeys.signInEmailPageEmailTextField),
                controller: _credentialTextEditingController,
                focusNode: _credentialFocusNode,
                onEditingComplete: state.isLoading ? () {} : _validateEmail,
                onChanged: (value) =>
                    bloc.add(SignInEmailEvent.credentialChanged(value)),
                validator: (_) => current.credential.validation,
              ),
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              CustomRaisedButton(
                key: const Key(SignInPageKeys.signInEmailPageValidateButton),
                onPressed: state.isLoading ? () {} : _validateEmail,
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
