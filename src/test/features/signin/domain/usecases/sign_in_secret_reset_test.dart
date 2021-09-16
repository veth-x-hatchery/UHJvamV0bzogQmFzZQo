import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatchery/core/error/failures.dart';
import 'package:hatchery/core/shared_kernel/shared_kernel.dart';
import 'package:hatchery/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:hatchery/features/signin/domain/services/auth_failure.dart';
import 'package:hatchery/features/signin/domain/services/i_auth.service.dart';
import 'package:hatchery/features/signin/domain/usecases/sign_in_secret_reset.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_auth.service.mock.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_secret_reset_test.mocks.dart';

@GenerateMocks([
  ISignInRepository,
  IAuthService,
])
void main() {
  late SignInSecretReset _signInUseCase;
  late MockISignInRepository _mockSignInRepository;
  late MockIAuthService _mockAuthService;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _mockAuthService = MockIAuthService();
    _signInUseCase = SignInSecretReset(
      _mockSignInRepository,
      _mockAuthService,
    );
  });

  final credential = AuthServiceMock.validTestCredential;

  void _registerAuthenticationRequest() {
    when(_mockSignInRepository.skipNextLocalAuthenticationRequest())
        // ignore: void_checks
        .thenAnswer((_) async => right(unit));
  }

  group('when request password reset', () {
    test('should return success', () async {
      // arrange

      _registerAuthenticationRequest();

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => Right(credential));

      when(_mockAuthService.passwordReset(credential))
          .thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase.call(const NoParams());

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthService.passwordReset(credential));
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

      when(_mockAuthService.passwordReset(credential))
          .thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(const NoParams());
      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthService.passwordReset(credential));

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

      verifyNever(_mockAuthService.passwordReset(credential));
    });

    test(
        'when login with success '
        'then should cache a request to skip next local authentication request',
        () async {
      // arrange

      _registerAuthenticationRequest();

      when(_mockSignInRepository.cachedCredential())
          .thenAnswer((_) async => Right(credential));

      when(_mockAuthService.passwordReset(credential))
          .thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase.call(const NoParams());

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthService.passwordReset(credential));

      verify(_mockSignInRepository.skipNextLocalAuthenticationRequest())
          .called(1);
    });
  });
}
