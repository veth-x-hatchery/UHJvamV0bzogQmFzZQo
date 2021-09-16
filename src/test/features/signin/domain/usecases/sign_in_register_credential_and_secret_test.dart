import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatchery/core/shared_kernel/shared_kernel.dart';
import 'package:hatchery/features/signin/domain/entities/credentials_entity.dart';
import 'package:hatchery/features/signin/domain/repositories/sign_in_repository.dart';
// import 'package:hatchery/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:hatchery/features/signin/domain/services/auth_failure.dart';
import 'package:hatchery/features/signin/domain/services/i_auth.service.dart';
import 'package:hatchery/features/signin/domain/usecases/sign_in_register_credential_and_secret.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_auth.service.mock.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_check_credential_test.mocks.dart';

@GenerateMocks([
  ISignInRepository,
  IAuthService,
])
void main() {
  late SignInRegisterCredentialAndSecret _signInUseCase;
  late MockISignInRepository _mockSignInRepository;
  late MockIAuthService _mockAuthService;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _mockAuthService = MockIAuthService();
    _signInUseCase = SignInRegisterCredentialAndSecret(
      _mockSignInRepository,
      _mockAuthService,
    );
  });

  final credentialTester = AuthServiceMock.validTestCredential;
  final secretTester = AuthServiceMock.validTestSecret;
  final credentials = Credentials(user: credentialTester, secret: secretTester);

  void _registerAuthenticationRequest() {
    when(_mockSignInRepository.skipNextLocalAuthenticationRequest())
        // ignore: void_checks
        .thenAnswer((_) async => right(unit));
  }

  group('when register with credential and secret', () {
    test('should return success with the given credentials', () async {
      // arrange

      _registerAuthenticationRequest();

      when(_mockAuthService.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      )).thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase.call(credentials);

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthService.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange

      _registerAuthenticationRequest();

      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInRegisterCredentialAndSecretErrorMessages.unavailable(),
      );

      when(_mockAuthService.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      )).thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(credentials);
      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthService.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return that credential is already in use', () async {
      // arrange

      _registerAuthenticationRequest();

      const throwFailure = AuthFailure.credentialAlreadyInUse();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInRegisterCredentialAndSecretErrorMessages
            .credentialAlreadyInUse(),
      );

      when(_mockAuthService.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      )).thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(credentials);

      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthService.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test(
        'when login with success '
        'then should cache a request to skip next local authentication request',
        () async {
      // arrange

      _registerAuthenticationRequest();

      when(_mockAuthService.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      )).thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase.call(credentials);

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthService.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      ));

      verify(_mockSignInRepository.skipNextLocalAuthenticationRequest())
          .called(1);
    });
  });
}
