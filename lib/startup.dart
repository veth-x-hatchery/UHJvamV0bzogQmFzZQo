import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/service_locator.dart';

// ignore: avoid_classes_with_only_static_members
class Startup {
  static Future<void> init() async {
    await Startup.configure();
    await Startup.configureServices();
  }

  static Future<void> configureServices() async {
    Logger.utils('Startup -> configureServices()');
    await Firebase.initializeApp();
    await ServiceLocatorConfig.init();
  }

  static Future<void> configure({String envPath = '.env'}) async {
    Logger.utils('Startup -> load($envPath)');
    await dotenv.load(fileName: envPath);
  }
}
