import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';

abstract class ILocalAuth {
  // ignore: constant_identifier_names
  static const TOLERANCE_BETWEEN_REQUESTS = Duration(seconds: 10);

  /// Actually will INATIVATE app lifecycle state.
  /// And this will kill the BLoC that call it.
  /// When app returns from RESUME will get the last result
  /// [lastResultAvailable] and [cachedResult]
  Future<Either<AuthFailure, bool>> request({Duration? cacheTolerance});
}

class LocalAuth implements ILocalAuth {
  final LocalAuthentication _localAuth;

  LocalAuth(this._localAuth);

  Either<AuthFailure, bool>? _lastRequestResult;

  @override
  Future<Either<AuthFailure, bool>> request({Duration? cacheTolerance}) async {
    return _cache(cacheTolerance, _authenticate);
  }

  Future<Either<AuthFailure, bool>> _cache(Duration? cacheTolerance,
      Future<Either<AuthFailure, bool>> Function() auth) async {
    if (_lastRequestResult != null) {
      return _lastRequestResult!;
    }

    _lastRequestResult = await auth();

    Future.delayed(cacheTolerance ?? ILocalAuth.TOLERANCE_BETWEEN_REQUESTS)
        .then((_) => _lastRequestResult = null);

    return _lastRequestResult!;
  }

  final IOSAuthMessages _iosStrings = const IOSAuthMessages(
      cancelButton: 'cancel',
      goToSettingsButton: 'settings',
      goToSettingsDescription: 'Please set up your Touch ID.',
      lockOut: 'Please reenable your Touch ID');

  Future<Either<AuthFailure, bool>> _authenticate() async {
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
          return right(true);
        case auth_error.notEnrolled:
          return right(true);
        case auth_error.notAvailable:
          break;
        case auth_error.otherOperatingSystem:
          break;
        case auth_error.lockedOut:
          break;
        case auth_error.permanentlyLockedOut:
          return right(false);
        default:
          break;
      }
    }
    return left(const AuthFailure.serverError());
  }
}
