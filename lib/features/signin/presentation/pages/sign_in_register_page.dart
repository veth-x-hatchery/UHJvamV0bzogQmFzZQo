import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';

class SignInRegisterPage extends StatefulWidget {
  final String? email;

  const SignInRegisterPage({
    Key? key,
    this.email,
  }) : super(key: key);

  @override
  State<SignInRegisterPage> createState() => _SignInRegisterPageState();

  static Widget create({
    BuildContext? context,
    required SignInRegisterBloc signInBloc,
    String? email,
  }) {
    return BlocProvider(
      create: (_) => signInBloc,
      child: SignInRegisterPage(email: email),
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
    if (current.email.isValid()) {
      _emailTextEditingController.text = current.email.getOrCrash();
      _passwordFocusNode.requestFocus();
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
                  Logger.presentation('RegisterBloc $state: $failure');
                },
                (_) {
                  Logger.presentation('RegisterBloc $state');
                },
              );
            },
          );
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                SignInLoader(
                  title: Texts.signInRegisterEntryTitle,
                  size: SizeConfig.screenHeight * 0.25,
                  loading: state.isLoading,
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                TextFormField(
                  controller: _emailTextEditingController,
                  focusNode: _emailFocusNode,
                  key: const Key(
                      SignInPageKeys.signInRegisterPageEmailTextField),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  autocorrect: false,
                  onChanged: (value) =>
                      bloc.add(SignInRegisterEvent.emailChanged(value)),
                  validator: (_) => current.email.validation,
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                TextFormField(
                  controller: _passwordTextEditingController,
                  focusNode: _passwordFocusNode,
                  key: const Key(
                      SignInPageKeys.signInRegisterPagePasswordTextField),
                  obscureText: true,
                  autocorrect: false,
                  onChanged: (value) =>
                      bloc.add(SignInRegisterEvent.passwordChanged(value)),
                  validator: (_) => current.password.validation,
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                CustomRaisedButton(
                  key: const Key(
                      SignInPageKeys.signInRegisterPageValidateButton),
                  onPressed: () => _validateForm(),
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
