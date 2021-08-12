import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vethx_login/core/blocs/app_state.dart';
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
      SignInOptions(nextForm: _goToTheNextPage),
      SignInEmailEntry(nextForm: _goToTheNextPage),
      SignInPasswordEntry(nextForm: _goToTheNextPage),
      SignInRegisterEntry(nextForm: _goToTheNextPage),
    ];
  }

  late final SignInNavigationBloc _signInNavigation;

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: SignInPageRoutes.values.length,
    );
    super.initState();
    _hideAppBarOptions = true;

    _signInNavigation =
        AppStateContainer.of(context).blocProvider.signInNavigation;

    _signInNavigation.deviceBluetoothState.listen((event) {
      Navigator.push(
        context,
        SlideRightRoute<void>(
          page: SignInEmailEntry(nextForm: _goToTheNextPage),
        ),
      );
    });
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
      body: SignInOptions(
        nextForm: (SignInPageRoutes delta) =>
            _signInNavigation.signInGoTo(delta),
      ),
      // body: TabBarView(
      //   controller: _tabController,
      //   physics: NeverScrollableScrollPhysics(),
      //   children: _routes(),
      // ),
    );
  }
}
