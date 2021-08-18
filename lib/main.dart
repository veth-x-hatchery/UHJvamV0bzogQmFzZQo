import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/features/signin/sign_in_injection_container.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await signInDependenciesInjection();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationRoutes.onGenerateRoute,
      routes: NavigationRoutes.routes(),
      // initialRoute: NavigationRoutes.alpha,
      navigatorObservers: [LoggingNavigationObserver()],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AlphaPage.create(context),
    );
  }
}
