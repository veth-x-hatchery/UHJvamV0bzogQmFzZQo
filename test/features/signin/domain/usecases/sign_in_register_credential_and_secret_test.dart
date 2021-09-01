import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
// import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_credential_and_secret.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';
import 'package:vethx_beta/l10n/l10n.dart';

import 'sign_in_check_credential_test.mocks.dart';

@GenerateMocks([
  // ISignInRepository,
  IAuthFacade,
])
void main() {
  late SignInRegisterCredentialAndSecret _signInUseCase;
  // late MockISignInRepository _mockSignInRepository;
  late MockIAuthFacade _mockAuthFacade;

  setUp(() {
    // _mockSignInRepository = MockISignInRepository();
    _mockAuthFacade = MockIAuthFacade();
    _signInUseCase = SignInRegisterCredentialAndSecret(
      // _mockSignInRepository,
      _mockAuthFacade,
    );
  });

  final credentialTester = AuthFacadeMock.validTestCredential;
  final secretTester = AuthFacadeMock.validTestSecret;
  final credentials = Credentials(user: credentialTester, secret: secretTester);

  group('when register with credential and secret', () {
    test('should return success with the given credentials', () async {
      // arrange

      when(_mockAuthFacade.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      )).thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase.call(credentials);

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthFacade.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange
      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInRegisterCredentialAndSecretErrorMessages.unavailable()
            .translate(null)!,
      );

      when(_mockAuthFacade.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      )).thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(credentials);
      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return that credential is already in use', () async {
      // arrange
      const throwFailure = AuthFailure.credentialAlreadyInUse();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInRegisterCredentialAndSecretErrorMessages
                .credentialAlreadyInUse()
            .translate(null)!,
      );

      when(_mockAuthFacade.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      )).thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(credentials);
      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.registerWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });
  });
}
