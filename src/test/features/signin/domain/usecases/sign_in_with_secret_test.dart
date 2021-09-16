import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatchery/core/error/failures.dart';
import 'package:hatchery/core/shared_kernel/shared_kernel.dart';
import 'package:hatchery/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:hatchery/features/signin/domain/services/auth_failure.dart';
import 'package:hatchery/features/signin/domain/services/i_auth.service.dart';
import 'package:hatchery/features/signin/domain/usecases/sign_in_with_secret.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_auth.service.mock.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_check_credential_test.mocks.dart';

@GenerateMocks([
  ISignInRepository,
  IAuthService,
])
void main() {
  late SignInWithSecret _signInUseCase;
  late MockISignInRepository _mockSignInRepository;
  late MockIAuthService _mockAuthService;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _mockAuthService = MockIAuthService();
    _signInUseCase = SignInWithSecret(
      _mockSignInRepository,
      _mockAuthService,
    );
  });

  final credential = AuthServiceMock.validTestCredential;

  final secret = AuthServiceMock.validTestSecret;

  void _registerAuthenticationRequest() {
    when(_mockSignInRepository.skipNextLocalAuthenticationRequest())
        // ignore: void_checks
        .thenAnswer((_) async => right(unit));
  }

  group('when sign in with credential and secret', () {
    test('should return success with the given credentials', () async {
      // arrange

      _registerAuthenticationRequest();

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => Right(credential));

      when(_mockAuthService.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      )).thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase(secret);

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthService.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      ));
    });

    test('should return a server failure', () async {
      // arrange

      _registerAuthenticationRequest();

      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithSecretErrorMessages.unavailable(),
      );

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => right(credential));

      when(_mockAuthService.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      )).thenAnswer((_) async => left(throwFailure));

      // act

      final result = await _signInUseCase(secret);
      // assert

      expect(result.isLeft(), true);

      result.fold(
        (l) => expect(l, failureDetails),
        (_) => _,
      );

      verify(_mockAuthService.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return invalid credential and secret combination', () async {
      // arrange

      _registerAuthenticationRequest();

      const throwFailure = AuthFailure.invalidCredentialAndSecretCombination();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithSecretErrorMessages
            .invalidCredentialAndSecretCombination(),
      );

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => Right(credential));

      when(_mockAuthService.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      )).thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase(secret);
      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthService.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return invalid cached credential', () async {
      // arrange

      _registerAuthenticationRequest();

      const throwFailure = AuthFailure.invalidCachedCredential();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithSecretErrorMessages.invalidCachedCredential(),
      );

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => const Left(Failure.cacheFailure()));

      // act

      final result = await _signInUseCase(secret);

      // assert

      expect(result, left(failureDetails));

      verifyNever(_mockAuthService.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      ));
    });

    test(
        'when login with success '
        'then should cache a request to skip next local authentication request',
        () async {
      // arrange

      _registerAuthenticationRequest();

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => Right(credential));

      when(_mockAuthService.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      )).thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase(secret);

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthService.signInWithCredentialAndSecret(
        credentialAddress: credential,
        secret: secret,
      ));

      verify(_mockSignInRepository.skipNextLocalAuthenticationRequest())
          .called(1);
    });
  });
}
