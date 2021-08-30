import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';

abstract class ILocalAuth {
  Future<Either<AuthFailure, bool>> authenticate();
  Future<Either<AuthFailure, Unit>> cancel();
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
  Future<Either<AuthFailure, bool>> authenticate() async {
    try {
      return right(await _localAuth.authenticate(
        localizedReason: 'Please authenticate...',
        useErrorDialogs: false,
        iOSAuthStrings: _iosStrings,
        stickyAuth: true,
      ));
    } on PlatformException catch (e, s) {
      Logger.service('LocalAuth: ${e.code}', exception: e, stackTrace: s);
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
          break;
      }
    }
    return left(const AuthFailure.serverError());
  }

  @override
  Future<Either<AuthFailure, Unit>> cancel() async {
    if (!await _localAuth.stopAuthentication()) {
      return left(const AuthFailure.serverError());
    }
    return right(unit);
  }
}
