import 'dart:async';

import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';

class NavigationManager {
  final _signInPageRoutesController =
      StreamController<SignInPageGoTo>.broadcast();

  void goTo(SignInPageGoTo parameters) {
    Logger.bloc('NavigationManager -> goTo -> $parameters');
    _signInPageRoutesController.sink.add(parameters);
  }

  Stream<SignInPageGoTo> get stream => _signInPageRoutesController.stream;
}
