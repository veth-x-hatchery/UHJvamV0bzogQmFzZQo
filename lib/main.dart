import 'package:flutter/material.dart';
import 'package:vethx_login/core/blocs/app_state.dart';
import 'package:vethx_login/core/routes/navigation.dart';
import 'package:vethx_login/ui/alpha/alpha.page.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppStateContainer(
      blocProvider: BlocProvider(
        signInNavigation: SignInNavigationBloc(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoutes.onGenerateRoute,
        // initialRoute: NavigationRoutes.alpha,
        navigatorObservers: [LoggingNavigationObserver()],
        theme: ThemeData(primarySwatch: Colors.blue),
        home: AlphaPage(),
      ),
    );
  }
}
