import 'dart:io';

import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

abstract class ILocalAuth {
  Future<bool> isBiometricsAvaiable();
  Future<void> authenticate();
  Future<void> cancel();
}

class LocalAuth implements ILocalAuth {
  final LocalAuthentication _localAuth;

  LocalAuth(this._localAuth);

  final IOSAuthMessages _iosStrings = const IOSAuthMessages(
      cancelButton: 'cancel',
      goToSettingsButton: 'settings',
      goToSettingsDescription: 'Please set up your Touch ID.',
      lockOut: 'Please reenable your Touch ID');

  @override
  Future<bool> isBiometricsAvaiable() async {
    return _localAuth.canCheckBiometrics;
  }

  @override
  Future<void> authenticate() async {
    try {
      await _localAuth.authenticate(
        localizedReason: 'Please authenticate...',
        useErrorDialogs: false,
        iOSAuthStrings: _iosStrings,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      switch (e.code) {
        case auth_error.passcodeNotSet:
          break;
        case auth_error.notEnrolled:
          break;
        case auth_error.notAvailable:
          break;
        case auth_error.otherOperatingSystem:
          break;
        case auth_error.lockedOut:
          break;
        case auth_error.permanentlyLockedOut:
          break;
        default:
      }
    }
  }

  @override
  Future<void> cancel() async {
    _localAuth.stopAuthentication();
  }

  /// On Android, you can check only for existence of fingerprint hardware prior to API 29 (Android Q)
  Future<void> _availableBiometrics() async {
    final availableBiometrics = await _localAuth.getAvailableBiometrics();

    if (Platform.isIOS) {
      if (availableBiometrics.contains(BiometricType.face)) {
        // Face ID.
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        // Touch ID.
      }
    }
  }
}
