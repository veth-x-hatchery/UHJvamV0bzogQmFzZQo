import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/transitions/slide_route.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();

  static Widget create(BuildContext context) {
    return const SignInPage();
  }
}

class _SignInPageState extends State<SignInPage> {
  @override
  void didChangeDependencies() {
    FocusScope.of(context).unfocus();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationBloc, NavigationState>(
      listener: (context, state) {
        Logger.i('SignInPage -> NavigationBloc -> $state');
        state.when(
          initial: () {},
          goTo: _goTo,
        );
      },
      child: _scaffold(
        context,
        child: const SignInOptions(),
        leading: false,
      ),
    );
  }

  Scaffold _scaffold(
    BuildContext context, {
    required Widget child,
    bool leading = true,
  }) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: leading
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () => Navigator.maybePop(context),
              )
            : null,
      ),
      body: child,
    );
  }

  void _goTo(SignInPageGoTo page) {
    switch (page.to) {
      case SignInPageRoutes.passwordEntry:
        Navigator.pushReplacement(
          context,
          SlideLeftRoute<void>(
            page: _scaffold(
              context,
              child: FormPassword(informedEmail: page.parameters! as String),
            ),
          ),
        );
        break;
      case SignInPageRoutes.registerEmailSignIn:
        Navigator.pushReplacement(
          context,
          SlideLeftRoute<void>(
              page: _scaffold(context,
                  child: FormRegisterEmailSignIn(
                      informedEmail: page.parameters as String?))),
        );
        break;
      case SignInPageRoutes.emailEntry:
      default:
        page.from == SignInPageRoutes.signInOptions
            ? Navigator.push(
                context,
                SlideLeftRoute<void>(
                    page: _scaffold(context,
                        child: const FormRegisterEmailSignIn())))
            : Navigator.pushReplacement(
                context,
                SlideLeftRoute<void>(
                    page: _scaffold(context,
                        child: const FormRegisterEmailSignIn())));
        break;
    }
  }
}
