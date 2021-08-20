import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/email/sign_in_email_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/password/sign_in_password_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_email.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_password.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_register_page.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/injection_container.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/ui/widgets/transitions/slide_route.dart';

class SignInOptionsPage extends StatelessWidget {
  const SignInOptionsPage({Key? key}) : super(key: key);

  static Widget create({BuildContext? context}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<SignInBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<SignInRegisterBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<NavigationCubit>(),
        )
      ],
      child: const SignInOptionsPage(),
    );
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
              case SignInPageRoutes.passwordEntry:
                Navigator.pushReplacement(
                  context,
                  SlideLeftRoute<void>(
                    page: SignInPasswordPage.create(
                        bloc: BlocProvider.of<SignInPasswordBloc>(context)),
                  ),
                );
                break;
              case SignInPageRoutes.registerEmailSignIn:
                Navigator.pushReplacement(
                  context,
                  SlideLeftRoute<void>(
                      page: SignInRegisterPage.create(
                          bloc: BlocProvider.of<SignInRegisterBloc>(context),
                          email: page.parameters as String?)),
                );
                break;
              case SignInPageRoutes.emailEntry:
                final emailPage = SignInEmailPage.create(
                    bloc: BlocProvider.of<SignInEmailBloc>(context));
                page.from == SignInPageRoutes.signInOptions
                    ? Navigator.push(
                        context, SlideLeftRoute<void>(page: emailPage))
                    : Navigator.pushReplacement(
                        context, SlideLeftRoute<void>(page: emailPage));
                break;
              default:
                break;
            }
          },
        );
      },
      child: signInScaffold(
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
              SignInButton(
                key: const Key(SignInPageKeys.signInWithGoogleButton),
                assetName: 'assets/images/google-logo.png',
                text: Texts.signInWithGoogle,
                textColor: Colors.black87,
                color: Colors.white,
                onPressed: () => BlocProvider.of<SignInBloc>(context)
                    .add(const SignInEvent.signInWithGoogleEvent()),
              ),
              SizedBox(height: SizeConfig.defaultEdgeSpace),
              SignInButton(
                key: const Key(SignInPageKeys.signInWithEmail),
                assetName: 'assets/images/mail-logo.png',
                text: Texts.signInWithEmail,
                textColor: Colors.white,
                color: Colors.teal[700],
                onPressed: isLoading
                    ? () => {}
                    : () => BlocProvider.of<NavigationCubit>(context).goTo(
                          SignInPageGoTo.emailPage(
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
