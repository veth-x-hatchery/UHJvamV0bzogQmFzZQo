import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vethx_beta/features/authorization/presentation/pages/alpha.page.dart';
import 'package:vethx_beta/startup.dart';

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
    return AlphaPage.create();
  }
}
