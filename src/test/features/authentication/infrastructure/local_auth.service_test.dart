import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/services/storage/i_local_storage.service.dart';
import 'package:vethx_beta/core/services/storage/pii.service.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/authentication/domain/services/i_local_auth.service.dart';
import 'package:vethx_beta/features/authentication/infrastructure/services/local_auth.service.dart';
import 'package:vethx_beta/features/authentication/infrastructure/services/local_auth_failure.dart';

import 'local_auth.service_test.mocks.dart';

@GenerateMocks([
  LocalAuthentication,
  PII,
])
void main() {
  late MockLocalAuthentication _mockLocalAuthentication;
  late MockPII _mockStorageService;
  late LocalAuth _localAuth;

  setUp(() {
    _mockStorageService = MockPII();
    _mockLocalAuthentication = MockLocalAuthentication();
    _localAuth = LocalAuth(
      _mockLocalAuthentication,
      _mockStorageService,
    );
  });

  void _storageResultNotFound() {
    when(_mockStorageService.get(
            key: PersonallyIdentifiableInformationKeys.authenticationRequest))
        .thenAnswer((_) async => left(PII.objectNotFound(
            PersonallyIdentifiableInformationKeys.authenticationRequest)));
  }

  void _storageResult() {
    when(_mockStorageService.get(
            key: PersonallyIdentifiableInformationKeys.authenticationRequest))
        .thenAnswer((_) async => right(ILocalAuth.STORAGE_KEY));
  }

  void _storageWrite() {
    when(_mockStorageService.write(
            key: PersonallyIdentifiableInformationKeys.authenticationRequest,
            obj: ILocalAuth.STORAGE_KEY))
        .thenAnswer((_) async => right(unit));
  }

  void _storageRemove() {
    when(_mockStorageService.remove(
            key: PersonallyIdentifiableInformationKeys.authenticationRequest))
        .thenAnswer((_) async => right(unit));
    _storageResultNotFound();
  }

  void _throwExceptionCode(String code) {
    when(_mockLocalAuthentication.authenticate(
      localizedReason: LocalAuth.localizedReason,
      useErrorDialogs: false,
      // iOSAuthStrings: LocalAuth.iosStrings,
      stickyAuth: true,
    )).thenThrow(PlatformException(code: code));
  }

  void _authenticationResult(bool result) {
    when(_mockLocalAuthentication.authenticate(
      localizedReason: LocalAuth.localizedReason,
      useErrorDialogs: false,
      // iOSAuthStrings: LocalAuth.iosStrings,
      stickyAuth: true,
    )).thenAnswer((_) async => result);
  }

  Stream<int> _timedCounter(Duration interval, [int? maxCount]) async* {
    int i = 0;
    while (true) {
      await Future.delayed(interval);
      yield i++;
      if (i == maxCount) break;
    }
  }

  test('when throw current exceptions then should return correct left(failure)',
      () async {
    for (final code in [
      auth_error.passcodeNotSet,
      auth_error.notEnrolled,
      auth_error.notAvailable,
      auth_error.otherOperatingSystem,
    ]) {
      // arrange

      _storageResultNotFound();

      _throwExceptionCode(code);

      // act

      final result = await _localAuth.request();

      // assert

      expect(result, left(const LocalAuthFailure.notAvailable()));
    }
  });

  test('when throw current exceptions then should return correct right(false)',
      () async {
    for (final code in [
      auth_error.lockedOut,
      auth_error.permanentlyLockedOut,
    ]) {
      // arrange

      _storageResultNotFound();

      _storageWrite();

      _throwExceptionCode(code);

      // act

      final result = await _localAuth.request();

      // assert

      expect(result, right(false));
    }
  });

  test(
      'when authenticate with success then should cache the result while the [cacheTolerance] defined time',
      () async {
    // arrange

    _storageResultNotFound();

    _storageRemove();

    const cacheTolerance = Duration(seconds: 3);

    _authenticationResult(true);

    // act

    await for (final _ in _timedCounter(
      const Duration(seconds: 1),
      cacheTolerance.inSeconds,
    )) {
      Logger.tests('Timer: $_');

      final result = await _localAuth.request(cacheTolerance: cacheTolerance);

      // assert

      expect(result, right(true));
    }

    // assert

    verify(_mockLocalAuthentication.authenticate(
      localizedReason: LocalAuth.localizedReason,
      useErrorDialogs: false,
      // iOSAuthStrings: LocalAuth.iosStrings,
      stickyAuth: true,
    )).called(1);
  });

  test('when do not authenticate then should not cache the result', () async {
    // arrange

    _storageWrite();

    _storageResultNotFound();

    const cacheTolerance = Duration(seconds: 3);

    _authenticationResult(false);

    // act

    await for (final _ in _timedCounter(
      const Duration(seconds: 1),
      cacheTolerance.inSeconds,
    )) {
      Logger.tests('Timer: $_');

      final result = await _localAuth.request(cacheTolerance: cacheTolerance);

      // assert

      expect(result, right(false));
    }

    // assert

    verify(_mockLocalAuthentication.authenticate(
      localizedReason: LocalAuth.localizedReason,
      useErrorDialogs: false,
      // iOSAuthStrings: LocalAuth.iosStrings,
      stickyAuth: true,
    )).called(cacheTolerance.inSeconds);
  });
}
