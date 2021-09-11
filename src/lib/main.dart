import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hatchery/core/utils/logger.dart';
import 'package:hatchery/features/authorization/presentation/pages/alpha.page.dart';
import 'package:hatchery/startup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  FlutterError.onError = (details) {
    Logger.e(
      details.exceptionAsString(),
      ex: details.exception,
      stacktrace: details.stack,
    );
  };

  await Startup.init();

  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) => Logger.e(
      error.toString(),
      ex: error,
      stacktrace: stackTrace,
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlphaPage.create();
  }
}
