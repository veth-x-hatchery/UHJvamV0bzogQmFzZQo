import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vethx_login/core/utils/logger.dart';
import 'package:vethx_login/ui/alpha/alpha.page.dart';
import 'package:vethx_login/ui/login/sign_in_page.dart';
import 'package:vethx_login/ui/widgets/login/sign_in_options.widget.dart';

class NavigationRoutes {
  static const String slash = '/';
  static const String alpha = '/alpha';
  static const String signIn = '/signIn';
  static const String signInOptions = '/signInOptions';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Logger.i(
        'Class: App, Method: onGenerateRoute: name ${settings.name}, arguments ${settings.arguments}');
    switch (settings.name) {
      case signIn:
        return MaterialPageRoute<void>(builder: (_) => SignInPage());
      case signInOptions:
        return MaterialPageRoute<void>(builder: (_) => SignInOptions());
      default:
        return MaterialPageRoute<void>(builder: (_) => AlphaPage());
    }
  }
}

class LoggingNavigationObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logger.i('Navigation didPop: ${route.settings.name}');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logger.i('Navigation didPush: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logger.i(
        'Navigation didRemove: previousRoute:${previousRoute?.settings.name},  route: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint(
        'Navigation didReplace: ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
  }
}
