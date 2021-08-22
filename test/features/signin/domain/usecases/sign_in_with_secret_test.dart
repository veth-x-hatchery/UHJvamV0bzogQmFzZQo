import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_secret.dart';

import 'sign_in_check_credential_test.mocks.dart';

@GenerateMocks([
  ISignInRepository,
  IAuthFacade,
])
void main() {
  late SignInWithSecret _signInUseCase;
  late MockISignInRepository _mockSignInRepository;
  late MockIAuthFacade _mockAuthFacade;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _mockAuthFacade = MockIAuthFacade();
    _signInUseCase = SignInWithSecret(
      _mockSignInRepository,
      _mockAuthFacade,
    );
  });

  final credential = Credential('test@vethx.com');

  final secret = Secret('dGVzdEB2ZXRoeC5jb20K');

  group('when sign in with credential and secret', () {
    test('should return success with the given credentials', () async {
      // arrange

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => Right(credential));

      when(_mockAuthFacade.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      )).thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase.call(Params(secret: secret));

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthFacade.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      ));
    });

    test('should return a server failure', () async {
      // arrange
      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithSecretErrorMessages.unavailable,
      );

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => Right(credential));

      when(_mockAuthFacade.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      )).thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(Params(secret: secret));
      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return invalid credential and secret combination', () async {
      // arrange
      const throwFailure = AuthFailure.invalidCredentialAndSecretCombination();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message:
            SignInWithSecretErrorMessages.invalidCredentialAndSecretCombination,
      );

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => Right(credential));

      when(_mockAuthFacade.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      )).thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(Params(secret: secret));
      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return invalid cached credential', () async {
      // arrange
      const throwFailure = AuthFailure.invalidCachedCredential();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithSecretErrorMessages.invalidCachedCredential,
      );

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => const Left(Failure.cacheFailure()));

      // act

      final result = await _signInUseCase.call(Params(secret: secret));

      // assert

      expect(result, left(failureDetails));

      verifyNever(_mockAuthFacade.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      ));
    });
  });
}
