import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:vethx_beta/core/utils/logger.dart';

// ignore: avoid_classes_with_only_static_members
class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();

  dynamic _config;

  String get _env =>
      const String.fromEnvironment('APP_ENVIRONMENT', defaultValue: 'dev');

  Future<void> fromEnvironment({String? env}) async {
    try {
      env ??= _instance._env;
      Logger.utils('AppConfig.fromEnvironment(appsettings.$env.json)');
      final contents = await rootBundle.loadString('lib/appsettings.$env.json');
      _config = jsonDecode(contents);
    } on Exception catch (e, s) {
      Logger.utils(
        'Did you have appsettings.$env.json registered?',
        exception: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  /// Actualy supports 9 levels of search
  /// value1:value2:value3:value4...
  String value(String key) {
    Logger.utils('AppConfig.value($key)');
    if (_config == null) {
      final message = 'Did you have appsettings.$_env.json registered?';
      Logger.utils(message);
      throw Exception(message);
    }
    final k = key.split(':');
    dynamic value;
    switch (k.length) {
      case 1:
        value = _config[k[0]];
        break;
      case 2:
        value = _config[k[0]][k[1]];
        break;
      case 3:
        value = _config[k[0]][k[1]][k[2]];
        break;
      case 4:
        value = _config[k[0]][k[1]][k[2]][k[3]];
        break;
      case 5:
        value = _config[k[0]][k[1]][k[2]][k[3]][k[4]];
        break;
      case 6:
        value = _config[k[0]][k[1]][k[2]][k[3]][k[4]][k[5]];
        break;
      case 7:
        value = _config[k[0]][k[1]][k[2]][k[3]][k[4]][k[5]][k[6]];
        break;
      case 8:
        value = _config[k[0]][k[1]][k[2]][k[3]][k[4]][k[5]][k[6]][k[7]];
        break;
      case 9:
        value = _config[k[0]][k[1]][k[2]][k[3]][k[4]][k[5]][k[6]][k[7]][k[8]];
        break;
      default:
        const message =
            'AppConfigSettings actualy do not support JSON with more than 9 levels!';
        Logger.utils(message);
        throw Exception(message);
    }
    return '$value';
  }

  bool isDevelopment() => _env == 'dev';

  bool isIntegrationTest() => _env == 'test';
}
