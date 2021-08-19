import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_email_page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_password_page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_register_page.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/injection_container.dart';
import 'package:vethx_beta/ui/widgets/transitions/slide_route.dart';

class SignInOptionsPage extends StatelessWidget {
  const SignInOptionsPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<SignInBloc>(),
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
                    page: SignInPasswordPage(email: page.parameters! as String),
                  ),
                );
                break;
              case SignInPageRoutes.registerEmailSignIn:
                Navigator.pushReplacement(
                  context,
                  SlideLeftRoute<void>(
                      page: SignInRegisterPage(
                          email: page.parameters as String?)),
                );
                break;
              case SignInPageRoutes.emailEntry:
              default:
                page.from == SignInPageRoutes.signInOptions
                    ? Navigator.push(context,
                        SlideLeftRoute<void>(page: const SignInEmailPage()))
                    : Navigator.pushReplacement(context,
                        SlideLeftRoute<void>(page: const SignInEmailPage()));
                break;
            }
          },
        );
      },
      child: signInScaffold(
        context,
        child: const SignInOptions(),
        leading: false,
      ),
    );
  }
}
