import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatchery/core/shared_kernel/shared_kernel.dart';
import 'package:hatchery/features/signin/domain/repositories/sign_in_repository.dart';
// import 'package:hatchery/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:hatchery/features/signin/domain/services/auth_failure.dart';
import 'package:hatchery/features/signin/domain/services/i_auth.service.dart';
import 'package:hatchery/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_auth.service.mock.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_check_credential_test.mocks.dart';

@GenerateMocks([
  IAuthService,
  ISignInRepository,
])
void main() {
  late SignInCredentialCheck _signInCheckIfCredentialIsInUse;

  late MockISignInRepository _mockSignInRepository;
  late MockIAuthService _mockAuthService;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _mockAuthService = MockIAuthService();

    _signInCheckIfCredentialIsInUse = SignInCredentialCheck(
      _mockSignInRepository,
      _mockAuthService,
    );
  });

  group('when check user credential is already registered', () {
    final credential = AuthServiceMock.invalidCredential;

    test('should return user is registered', () async {
      // arrange

      when(_mockSignInRepository.cacheCredential(credential))
          .thenAnswer((_) async => const Right(null));

      when(_mockAuthService.credentialIsAlreadyInUse(credential))
          .thenAnswer((_) async => const Right(true));

      // act

      final result = await _signInCheckIfCredentialIsInUse.call(credential);

      // assert

      expect(result, const Right(true));

      verify(_mockAuthService.credentialIsAlreadyInUse(credential));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange
      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: CheckCredentialErrorMessages.unavailable(),
      );

      when(_mockAuthService.credentialIsAlreadyInUse(credential))
          .thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInCheckIfCredentialIsInUse(credential);

      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthService.credentialIsAlreadyInUse(credential));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should cache the credential', () async {
      // arrange

      when(_mockSignInRepository.cacheCredential(credential))
          .thenAnswer((_) async => const Right(null));

      when(_mockAuthService.credentialIsAlreadyInUse(credential))
          .thenAnswer((_) async => const Right(true));

      // act

      await _signInCheckIfCredentialIsInUse.call(credential);

      // assert

      verify(_mockSignInRepository.cacheCredential(credential));
    });
  });
}
