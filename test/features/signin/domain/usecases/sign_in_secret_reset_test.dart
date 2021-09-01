import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_secret_reset.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';

import 'sign_in_secret_reset_test.mocks.dart';

@GenerateMocks([
  ISignInRepository,
  IAuthFacade,
])
void main() {
  late SignInSecretReset _signInUseCase;
  late MockISignInRepository _mockSignInRepository;
  late MockIAuthFacade _mockAuthFacade;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _mockAuthFacade = MockIAuthFacade();
    _signInUseCase = SignInSecretReset(
      _mockSignInRepository,
      _mockAuthFacade,
    );
  });

  final credential = AuthFacadeMock.validTestCredential;

  group('when request password reset', () {
    test('should return success', () async {
      // arrange

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => Right(credential));

      when(_mockAuthFacade.passwordReset(credential))
          .thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase.call(const NoParams());

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthFacade.passwordReset(credential));
    });

    test('should return a server failure', () async {
      // arrange
      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInSecretResetMessages.unavailable(),
      );

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => Right(credential));

      when(_mockAuthFacade.passwordReset(credential))
          .thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(const NoParams());
      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.passwordReset(credential));

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return invalid cached credential', () async {
      // arrange
      const throwFailure = AuthFailure.invalidCachedCredential();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInSecretResetMessages.invalidCachedCredential(),
      );

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => const Left(Failure.cacheFailure()));

      // act

      final result = await _signInUseCase.call(const NoParams());

      // assert

      expect(result, left(failureDetails));

      verifyNever(_mockAuthFacade.passwordReset(credential));
    });
  });
}
