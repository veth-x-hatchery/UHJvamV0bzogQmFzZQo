import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/notifications/messages.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';

class SignInSecretPage extends StatefulWidget {
  const SignInSecretPage({Key? key}) : super(key: key);

  @override
  State<SignInSecretPage> createState() => _SignInSecretPageState();

  static Widget create({
    BuildContext? context,
    required SignInSecretBloc secretBloc,
    required SignInSecretResetBloc secretResetbloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInSecretBloc>(
          create: (_) => secretBloc,
        ),
        BlocProvider<SignInSecretResetBloc>(
          create: (_) => secretResetbloc,
        ),
      ],
      child: const SignInSecretPage(),
    );
  }
}

class _SignInSecretPageState extends State<SignInSecretPage> {
  final _formKey = GlobalKey<FormState>();
  final _secretFocusNode = FocusNode();
  final _secretTextEditingController = TextEditingController();

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
    // ignore: leading_newlines_in_multiline_strings
    Logger.presentation('''\n
        FormKey:     ${_formKey.currentState?.validate()}
        Controller:  ${_secretTextEditingController.text}
        Validation:  ${current.secret.validation}
        ''');
    if (_formKey.currentState?.validate() == true) {
      bloc.add(const SignInSecretEvent.analyseSecretPressed());
    }
  }

  @override
  Widget build(BuildContext context) {
    return signInScaffold(
      context,
      child: BlocConsumer<SignInSecretBloc, SignInSecretState>(
        listener: (context, state) {
          state.notification.fold(
            () {},
            (notification) {
              Logger.presentation(
                  'SignInSecretPage -> notification: $notification');
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
                FieldSecret(
                  key:
                      const Key(SignInPageKeys.signInSecretPageSecretTextField),
                  controller: _secretTextEditingController,
                  focusNode: _secretFocusNode,
                  onEditingComplete:
                      state.isLoading ? () {} : () => _authenticate(),
                  onChanged: (value) =>
                      bloc.add(SignInSecretEvent.secretChanged(value)),
                  validator: (_) => current.secret.validation,
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                CustomRaisedButton(
                  key: const Key(SignInPageKeys.signInSecretPageValidateButton),
                  onPressed: state.isLoading ? () {} : () => _authenticate(),
                  child: Text(
                    Texts.goToAccess,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                SizedBox(height: SizeConfig.defaultEdgeSpace),
                SignInSecretResetButton(
                    bloc: BlocProvider.of<SignInSecretResetBloc>(context)),
                TextButton(
                  onPressed: state.isLoading ? () {} : () => {},
                  child: Text(
                    Texts.changeCredential,
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
            Logger.presentation(
                'SignInSecretPage -> SignInSecretResetBloc -> notification: $notification');
            vethxNotify(context, notification);
          },
        );
      },
      builder: (context, state) {
        return SizedBox(
          height: Theme.of(context).textTheme.button!.fontSize,
          child: Center(
            child: TextButton(
              onPressed: state.isLoading
                  ? () {}
                  : () => bloc
                      .add(const SignInSecretResetEvent.resetPasswordRequest()),
              child: Text(
                Texts.forgotMySecret,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
        );
      },
    );
  }
}
