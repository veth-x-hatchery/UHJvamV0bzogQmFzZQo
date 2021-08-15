import 'package:flutter/material.dart';
import 'package:vethx_login/core/blocs/app_state.dart';
import 'package:vethx_login/core/blocs/core_business_logic.dart';
import 'package:vethx_login/core/blocs/core_services.dart';
import 'package:vethx_login/core/routes/navigation.dart';
import 'package:vethx_login/ui/alpha/alpha.page.dart';
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
      blocProvider: BlocProvider(
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
        home: AlphaPage(),
      ),
    );
  }
}
