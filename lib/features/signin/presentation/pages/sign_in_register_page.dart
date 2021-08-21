import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';

class SignInRegisterPage extends StatefulWidget {
  final String? credential;

  const SignInRegisterPage({
    Key? key,
    this.credential,
  }) : super(key: key);

  @override
  State<SignInRegisterPage> createState() => _SignInRegisterPageState();

  static Widget create({
    BuildContext? context,
    required SignInRegisterBloc bloc,
    String? email,
  }) {
    return BlocProvider(
      create: (_) => bloc,
      child: SignInRegisterPage(credential: email),
    );
  }
}

class _SignInRegisterPageState extends State<SignInRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailFocusNode = FocusNode();
  final _emailTextEditingController = TextEditingController();

  final _passwordFocusNode = FocusNode();
  final _passwordTextEditingController = TextEditingController();

  SignInRegisterBloc get bloc => BlocProvider.of<SignInRegisterBloc>(context);
  SignInRegisterState get current => bloc.state;

  void _validateForm() {
    if (_formKey.currentState?.validate() == true) {
      bloc.add(const SignInRegisterEvent.registerWithEmailAndPasswordPressed());
    }
  }

  @override
  void initState() {
    if (widget.credential != null) {
      final credential = EmailAddress(widget.credential);
      if (credential.isValid()) {
        _emailTextEditingController.text = credential.getOrCrash();
        _passwordFocusNode.requestFocus();
      }
    } else {
      _emailFocusNode.requestFocus();
    }
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();

    _emailFocusNode.dispose();
    _emailTextEditingController.dispose();

    _passwordFocusNode.dispose();
    _passwordTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return signInScaffold(
      context,
      child: BlocConsumer<SignInRegisterBloc, SignInRegisterState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
            () {},
            (either) {
              either.fold(
                (failure) {
                  Logger.presentation('SignInRegisterBloc $state: $failure');
                },
                (_) {
                  Logger.presentation('SignInRegisterBloc $state');
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
                  title: Texts.signInRegisterEntryTitle,
                  size: SizeConfig.screenHeight * 0.25,
                  loading: state.isLoading,
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                FieldEmail(
                  controller: _emailTextEditingController,
                  focusNode: _emailFocusNode,
                  key: const Key(
                      SignInPageKeys.signInRegisterPageEmailTextField),
                  onChanged: (value) =>
                      bloc.add(SignInRegisterEvent.emailChanged(value)),
                  validator: (_) => current.email.validation,
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                FieldPassword(
                  controller: _passwordTextEditingController,
                  focusNode: _passwordFocusNode,
                  key: const Key(
                      SignInPageKeys.signInRegisterPagePasswordTextField),
                  onChanged: (value) =>
                      bloc.add(SignInRegisterEvent.passwordChanged(value)),
                  validator: (_) => current.password.validation,
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
