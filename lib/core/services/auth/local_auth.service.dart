import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:vethx_beta/core/error/errors.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';

abstract class ILocalAuth {
  /// Actually will INATIVATE app lifecycle state.
  /// And this will kill the BLoC that call it.
  /// When app returns from RESUME will get the last result
  /// [checkIsAvailable] and [authResult]
  Future<Either<AuthFailure, bool>> authenticate();
  Future<Either<AuthFailure, Unit>> cancel();
  bool get checkIsAvailable;
  Either<AuthFailure, bool> get authResult;
}

class LocalAuth implements ILocalAuth {
  final LocalAuthentication _localAuth;

  LocalAuth(this._localAuth);

  Either<AuthFailure, bool>? _cachedAuthResult;

  Future<Either<AuthFailure, bool>> _cache(
      Future<Either<AuthFailure, bool>> Function() auth) async {
    _cachedAuthResult = await auth();
    return _cachedAuthResult!;
  }

  @override
  Either<AuthFailure, bool> get authResult {
    if (_cachedAuthResult == null) {
      throw UnexpectedValueError('There is not last check realized');
    }
    Future.delayed(const Duration(seconds: 1))
        .then((value) => _cachedAuthResult = null);
    return _cachedAuthResult!;
  }

  @override
  bool get checkIsAvailable => _cachedAuthResult != null;

  final IOSAuthMessages _iosStrings = const IOSAuthMessages(
      cancelButton: 'cancel',
      goToSettingsButton: 'settings',
      goToSettingsDescription: 'Please set up your Touch ID.',
      lockOut: 'Please reenable your Touch ID');

  @override
  Future<Either<AuthFailure, bool>> authenticate() async {
    return _cache(_authenticate);
  }

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

  @override
  Future<Either<AuthFailure, Unit>> cancel() async {
    if (!await _localAuth.stopAuthentication()) {
      _cachedAuthResult = left(const AuthFailure.serverError());
      return left(const AuthFailure.serverError());
    }
    _cachedAuthResult = right(false);
    return right(unit);
  }
}
