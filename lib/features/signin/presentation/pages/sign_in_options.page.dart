import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/options/sign_in_options_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_register_page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_secret.page.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/features/signin/sign_in_injection_container.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/ui/widgets/transitions/slide_route.dart';

class SignInOptionsPage extends StatefulWidget {
  const SignInOptionsPage({Key? key}) : super(key: key);

  static Widget create({BuildContext? context}) {
    Logger.widget('SignInOptionsPage -> create');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SignInDependenciesInjection.get<SignInOptionsBloc>(),
        ),
        BlocProvider(
          create: (_) => SignInDependenciesInjection.get<NavigationCubit>(),
        ),
      ],
      child: const SignInOptionsPage(),
    );
  }

  @override
  State<SignInOptionsPage> createState() => _SignInOptionsPageState();
}

class _SignInOptionsPageState extends State<SignInOptionsPage> {
  @override
  void initState() {
    Logger.widget('SignInOptionsPage -> initState');
    SignInDependenciesInjection().pushNewScope();
    super.initState();
  }

  @override
  void dispose() {
    Logger.widget('SignInOptionsPage -> dispose');
    SignInDependenciesInjection().popScope();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return BlocListener<NavigationCubit, NavigationState>(
      listener: (context, state) {
        Logger.presentation('SignInPage -> NavigationCubit -> $state');
        state.when(
          initial: () {},
          goTo: (page) {
            switch (page.to) {
              case SignInPageRoutes.secretEntry:
                Navigator.pushReplacement(
                  context,
                  SlideLeftRoute<void>(
                    page: SignInSecretPage.create(),
                  ),
                );
                break;
              case SignInPageRoutes.registerCredentialSignIn:
                Navigator.pushReplacement(
                    context,
                    SlideLeftRoute<void>(
                        page: SignInRegisterPage.create(
                            credential: page.parameters as Credential?)));
                break;
              case SignInPageRoutes.credentialEntry:
                final credentialPage = SignInCredentialPage.create();
                page.from == SignInPageRoutes.signInOptions
                    ? Navigator.push(
                        context, SlideLeftRoute<void>(page: credentialPage))
                    : Navigator.pushReplacement(
                        context, SlideRightRoute<void>(page: credentialPage));
                break;
              default:
                break;
            }
          },
        );
      },
      child: signInScaffold(
        context,
        child: BlocBuilder<SignInOptionsBloc, SignInOptionsState>(
            builder: (context, state) {
          final isLoading = state == const SignInOptionsState.loading();
          return FormColumn(
            children: [
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              SignInLoader(
                size: SizeConfig.screenHeight * 0.25,
                loading: isLoading,
              ),
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              SignInButton(
                key: const Key(SignInPageKeys.signInWithGoogleButton),
                assetName: 'assets/images/google-logo.png',
                text: Texts.signInWithGoogle,
                textColor: Colors.black87,
                color: Colors.white,
                onPressed: () => BlocProvider.of<SignInOptionsBloc>(context)
                    .add(const SignInOptionsEvent.signInWithGoogleEvent()),
              ),
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              SignInButton(
                key: const Key(SignInPageKeys.signInWithCredential),
                assetName: 'assets/images/mail-logo.png',
                text: Texts.signInWithCredential,
                textColor: Colors.white,
                color: Colors.teal[700],
                onPressed: isLoading
                    ? () => {}
                    : () => BlocProvider.of<NavigationCubit>(context).goTo(
                          SignInPageGoTo.credentialPage(
                              from: SignInPageRoutes.signInOptions),
                        ),
              ),
            ],
          );
        }),
        leading: false,
      ),
    );
  }
}
