import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vethx_beta/core/blocs/bloc_observer.dart';
import 'package:vethx_beta/core/utils/app_config.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/service_locator.dart';

// ignore: avoid_classes_with_only_static_members
class Startup {
  static Future<void> init() async {
    await AppConfig().fromEnvironment();
    await Startup.configure();
    await Startup.configureServices();
  }

  static Future<void> configure({String envPath = 'lib/.env'}) async {
    Logger.utils('Startup -> load($envPath)');
    await dotenv.load(fileName: envPath);
    Logger.utils('.env -> ${dotenv.env}');
    Logger.utils('.env -> ${const String.fromEnvironment('FOOBAR')}');
    Logger.utils(
        'appsettings.dev.json -> ${AppConfig().value('Logging:LogLevel:Microsoft.Hosting.Lifetime')}');
  }

  static Future<void> configureServices() async {
    Logger.utils('Startup -> configureServices()');
    Bloc.observer = CustomBlocObserver();
    await Firebase.initializeApp();
    await ServiceLocatorConfig.init();
  }
}
