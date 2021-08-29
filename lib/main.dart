import 'package:flutter/material.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/startup.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Startup.init();
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
