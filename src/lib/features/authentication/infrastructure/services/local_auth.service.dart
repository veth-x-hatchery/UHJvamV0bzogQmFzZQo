import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:vethx_beta/core/services/storage/i_local_storage.service.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/authentication/domain/services/i_local_auth.service.dart';
import 'package:vethx_beta/features/authentication/infrastructure/services/local_auth_failure.dart';

class LocalAuth implements ILocalAuth {
  final LocalAuthentication _localAuth;
  final ILocalStorage<PersonallyIdentifiableInformationKeys> _cacheService;

  LocalAuth(
    this._localAuth,
    this._cacheService,
  );

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
    final hasPendingAuthentication = await _pendingAuthentication();

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
        if (allowed) {
          await _removeAuthenticationRequest();
        } else {
          await _registerAuthenticationRequest();
        }
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

  Future<void> _registerAuthenticationRequest() async {
    final result = await _cacheService.write(
      key: PersonallyIdentifiableInformationKeys.authenticationRequest,
      obj: ILocalAuth.STORAGE_KEY,
    );
    Logger.service('LocalAuth: _registerAuthenticationRequest -> $result');
    return result.fold(
      (l) =>
          throw PlatformException(code: '${l.runtimeType}: unavailableService'),
      (r) => unit,
    );
  }

  Future<void> _removeAuthenticationRequest() async {
    final result = await _cacheService.remove(
      key: PersonallyIdentifiableInformationKeys.authenticationRequest,
    );
    Logger.service('LocalAuth: _removeAuthenticationRequest -> $result');
    return result.fold(
      (_) => unit,
      (_) => unit,
    );
  }

  /// If when app request authentication the user close the app
  /// Its necessary to come back requesting the same authorization
  Future<bool> _pendingAuthentication() async {
    final result = await _cacheService.get(
        key: PersonallyIdentifiableInformationKeys.authenticationRequest);
    Logger.service('LocalAuth: _pendingAuthentication -> $result');
    return result.fold(
      (notFound) => false,
      (_) => true,
    );
  }
}
