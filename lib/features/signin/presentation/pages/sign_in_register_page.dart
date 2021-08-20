import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/bloc/register_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
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
    required SignInBloc signInBloc,
    String? email,
  }) {
    return BlocProvider(
      create: (_) => signInBloc,
      child: SignInRegisterPage(email: email),
    );
  }
}

class _SignInRegisterPageState extends State<SignInRegisterPage> {
  final _emailFormKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _emailTextEditingController = TextEditingController();

  final _passwordFormKey = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();
  final _passwordTextEditingController = TextEditingController();

  @override
  void initState() {
    if (widget.email != null && EmailAddress(widget.email).isValid()) {
      _emailTextEditingController.text = widget.email!;
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
    return signInScaffold(
      context,
      child: BlocConsumer<RegisterBloc, RegisterState>(
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
                  key: const Key(
                      SignInPageKeys.signInRegisterPageEmailTextField),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  autocorrect: false,
                  onChanged: (value) => BlocProvider.of<RegisterBloc>(context)
                      .add(RegisterEvent.emailChanged(value)),
                  validator: (_) => BlocProvider.of<RegisterBloc>(context)
                      .state
                      .email
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          invalidEmail: (_) => 'Invalid email',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                TextFormField(
                  key: const Key(
                      SignInPageKeys.signInRegisterPagePasswordTextField),
                  controller: _passwordTextEditingController,
                  obscureText: true,
                  autocorrect: false,
                  onChanged: (value) => BlocProvider.of<RegisterBloc>(context)
                      .add(RegisterEvent.passwordChanged(value)),
                  validator: (_) => BlocProvider.of<RegisterBloc>(context)
                      .state
                      .password
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          shortPassword: (_) => 'Short password',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                CustomRaisedButton(
                  key: const Key(
                      SignInPageKeys.signInRegisterPageValidateButton),
                  child: Text(
                    Texts.goToNextStep,
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () => BlocProvider.of<RegisterBloc>(context).add(
                      const RegisterEvent
                          .registerWithEmailAndPasswordPressed()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
