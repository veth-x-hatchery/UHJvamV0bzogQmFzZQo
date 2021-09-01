import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/notifications/messages.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/features/signin/sign_in_service_locator.dart';
import 'package:vethx_beta/l10n/l10n.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';

class SignInCredentialPage extends StatefulWidget {
  const SignInCredentialPage({Key? key}) : super(key: key);

  @override
  State<SignInCredentialPage> createState() => _SignInCredentialPageState();

  static Widget create({
    required ISignInServiceLocator serviceLocator,
  }) {
    Logger.widget('SignInCredentialPage -> create');
    return BlocProvider(
      create: (_) => serviceLocator.get<SignInCredentialBloc>(),
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

  Future<void> _validateCredential() async {
    if (_formKey.currentState?.validate() == true) {
      bloc.add(const SignInCredentialEvent.analyseCredentialPressed());
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return signInScaffold(
      context,
      child: BlocConsumer<SignInCredentialBloc, SignInCredentialState>(
        listener: (context, state) {
          state.notification.fold(
            () {},
            (notification) {
              Logger.widget(
                  'SignInCredentialPage -> notification: $notification');
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
                  validator: (_) => current.credential.validation(context.l10n),
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                CustomRaisedButton(
                  key: const Key(
                      SignInPageKeys.signInCredentialPageValidateButton),
                  onPressed: () => state.isLoading ? {} : _validateCredential(),
                  child: Text(
                    context.l10n.general_goToNextStep,
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
