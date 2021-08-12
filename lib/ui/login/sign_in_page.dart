import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vethx_login/core/blocs/app_state.dart';
import 'package:vethx_login/core/routes/navigation.dart';
import 'package:vethx_login/core/utils/logger.dart';
import 'package:vethx_login/ui/widgets/login/sign_in_email_entry.widget.dart';
import 'package:vethx_login/ui/widgets/login/sign_in_options.widget.dart';
import 'package:vethx_login/ui/widgets/login/sign_in_password_entry.widget.dart';
import 'package:vethx_login/ui/widgets/login/sign_in_register_entry.widget.dart';
import 'package:vethx_login/ui/widgets/transitions/slide_route.dart';

enum SignInPageRoutes {
  signInOptions,
  emailEntry,
  passwordEntry,
  registerEmailSignIn,
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with TickerProviderStateMixin {
  late SignInNavigationBloc _signInNavigation;

  Stream<SignInPageRoutes>? _previousStream;
  StreamSubscription? _streamSubscription;
  void _listenGoTo(Stream<SignInPageRoutes> received) {
    if (received != _previousStream) {
      _streamSubscription?.cancel();
      _previousStream = received;
      _streamSubscription = _previousStream!.listen(_goTo);
    }
  }

  void _goTo(SignInPageRoutes page) {
    Logger.i('SignInPage -> _goTo: $page');
    switch (page) {
      case SignInPageRoutes.emailEntry:
        Navigator.of(context).widget.initialRoute == NavigationRoutes.slash
            ? Navigator.push(
                context,
                SlideRightRoute<void>(page: SignInEmailEntry()),
              )
            : Navigator.pushReplacement(
                context,
                SlideRightRoute<void>(page: SignInEmailEntry()),
              );

        break;
      case SignInPageRoutes.passwordEntry:
        Navigator.pushReplacement(
          context,
          SlideRightRoute<void>(
            page: SignInPasswordEntry(),
          ),
        );
        break;
      case SignInPageRoutes.registerEmailSignIn:
        Navigator.pushReplacement(
          context,
          SlideRightRoute<void>(
            page: SignInRegisterEntry(),
          ),
        );
        break;
      default:
    }
  }

  @override
  void didChangeDependencies() {
    _signInNavigation =
        AppStateContainer.of(context).blocProvider.signInNavigation;
    _listenGoTo(_signInNavigation.goTo);
    FocusScope.of(context).unfocus();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SignInOptions(),
    );
  }
}
