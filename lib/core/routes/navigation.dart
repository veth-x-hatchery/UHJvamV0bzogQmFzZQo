import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_page.dart';
import 'package:vethx_beta/features/signin/presentation/routes/navigation.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';

class NavigationRoutes {
  static const String slash = '/';
  static const String alpha = '/alpha';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Logger.i(
        'Class: App, Method: onGenerateRoute: name ${settings.name}, arguments ${settings.arguments}');
    switch (settings.name) {
      case SignInNavigationRoutes.signIn:
        return MaterialPageRoute<void>(builder: (_) => SignInPage());
      case SignInNavigationRoutes.signInOptions:
        return MaterialPageRoute<void>(builder: (_) => SignInOptions());
      case slash:
      default:
        return MaterialPageRoute<void>(builder: (_) => AlphaPage());
    }
  }

  static Map<String, WidgetBuilder> routes() => <String, WidgetBuilder>{
        SignInNavigationRoutes.signIn: (BuildContext context) => SignInPage(),
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
