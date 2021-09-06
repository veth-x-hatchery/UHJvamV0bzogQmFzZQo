import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:hatchery/core/shared_kernel/shared_kernel.dart';
import 'package:hatchery/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:hatchery/features/signin/domain/services/auth_failure.dart';
import 'package:hatchery/features/signin/domain/services/i_auth_facade.dart';
import 'package:hatchery/features/signin/domain/usecases/sign_in_with_google.dart';

import 'sign_in_with_google_test.mocks.dart';

@GenerateMocks([
  ISignInRepository,
  IAuthFacade,
])
void main() {
  late SignInWithGoogle _signInUseCase;
  late MockISignInRepository _mockSignInRepository;
  late MockIAuthFacade _mockAuthFacade;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _mockAuthFacade = MockIAuthFacade();

    _signInUseCase = SignInWithGoogle(
      _mockAuthFacade,
      _mockSignInRepository,
    );
  });

  void _registerAuthenticationRequest() {
    when(_mockSignInRepository.skipNextLocalAuthenticationRequest())
        // ignore: void_checks
        .thenAnswer((_) async => right(unit));
  }

  group('when sign in with google', () {
    test('should return success with google sign in', () async {
      // arrange

      _registerAuthenticationRequest();

      when(_mockAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase(const NoParams());

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthFacade.signInWithGoogle());

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return cancelled by user failure', () async {
      // arrange

      _registerAuthenticationRequest();

      const throwFailure = AuthFailure.cancelledByUser();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithGoogleErrorMessages.cancelledByUser(),
      );

      when(_mockAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase(const NoParams());

      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.signInWithGoogle());

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange

      _registerAuthenticationRequest();

      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithGoogleErrorMessages.unknowError(),
      );

      when(_mockAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase(const NoParams());

      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.signInWithGoogle());
    });

    test(
        'when login with success '
        'then should cache a request to skip next local authentication request',
        () async {
      // arrange

      _registerAuthenticationRequest();

      when(_mockAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase(const NoParams());

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthFacade.signInWithGoogle());

      verify(_mockSignInRepository.skipNextLocalAuthenticationRequest())
          .called(1);
    });
  });
}
