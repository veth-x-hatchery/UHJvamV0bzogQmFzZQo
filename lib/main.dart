import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vethx_beta/startup.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';

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
    return AlphaPage.create(context);
  }
}
