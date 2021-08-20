import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';

class SignInPasswordPage extends StatefulWidget {
  final String email;

  const SignInPasswordPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<SignInPasswordPage> createState() => _SignInPasswordPageState();

  static Widget create({
    BuildContext? context,
    required SignInBloc signInBloc,
    required String email,
  }) {
    return BlocProvider(
      create: (_) => signInBloc,
      child: SignInPasswordPage(email: email),
    );
  }
}

class _SignInPasswordPageState extends State<SignInPasswordPage> {
  final _passwordFormKey = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();
  final _passwordTextEditingController = TextEditingController();

  @override
  void initState() {
    _passwordFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFormKey.currentState?.dispose();
    _passwordFocusNode.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  Future<void> _authenticate() async {
    if (_passwordFormKey.currentState != null) {
      if (_passwordFormKey.currentState!.validate()) {
        _passwordFormKey.currentState!.save();
        BlocProvider.of<SignInBloc>(context).add(
          SignInEvent.signInWithEmailEvent(
            email: EmailAddress(widget.email),
            password: Password(_passwordTextEditingController.text),
          ),
        );
      }
    }
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
              size: SizeConfig.screenHeight * 0.25,
              loading: isLoading,
            ),
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            FieldPassword(
              key:
                  const Key(SignInPageKeys.signInPasswordPagePasswordTextField),
              controller: _passwordTextEditingController,
              focusNode: _passwordFocusNode,
              onEditingComplete: isLoading ? () {} : () => _authenticate(),
            ),
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            CustomRaisedButton(
              key: const Key(SignInPageKeys.signInPasswordPageValidateButton),
              onPressed: isLoading ? () {} : () => _authenticate(),
              child: Text(
                Texts.goToAccess,
                style: Theme.of(context).textTheme.button,
              ),
            ),
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            TextButton(
              onPressed: isLoading ? () {} : () => {},
              child: Text(
                Texts.forgotMyPassword,
                style: Theme.of(context).textTheme.button,
              ),
            ),
            TextButton(
              onPressed: isLoading ? () {} : () => {},
              child: Text(
                Texts.changeEmail,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ],
        );
      }),
    );
  }
}
