import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/features/signin/presentation/routes/navigation.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';

// ignore: avoid_classes_with_only_static_members
class NavigationRoutes {
  static const String slash = '/';
  static const String alpha = '/alpha';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Logger.i(
        'Class: App, Method: onGenerateRoute: name ${settings.name}, arguments ${settings.arguments}');
    switch (settings.name) {
      case SignInNavigationRoutes.signIn:
        return MaterialPageRoute<void>(
            builder: (_) => const SignInOptionsPage());
      case SignInNavigationRoutes.signInOptions:
        return MaterialPageRoute<void>(
            builder: (_) => const SignInOptionsPage());
      case slash:
      default:
        return MaterialPageRoute<void>(builder: (_) => const AlphaPage());
    }
  }

  static Map<String, WidgetBuilder> routes() => <String, WidgetBuilder>{
        SignInNavigationRoutes.signIn: (BuildContext context) =>
            const SignInOptionsPage(),
      };
}

class LoggingNavigationObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logger.presentation(
        'LoggingNavigationObserver -> didPop: ${route.settings.name}');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logger.presentation(
        'LoggingNavigationObserver -> didPush: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Logger.presentation(
        'LoggingNavigationObserver -> didRemove: previousRoute:${previousRoute?.settings.name},  route: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint(
        'LoggingNavigationObserver -> didReplace: ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
  }
}
