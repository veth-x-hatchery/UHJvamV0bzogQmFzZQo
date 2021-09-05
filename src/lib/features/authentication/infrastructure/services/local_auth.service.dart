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
  Future<Either<LocalAuthFailure, bool>> request({
    Duration? cacheTolerance,
    bool ignoreCacheAndForceRequest = false,
  }) async {
    return _cache(
      cacheTolerance,
      ignoreCacheAndForceRequest,
      _authenticate,
    );
  }

  void _scheduleCleanCache(Duration cacheTolerance) {
    Future.delayed(cacheTolerance).then((_) => _lastRequestResult = null);
  }

  Future<Either<LocalAuthFailure, bool>> _cache(
      Duration? cacheTolerance,
      bool hasPendingAuthentication,
      Future<Either<LocalAuthFailure, bool>> Function() auth) async {
    Logger.service(
        'LocalAuth: hasPendingAuthentication -> $hasPendingAuthentication');

    if (!hasPendingAuthentication) {
      if (_lastRequestResult != null) {
        Logger.service(
            'LocalAuth: cached last auth result -> $_lastRequestResult');
        return _lastRequestResult!;
      }
    }

    _lastRequestResult = await auth();

    bool noCache = false;
    _lastRequestResult!.fold(
      (_) => noCache = !noCache,
      (allowed) async {
        noCache = !allowed;
      },
    );

    final timeToClear = noCache
        ? const Duration(milliseconds: 500)
        : (cacheTolerance ?? ILocalAuth.TOLERANCE_BETWEEN_REQUESTS);

    _scheduleCleanCache(timeToClear);

    return _lastRequestResult!;
  }

  // Todo(v): Localizations
  static const IOSAuthMessages iosStrings = IOSAuthMessages(
      cancelButton: 'cancel',
      goToSettingsButton: 'settings',
      goToSettingsDescription: 'Please set up your Touch ID.',
      lockOut: 'Please reenable your Touch ID');

  static const localizedReason = 'Please authenticate...';

  Future<Either<LocalAuthFailure, bool>> _authenticate() async {
    try {
      final result = await _localAuth.authenticate(
        localizedReason: localizedReason,
        useErrorDialogs: false,
        // iOSAuthStrings: iosStrings,
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
          return left(const LocalAuthFailure.notAvailable());
        case auth_error.lockedOut:
        case auth_error.permanentlyLockedOut:
          return right(false);
        default:
          return left(const LocalAuthFailure.genericError());
      }
    }
  }
}
