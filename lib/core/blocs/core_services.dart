import 'package:flutter/widgets.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<T?> navigateTo<T>(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }
}

class ServiceProvider {
  final NavigationService navigationService;
  ServiceProvider({required this.navigationService});
}
