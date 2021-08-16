import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/injection_container.dart';
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

  const SignInPageGoTo({required this.from, required this.to});

  @override
  String toString() => 'Go from $from to $to';

  @override
  // TODO: implement props
  List<Object?> get props => [from, to];
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
          SlideLeftRoute<void>(page: const SignInPasswordEntry()),
        );
        break;
      case SignInPageRoutes.registerEmailSignIn:
        Navigator.pushReplacement(
          context,
          SlideLeftRoute<void>(page: const SignInRegisterEntry()),
        );
        break;
      case SignInPageRoutes.emailEntry:
      default:
        page.from == SignInPageRoutes.signInOptions
            ? Navigator.push(
                context, SlideLeftRoute<void>(page: const SignInEmailEntry()))
            : Navigator.pushReplacement(
                context, SlideLeftRoute<void>(page: const SignInEmailEntry()));
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: const SignInOptions(),
    );
  }
}
