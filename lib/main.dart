import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/startup.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';
import 'package:vethx_beta/ui/widgets/default/lifecycle_manager.widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Startup.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
      onLifecycleStateChange: (s) => Logger.widget('AppLifecycleState: $s'),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoutes.onGenerateRoute,
        routes: NavigationRoutes.routes(),
        // initialRoute: NavigationRoutes.alpha,
        navigatorObservers: [LoggingNavigationObserver()],
        theme: ThemeData(primarySwatch: Colors.blue),
        home: AlphaPage.create(context),
      ),
    );
  }
}
