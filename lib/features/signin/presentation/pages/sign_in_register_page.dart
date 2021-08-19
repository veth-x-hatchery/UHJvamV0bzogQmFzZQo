import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';

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

  Future<void> _validateEmail(Future<bool> Function() managerMethod) async {
    if (_emailFormKey.currentState != null) {
      if (_emailFormKey.currentState!.validate()) {
        _emailFormKey.currentState!.save();
        if (await managerMethod()) {
          _passwordFocusNode.requestFocus();
        }
      }
    }
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
  void initState() {
    if (widget.email != null) {
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
      child: BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
        final isLoading = state == const SignInState.loading();
        return FormColumn(
          children: [
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            SignInLoader(
              title: Texts.signInRegisterEntryTitle,
              size: SizeConfig.screenHeight * 0.25,
              loading: isLoading,
            ),
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            FiedEmail(
              controller: _emailTextEditingController,
              emailFormKey: _emailFormKey,
              emailFocusNode: _emailFocusNode,
              validateEmail: () => _validateEmail(() => Future.value(false)),
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
                Texts.goToNextStep,
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () => _emailFocusNode.hasFocus
                  ? _validateEmail(() => Future.value(false))
                  : _authenticate(() => Future.value(false)),
            ),
          ],
        );
      }),
    );
  }
}
