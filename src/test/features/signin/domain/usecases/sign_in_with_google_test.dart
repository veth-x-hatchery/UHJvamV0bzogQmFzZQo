import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/services/storage/cache.service.dart';
import 'package:vethx_beta/core/services/storage/i_local_storage.service.dart';
import 'package:vethx_beta/core/shared_kernel/shared_kernel.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';

import 'sign_in_with_google_test.mocks.dart';
import 'sign_in_with_secret_test.mocks.dart';

@GenerateMocks([
  CacheService,
])
void main() {
  late SignInWithGoogle _signInUseCase;
  late MockIAuthFacade _mockAuthFacade;
  late MockCacheService _mockStorageService;

  setUp(() {
    _mockAuthFacade = MockIAuthFacade();
    _mockStorageService = MockCacheService();

    _signInUseCase = SignInWithGoogle(
      _mockAuthFacade,
      _mockStorageService,
    );
  });

  void _registerAuthenticationRequest() {
    when(_mockStorageService.write(
      key: SensitiveDataKeys.localAuthenticationSkipNextRequest,
      obj: 'true',
    )).thenAnswer((_) async => const Right(unit));
  }

  group('when sign in with google', () {
    test('should return success with google sign in', () async {
      // arrange

      _registerAuthenticationRequest();

      when(_mockAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase(const NoParams());

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthFacade.signInWithGoogle());

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return cancelled by user failure', () async {
      // arrange

      _registerAuthenticationRequest();

      const throwFailure = AuthFailure.cancelledByUser();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithGoogleErrorMessages.cancelledByUser(),
      );

      when(_mockAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase(const NoParams());

      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.signInWithGoogle());

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange

      _registerAuthenticationRequest();

      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithGoogleErrorMessages.unknowError(),
      );

      when(_mockAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase(const NoParams());

      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.signInWithGoogle());

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test(
        'when login with success '
        'then should cache a request to skip next local authentication request',
        () async {
      // arrange

      _registerAuthenticationRequest();

      when(_mockAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase(const NoParams());

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthFacade.signInWithGoogle());

      verify(_mockStorageService.write(
        key: SensitiveDataKeys.localAuthenticationSkipNextRequest,
        obj: 'true',
      )).called(1);
    });
  });
}
