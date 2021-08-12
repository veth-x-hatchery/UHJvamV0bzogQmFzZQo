import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vethx_login/core/utils/logger.dart';
import 'package:vethx_login/ui/alpha/alpha.page.dart';
import 'package:vethx_login/ui/login/sign_in_page.dart';
import 'package:vethx_login/ui/widgets/login/sign_in_options.widget.dart';

enum SignInPageRoutes {
  signInOptions,
  emailEntry,
  passwordEntry,
  registerEmailSignIn,
}

class NavigationRoutes {
  static const String slash = '/';
  static const String alpha = '/alpha';
  static const String signIn = '/signIn';
  static const String signInOptions = '/signInOptions';
  static const String signEmailEntry = '/signEmailEntry';
  static const String signPasswordEntry = '/signPasswordEntry';
  static const String signRegisterEmail = '/signRegisterEmail';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Logger.i(
        'Class: App, Method: onGenerateRoute: name ${settings.name}, arguments ${settings.arguments}');
    switch (settings.name) {
      case signIn:
        return MaterialPageRoute<void>(builder: (_) => SignInPage());
      case signInOptions:
        return MaterialPageRoute<void>(builder: (_) => SignInOptions());
      case slash:
      default:
        return MaterialPageRoute<void>(builder: (_) => AlphaPage());
    }
  }

  static Map<String, WidgetBuilder> routes() => <String, WidgetBuilder>{
        NavigationRoutes.signIn: (BuildContext context) => SignInPage(),
      };
}

class LoggingNavigationObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logger.i('LoggingNavigationObserver -> didPop: ${route.settings.name}');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logger.i('LoggingNavigationObserver -> didPush: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logger.i(
        'LoggingNavigationObserver -> didRemove: previousRoute:${previousRoute?.settings.name},  route: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint(
        'LoggingNavigationObserver -> didReplace: ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
  }
}
