import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/authentication/domain/services/i_local_auth.service.dart';
import 'package:vethx_beta/features/authentication/infrastructure/services/local_auth_failure.dart';

class LocalAuth implements ILocalAuth {
  final LocalAuthentication _localAuth;

  LocalAuth(this._localAuth);

  Either<LocalAuthFailure, bool>? _lastRequestResult;

  @override
  Future<Either<LocalAuthFailure, bool>> request(
      {Duration? cacheTolerance}) async {
    return _cache(cacheTolerance, _authenticate);
  }

  void _scheduleCleanCache(Duration cacheTolerance) {
    Future.delayed(cacheTolerance).then((_) => _lastRequestResult = null);
  }

  Future<Either<LocalAuthFailure, bool>> _cache(Duration? cacheTolerance,
      Future<Either<LocalAuthFailure, bool>> Function() auth) async {
    if (_lastRequestResult != null) {
      return _lastRequestResult!;
    }

    _lastRequestResult = await auth();

    _scheduleCleanCache(
        cacheTolerance ?? ILocalAuth.TOLERANCE_BETWEEN_REQUESTS);

    return _lastRequestResult!;
  }

  final IOSAuthMessages _iosStrings = const IOSAuthMessages(
      cancelButton: 'cancel',
      goToSettingsButton: 'settings',
      goToSettingsDescription: 'Please set up your Touch ID.',
      lockOut: 'Please reenable your Touch ID');

  Future<Either<LocalAuthFailure, bool>> _authenticate() async {
    try {
      final result = await _localAuth.authenticate(
        localizedReason: 'Please authenticate...',
        useErrorDialogs: false,
        iOSAuthStrings: _iosStrings,
        stickyAuth: true,
      );
      Logger.service('LocalAuth: authenticate -> $result');
      return right(result);
    } on PlatformException catch (e, s) {
      Logger.service('LocalAuth: ${e.code}', exception: e, stackTrace: s);
      switch (e.code) {
        case auth_error.passcodeNotSet:
        case auth_error.notEnrolled:
        case auth_error.notAvailable:
        case auth_error.otherOperatingSystem:
        case auth_error.lockedOut:
          return left(const LocalAuthFailure.notAvailable());
        case auth_error.permanentlyLockedOut:
          return right(false);
      }
    }
    return left(const LocalAuthFailure.genericError());
  }
}
