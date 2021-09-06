import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/services/storage/cache.service.dart';
import 'package:vethx_beta/core/services/storage/i_local_storage.service.dart';
import 'package:vethx_beta/core/shared_kernel/shared_kernel.dart';
import 'package:vethx_beta/features/authentication/domain/services/i_local_auth.service.dart';
import 'package:vethx_beta/features/authentication/domain/usecases/request_authentication.usecase.dart';
import 'package:vethx_beta/features/authentication/infrastructure/services/local_auth_failure.dart';

import 'request_authentication.usecase_test.mocks.dart';

@GenerateMocks([
  ILocalAuth,
  CacheService,
])
void main() {
  late RequestLocalAuthentication _useCase;
  late MockILocalAuth _mockILocalAuth;
  late MockCacheService _mockStorageService;

  setUp(() {
    _mockILocalAuth = MockILocalAuth();
    _mockStorageService = MockCacheService();

    _useCase = RequestLocalAuthentication(
      _mockILocalAuth,
      _mockStorageService,
    );
  });

  void _storageWithoutPendingRequests() {
    when(_mockStorageService.get(key: SensitiveDataKeys.authenticationRequest))
        .thenAnswer((_) async => left(CacheService.objectNotFound(
            SensitiveDataKeys.authenticationRequest)));
  }

  void _storagePendingAuthentication() {
    when(_mockStorageService.get(key: SensitiveDataKeys.authenticationRequest))
        .thenAnswer((_) async => right(ILocalAuth.STORAGE_KEY));
  }

  void _storageWrite() {
    when(_mockStorageService.write(
            key: SensitiveDataKeys.authenticationRequest,
            obj: ILocalAuth.STORAGE_KEY))
        .thenAnswer((_) async => right(unit));
  }

  void _storageRemove() {
    when(_mockStorageService.remove(
            key: SensitiveDataKeys.authenticationRequest))
        .thenAnswer((_) async => right(unit));
  }

  void _withoutIgnoreNextAuthRequest() {
    when(_mockStorageService.get(
            key: SensitiveDataKeys.localAuthenticationSkipNextRequest))
        .thenAnswer((_) async => left(CacheService.objectNotFound(
            SensitiveDataKeys.localAuthenticationSkipNextRequest)));
  }

  test('when request local auth then should return correct failure details',
      () async {
    final expectedFailuresAndDetails = {
      const LocalAuthFailure.genericError():
          RequestLocalAuthenticationErrorMessages.genericError(),
      const LocalAuthFailure.notAvailable():
          RequestLocalAuthenticationErrorMessages.unavailable(),
    };

    _storageWithoutPendingRequests();

    _withoutIgnoreNextAuthRequest();

    for (final failure in expectedFailuresAndDetails.entries) {
      // arrange

      when(_mockILocalAuth.request())
          .thenAnswer((_) async => left(failure.key));

      // act

      final result = await _useCase(const NoParams());

      // assert

      expect(
        result,
        left(FailureDetails(
          failure: failure.key,
          message: failure.value,
        )),
      );
    }
  });

  test('when request local auth then should return success', () async {
    // arrange

    _storageWithoutPendingRequests();

    _withoutIgnoreNextAuthRequest();

    _storageRemove();

    when(_mockILocalAuth.request()).thenAnswer((_) async => right(true));

    // act

    final result = await _useCase(const NoParams());

    // assert

    expect(
      result,
      right(true),
    );
  });

  test(
      'when request local auth then should return denied access '
      'and register a pending request on database', () async {
    // arrange

    _storageWithoutPendingRequests();

    _withoutIgnoreNextAuthRequest();

    _storageWrite();

    when(_mockILocalAuth.request()).thenAnswer((_) async => right(false));

    // act

    final result = await _useCase(const NoParams());

    // assert

    expect(
      result,
      right(false),
    );

    verify(_mockStorageService.write(
      key: SensitiveDataKeys.authenticationRequest,
      obj: ILocalAuth.STORAGE_KEY,
    )).called(1);
  });

  test(
      'when have a register that indicate pending authentication '
      'request then should request it to the user and remove the pending request '
      'from the database', () async {
    // arrange

    _storagePendingAuthentication();

    _withoutIgnoreNextAuthRequest();

    _storageRemove();

    when(_mockILocalAuth.request(ignoreCacheAndForceRequest: true))
        .thenAnswer((_) async => right(true));

    await _useCase(const NoParams());

    // assert

    verify(_mockStorageService.remove(
            key: SensitiveDataKeys.authenticationRequest))
        .called(1);
  });

  test(
      'when have a ignore request to this request '
      'then should allow the user access without validations '
      'and remove the actual pending request register from database', () async {
    // arrange

    when(_mockStorageService.get(
            key: SensitiveDataKeys.localAuthenticationSkipNextRequest))
        .thenAnswer((_) async => right('true'));

    when(_mockStorageService.remove(
            key: SensitiveDataKeys.localAuthenticationSkipNextRequest))
        .thenAnswer((_) async => right(unit));

    await _useCase(const NoParams());

    // assert

    verify(_mockStorageService.remove(
            key: SensitiveDataKeys.localAuthenticationSkipNextRequest))
        .called(1);

    verifyNever(
        _mockStorageService.get(key: SensitiveDataKeys.authenticationRequest));

    verifyNever(_mockILocalAuth.request());
  });
}
