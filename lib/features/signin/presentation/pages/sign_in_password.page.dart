import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/password/sign_in_password_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';

class SignInPasswordPage extends StatefulWidget {
  const SignInPasswordPage({Key? key}) : super(key: key);

  @override
  State<SignInPasswordPage> createState() => _SignInPasswordPageState();

  static Widget create({
    BuildContext? context,
    required SignInPasswordBloc bloc,
  }) {
    return BlocProvider(
      create: (_) => bloc,
      child: const SignInPasswordPage(),
    );
  }
}

class _SignInPasswordPageState extends State<SignInPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();
  final _passwordTextEditingController = TextEditingController();

  SignInPasswordBloc get bloc => BlocProvider.of<SignInPasswordBloc>(context);
  SignInPasswordState get current => bloc.state;

  @override
  void initState() {
    _passwordFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _passwordFocusNode.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  Future<void> _authenticate() async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        bloc.add(const SignInPasswordEvent.analysePasswordPressed());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return signInScaffold(
      context,
      child: BlocBuilder<SignInPasswordBloc, SignInPasswordState>(
          builder: (context, state) {
        return FormColumn(
          children: [
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            SignInLoader(
              size: SizeConfig.screenHeight * 0.25,
              loading: state.isLoading,
            ),
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            FieldPassword(
              key:
                  const Key(SignInPageKeys.signInPasswordPagePasswordTextField),
              controller: _passwordTextEditingController,
              focusNode: _passwordFocusNode,
              onEditingComplete:
                  state.isLoading ? () {} : () => _authenticate(),
              onChanged: (value) =>
                  bloc.add(SignInPasswordEvent.passwordChanged(value)),
              validator: (_) => current.password.validation,
            ),
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            CustomRaisedButton(
              key: const Key(SignInPageKeys.signInPasswordPageValidateButton),
              onPressed: state.isLoading ? () {} : () => _authenticate(),
              child: Text(
                Texts.goToAccess,
                style: Theme.of(context).textTheme.button,
              ),
            ),
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            TextButton(
              onPressed: state.isLoading ? () {} : () => {},
              child: Text(
                Texts.forgotMyPassword,
                style: Theme.of(context).textTheme.button,
              ),
            ),
            TextButton(
              onPressed: state.isLoading ? () {} : () => {},
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
