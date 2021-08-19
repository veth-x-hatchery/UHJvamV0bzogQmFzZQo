import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
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
    required SignInBloc signInBloc,
  }) {
    return BlocProvider(
      create: (_) => signInBloc,
      child: const SignInEmailPage(),
    );
  }
}

class _SignInEmailPageState extends State<SignInEmailPage> {
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
    _emailTextEditingController.dispose();
    _emailFormKey.currentState?.dispose();
    _emailFocusNode.dispose();
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
    return signInScaffold(
      context,
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          final isLoading = state == const SignInState.loading();
          return FormColumn(
            children: [
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              SignInLoader(
                size: SizeConfig.screenHeight * 0.25,
                loading: isLoading,
              ),
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              FiedEmail(
                key: const Key(SignInPageKeys.signInEmailPageEmailTextField),
                controller: _emailTextEditingController,
                emailFormKey: _emailFormKey,
                emailFocusNode: _emailFocusNode,
                validateEmail: isLoading ? () {} : _validateEmail,
              ),
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              CustomRaisedButton(
                key: const Key(SignInPageKeys.signInEmailPageValidateButton),
                onPressed: isLoading ? () {} : _validateEmail,
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
