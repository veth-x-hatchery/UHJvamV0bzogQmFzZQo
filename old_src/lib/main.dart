import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/authorization/presentation/pages/alpha.page.dart';
import 'package:vethx_beta/startup.dart';

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
    () => runApp(App()),
    (error, stackTrace) => Logger.e(
      error.toString(),
      ex: error,
      stacktrace: stackTrace,
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlphaPage.create();
  }
}
