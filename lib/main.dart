import 'package:flutter/material.dart';
import 'package:vethx_beta/core/blocs/app_state.dart';
import 'package:vethx_beta/core/blocs/core_business_logic.dart';
import 'package:vethx_beta/core/blocs/core_services.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationService = NavigationService();
    return AppStateContainer(
      serviceProvider: ServiceProvider(
        navigationService: navigationService,
      ),
      blocProvider: RootBLoCProvider(
        signInNavigation: SignInNavigationBloc(),
      ),
      child: MaterialApp(
        navigatorKey: navigationService.navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoutes.onGenerateRoute,
        routes: NavigationRoutes.routes(),
        // initialRoute: NavigationRoutes.alpha,
        navigatorObservers: [LoggingNavigationObserver()],
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const AlphaPage(),
      ),
    );
  }
}
