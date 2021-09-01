import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/notifications/messages.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/manager/navigation.manager.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/features/signin/sign_in_service_locator.dart';
import 'package:vethx_beta/l10n/l10n.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

class SignInSecretPage extends StatefulWidget {
  final NavigationManager navigationManager;

  const SignInSecretPage({
    Key? key,
    required this.navigationManager,
  }) : super(key: key);

  @override
  State<SignInSecretPage> createState() => _SignInSecretPageState();

  static Widget create({
    required ISignInServiceLocator serviceLocator,
  }) {
    Logger.widget('SignInSecretPage -> create');
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInSecretBloc>(
          create: (_) => serviceLocator.get<SignInSecretBloc>(),
        ),
        BlocProvider<SignInSecretResetBloc>(
          create: (_) => serviceLocator.get<SignInSecretResetBloc>(),
        ),
      ],
      child: SignInSecretPage(
          navigationManager: serviceLocator.get<NavigationManager>()),
    );
  }
}

class _SignInSecretPageState extends State<SignInSecretPage> {
  final _formKey = GlobalKey<FormState>();
  final _secretFocusNode = FocusNode();
  final _secretTextEditingController = TextEditingController();

  NavigationManager get navigation => widget.navigationManager;
  SignInSecretBloc get bloc => BlocProvider.of<SignInSecretBloc>(context);
  SignInSecretState get current => bloc.state;

  @override
  void initState() {
    _secretFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _secretFocusNode.dispose();
    _secretTextEditingController.dispose();
    super.dispose();
  }

  Future<void> _authenticate() async {
    if (_formKey.currentState?.validate() == true) {
      bloc.add(const SignInSecretEvent.analyseSecretPressed());
    }
  }

  @override
  Widget build(BuildContext context) {
    return signInScaffold(
      context,
      onPressed: () => navigation.goTo(
          SignInPageGoTo.credentialPage(from: SignInPageRoutes.secretEntry)),
      child: BlocConsumer<SignInSecretBloc, SignInSecretState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.map((a) {
            a.fold(
              (_) => null,
              (_) => Navigator.of(context).pop(),
            );
          });
          state.notification.fold(
            () {},
            (notification) {
              Logger.widget('SignInSecretPage -> notification: $notification');
              vethxNotify(context, notification);
            },
          );
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: FormColumn(
              key: const Key(SignInPageKeys.signInSecretPageFormColumn),
              children: [
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                SignInLoader(
                  size: SizeConfig.screenHeight * 0.25,
                  loading: state.isLoading,
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                FieldSecret(
                  key:
                      const Key(SignInPageKeys.signInSecretPageSecretTextField),
                  controller: _secretTextEditingController,
                  focusNode: _secretFocusNode,
                  onEditingComplete:
                      state.isLoading ? () {} : () => _authenticate(),
                  onChanged: (value) =>
                      bloc.add(SignInSecretEvent.secretChanged(value)),
                  validator: (_) {
                    final message = current.secret.validation();
                    return message(context.l10n) as String?;
                  },
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                CustomRaisedButton(
                  key: const Key(SignInPageKeys.signInSecretPageValidateButton),
                  onPressed: state.isLoading ? () {} : () => _authenticate(),
                  child: Text(
                    context.l10n.general_goToAccess,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                SignInSecretResetButton(
                    bloc: BlocProvider.of<SignInSecretResetBloc>(context)),
                TextButton(
                  key: const Key(SignInPageKeys.signInChangeCredentialButton),
                  onPressed: state.isLoading
                      ? () {}
                      : () => navigation.goTo(SignInPageGoTo.credentialPage(
                            from: SignInPageRoutes.secretEntry,
                          )),
                  child: Text(
                    context.l10n.signin_changeCredential,
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

class SignInSecretResetButton extends StatelessWidget {
  const SignInSecretResetButton({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final SignInSecretResetBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInSecretResetBloc, SignInSecretResetState>(
      bloc: bloc,
      listener: (context, state) {
        state.notification.fold(
          () {},
          (notification) {
            Logger.widget(
                'SignInSecretPage -> SignInSecretResetBloc -> notification: $notification');
            vethxNotify(context, notification);
          },
        );
      },
      builder: (context, state) {
        return SizedBox(
          height: Theme.of(context).textTheme.button!.fontSize! * 3,
          child: Center(
            child: state.isLoading
                ? const GenericProgressIndicator()
                : TextButton(
                    key: const Key(SignInPageKeys.signInsecretResetButton),
                    onPressed: () => bloc
                        .add(const SignInSecretResetEvent.secretResetRequest()),
                    child: Text(
                      context.l10n.signin_forgotMySecret,
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
