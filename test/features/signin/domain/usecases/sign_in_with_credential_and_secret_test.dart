import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
// import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_credential_and_secret.dart';

import 'sign_in_check_credential_test.mocks.dart';

@GenerateMocks([
  // ISignInRepository,
  IAuthFacade,
])
void main() {
  late SignInWithCredentialAndSecret _signInUseCase;
  // late MockISignInRepository _mockSignInRepository;
  late MockIAuthFacade _mockAuthFacade;

  setUp(() {
    // _mockSignInRepository = MockISignInRepository();
    _mockAuthFacade = MockIAuthFacade();
    _signInUseCase = SignInWithCredentialAndSecret(
      // _mockSignInRepository,
      _mockAuthFacade,
    );
  });

  final credentialTester = CredentialAddress('test@vethx.com');
  final secretTester = Secret('dGVzdEB2ZXRoeC5jb20K');
  final credentials = Credentials(user: credentialTester, secret: secretTester);

  group('then sign in with credential and secret', () {
    test('should return success with the given credentials', () async {
      // arrange

      when(_mockAuthFacade.signInWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      )).thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase.call(
        Params(credentials: credentials),
      );

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthFacade.signInWithCredentialAndSecret(
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
        message: SignInWithCredentialAndSecretErrorMessages.unavailable,
      );

      when(_mockAuthFacade.signInWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      )).thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(
        Params(credentials: credentials),
      );
      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.signInWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return invalid credential and secret combination', () async {
      // arrange
      const throwFailure = AuthFailure.invalidCredentialAndSecretCombination();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithCredentialAndSecretErrorMessages
            .invalidCredentialAndSecretCombination,
      );

      when(_mockAuthFacade.signInWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      )).thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(
        Params(credentials: credentials),
      );
      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.signInWithCredentialAndSecret(
        credentialAddress: credentialTester,
        secret: secretTester,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });
  });
}
