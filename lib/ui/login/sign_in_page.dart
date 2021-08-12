import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vethx_login/core/blocs/app_state.dart';
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
  late TabController _tabController;
  late bool _hideAppBarOptions;

  void _goToTheNextPage(SignInPageRoutes delta) {
    _tabController.animateTo(delta.index);
    _changeSettings(delta.index);
  }

  void _goBack() {
    final newRoute = _getGoBackOption(
        SignInPageRoutes.values.elementAt(_tabController.index));
    _tabController.animateTo(newRoute.index);
    _changeSettings(newRoute.index);
  }

  SignInPageRoutes _getGoBackOption(SignInPageRoutes actual) {
    if (actual == SignInPageRoutes.signInOptions) {
      return SignInPageRoutes.signInOptions;
    }
    final newIndex = actual == SignInPageRoutes.registerEmailSignIn
        ? SignInPageRoutes.emailEntry.index
        : actual.index - 1;
    return SignInPageRoutes.values.elementAt(newIndex);
  }

  Future<void> _changeSettings(int newIndex) {
    return Future.delayed(Duration.zero).then((void _) => setState(() {
          _hideAppBarOptions = newIndex == SignInPageRoutes.signInOptions.index;
          if (_hideAppBarOptions) {
            FocusScope.of(context).unfocus();
          }
        }));
  }

  List<Widget> _routes() {
    return [
      SignInOptions(),
      SignInEmailEntry(),
      SignInPasswordEntry(),
      SignInRegisterEntry(),
    ];
  }

  late SignInNavigationBloc _signInNavigation;

  @override
  void initState() {
    _hideAppBarOptions = true;
    _tabController = TabController(
      vsync: this,
      length: SignInPageRoutes.values.length,
    );
    super.initState();
  }

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
        Navigator.push(
          context,
          SlideRightRoute<void>(
            page: SignInEmailEntry(),
          ),
        );
        break;
      case SignInPageRoutes.passwordEntry:
        Navigator.push(
          context,
          SlideRightRoute<void>(
            page: SignInPasswordEntry(),
          ),
        );
        break;
      case SignInPageRoutes.registerEmailSignIn:
        Navigator.push(
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
    _tabController.dispose();
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
      // body: TabBarView(
      //   controller: _tabController,
      //   physics: NeverScrollableScrollPhysics(),
      //   children: _routes(),
      // ),
    );
  }
}
