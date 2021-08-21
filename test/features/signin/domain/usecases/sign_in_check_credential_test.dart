import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
// import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';

import 'sign_in_check_credential_test.mocks.dart';

@GenerateMocks([
  IAuthFacade,
  ISignInRepository,
])
void main() {
  late SignInCredentialCheck _signInCheckIfCredentialIsInUse;

  late MockISignInRepository _mockSignInRepository;
  late MockIAuthFacade _mockAuthFacade;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _mockAuthFacade = MockIAuthFacade();

    _signInCheckIfCredentialIsInUse = SignInCredentialCheck(
      _mockSignInRepository,
      _mockAuthFacade,
    );
  });

  group('when check user credential is already registered', () {
    final credential = Credential('test@vethx.com');

    test('should return user is registered', () async {
      // arrange

      when(_mockAuthFacade.credentialIsAlreadyInUse(credential))
          .thenAnswer((_) async => const Right(true));

      // act

      final result = await _signInCheckIfCredentialIsInUse
          .call(Params(credential: credential));

      // assert

      expect(result, const Right(true));

      verify(_mockAuthFacade.credentialIsAlreadyInUse(credential));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange
      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: CheckCredentialErrorMessages.unavailable,
      );

      when(_mockAuthFacade.credentialIsAlreadyInUse(credential))
          .thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInCheckIfCredentialIsInUse
          .call(Params(credential: credential));

      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.credentialIsAlreadyInUse(credential));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should cache the credential', () async {
      // arrange

      when(_mockSignInRepository.cacheCredential(credential))
          .thenAnswer((_) async => const Right(null));

      when(_mockAuthFacade.credentialIsAlreadyInUse(credential))
          .thenAnswer((_) async => const Right(true));

      // act

      await _signInCheckIfCredentialIsInUse
          .call(Params(credential: credential));

      // assert

      verify(_mockSignInRepository.cacheCredential(credential));
    });
  });
}
