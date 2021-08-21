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
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_credential_and_password.dart';

import 'sign_in_check_credential_test.mocks.dart';

@GenerateMocks([
  // ISignInRepository,
  IAuthFacade,
])
void main() {
  late SignInRegisterCredentialAndPassword _signInUseCase;
  // late MockISignInRepository _mockSignInRepository;
  late MockIAuthFacade _mockAuthFacade;

  setUp(() {
    // _mockSignInRepository = MockISignInRepository();
    _mockAuthFacade = MockIAuthFacade();
    _signInUseCase = SignInRegisterCredentialAndPassword(
      // _mockSignInRepository,
      _mockAuthFacade,
    );
  });

  final credentialTester = CredentialAddress('test@vethx.com');
  final passwordTester = Password('dGVzdEB2ZXRoeC5jb20K');
  final credentials =
      Credentials(user: credentialTester, password: passwordTester);

  group('when register with credential and password', () {
    test('should return success with the given credentials', () async {
      // arrange

      when(_mockAuthFacade.registerWithCredentialAndPassword(
        credentialAddress: credentialTester,
        password: passwordTester,
      )).thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase.call(
        Params(credentials: credentials),
      );

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthFacade.registerWithCredentialAndPassword(
        credentialAddress: credentialTester,
        password: passwordTester,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange
      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInRegisterCredentialAndPasswordErrorMessages.unavailable,
      );

      when(_mockAuthFacade.registerWithCredentialAndPassword(
        credentialAddress: credentialTester,
        password: passwordTester,
      )).thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(
        Params(credentials: credentials),
      );
      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.registerWithCredentialAndPassword(
        credentialAddress: credentialTester,
        password: passwordTester,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return that credential is already in use', () async {
      // arrange
      const throwFailure = AuthFailure.credentialAlreadyInUse();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInRegisterCredentialAndPasswordErrorMessages
            .credentialAlreadyInUse,
      );

      when(_mockAuthFacade.registerWithCredentialAndPassword(
        credentialAddress: credentialTester,
        password: passwordTester,
      )).thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(
        Params(credentials: credentials),
      );
      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.registerWithCredentialAndPassword(
        credentialAddress: credentialTester,
        password: passwordTester,
      ));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });
  });
}
