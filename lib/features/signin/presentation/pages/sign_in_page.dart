import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/transitions/slide_route.dart';

enum SignInPageRoutes {
  signInOptions,
  emailEntry,
  passwordEntry,
  registerEmailSignIn,
}

class SignInPageGoTo extends Equatable {
  final SignInPageRoutes from;
  final SignInPageRoutes to;
  final Object? parameters;

  const SignInPageGoTo({
    required this.from,
    required this.to,
    this.parameters,
  });

  @override
  String toString() =>
      'Go from $from to $to ${parameters != null ? 'with $parameters' : ''}';

  @override
  List<Object?> get props => [from, to, parameters];
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();

  static Widget create(BuildContext context) {
    return const SignInPage();
  }
}

class _SignInPageState extends State<SignInPage> with TickerProviderStateMixin {
  late SignInBloc _signInNavigation;

  Stream<SignInPageGoTo>? _previousStream;
  StreamSubscription? _streamSubscription;
  void _listenGoTo(Stream<SignInPageGoTo> received) {
    if (received != _previousStream) {
      _streamSubscription?.cancel();
      _previousStream = received;
      _streamSubscription = _previousStream!.listen(_goTo);
    }
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

  @override
  void didChangeDependencies() {
    _signInNavigation = BlocProvider.of<SignInBloc>(context);
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
    return _scaffold(
      context,
      child: const SignInOptions(),
      leading: false,
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
}
