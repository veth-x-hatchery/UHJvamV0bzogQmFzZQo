import 'dart:async';

import 'package:vethx_login/core/utils/logger.dart';
import 'package:vethx_login/ui/login/sign_in_page.dart';

class RootBLoCProvider {
  SignInNavigationBloc signInNavigation;
  RootBLoCProvider({
    required this.signInNavigation,
  });
}

class SignInNavigationBloc {
  final _signInPageRoutesController =
      StreamController<SignInPageGoTo>.broadcast();

  Stream<SignInPageGoTo> get goTo => _signInPageRoutesController.stream;

  void goToPage(SignInPageGoTo page) {
    Logger.i('SignInNavigationBloc -> $page');
    _signInPageRoutesController.add(page);
  }

  void dispose() {
    _signInPageRoutesController.close();
  }
}
