import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:vethx_beta/core/services/storage/i_local_storage.service.dart';
import 'package:vethx_beta/core/shared_kernel/shared_kernel.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/authentication/domain/services/i_local_auth.service.dart';
import 'package:vethx_beta/features/authentication/infrastructure/services/local_auth_failure.dart';
import 'package:vethx_beta/l10n/l10n.dart';

class RequestLocalAuthentication implements UseCase<bool, NoParams> {
  final ILocalAuth _localAuth;
  final ILocalStorage<SensitiveDataKeys> _cacheService;

  RequestLocalAuthentication(
    this._localAuth,
    this._cacheService,
  );

  @override
  Future<Either<FailureDetails<LocalAuthFailure>, bool>> call(
      NoParams params) async {
    final ignoreThisRequest = await _shouldIgnoreThisRequest();

    if (ignoreThisRequest) {
      return right(true);
    }

    final hasPendingAuthentication = await _pendingAuthentication();

    return _localAuth
        .request(ignoreCacheAndForceRequest: hasPendingAuthentication)
        .then((result) {
      return result.fold(
        (failure) => left(_mapFailures(failure)),
        (allowed) async {
          if (allowed) {
            await _removeAuthenticationRequest();
          } else {
            await _registerAuthenticationRequest();
          }
          return right(allowed);
        },
      );
    });
  }

  Future<bool> _shouldIgnoreThisRequest() async {
    final result = await _cacheService.get(
        key: SensitiveDataKeys.localAuthenticationSkipNextRequest);
    Logger.domain(
        'RequestLocalAuthentication: _shouldIgnoreThisRequest -> $result');
    return result.fold(
      (_) => false, // notFound
      (r) async {
        await _cacheService.remove(
            key: SensitiveDataKeys.localAuthenticationSkipNextRequest);
        return true;
      },
    );
  }

  Future<void> _registerAuthenticationRequest() async {
    final result = await _cacheService.write(
      key: SensitiveDataKeys.authenticationRequest,
      obj: ILocalAuth.STORAGE_KEY,
    );
    Logger.domain(
        'RequestLocalAuthentication: _registerAuthenticationRequest -> $result');
    return result.fold(
      (l) =>
          throw PlatformException(code: '${l.runtimeType}: unavailableService'),
      (r) => unit,
    );
  }

  Future<void> _removeAuthenticationRequest() async {
    final result = await _cacheService.remove(
      key: SensitiveDataKeys.authenticationRequest,
    );
    Logger.domain(
        'RequestLocalAuthentication: _removeAuthenticationRequest -> $result');
    return result.fold(
      (_) => unit,
      (_) => unit,
    );
  }

  /// If when app request authentication the user close the app
  /// Its necessary to come back requesting the same authorization
  Future<bool> _pendingAuthentication() async {
    final result =
        await _cacheService.get(key: SensitiveDataKeys.authenticationRequest);
    Logger.domain(
        'RequestLocalAuthentication: _pendingAuthentication -> $result');
    return result.fold(
      (notFound) => false,
      (_) => true,
    );
  }

  FailureDetails<LocalAuthFailure> _mapFailures(LocalAuthFailure auth) {
    return auth.map(
      genericError: (_) => FailureDetails(
        failure: auth,
        message: RequestLocalAuthenticationErrorMessages.genericError(),
      ),
      notAvailable: (_) => FailureDetails(
        failure: auth,
        message: RequestLocalAuthenticationErrorMessages.unavailable(),
      ),
    );
  }
}

// ignore: avoid_classes_with_only_static_members
class RequestLocalAuthenticationErrorMessages {
  static MessageFromLocalizations unavailable() => (appLocalizations) =>
      appLocalizations?.comum_error_message ?? 'comum_error_message';

  static MessageFromLocalizations genericError() => (appLocalizations) =>
      appLocalizations?.comum_error_message ?? 'comum_error_message';
}
