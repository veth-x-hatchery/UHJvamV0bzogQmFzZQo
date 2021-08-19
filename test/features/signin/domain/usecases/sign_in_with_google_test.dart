import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';

import 'sign_in_with_email_and_password_test.mocks.dart';

void main() {
  late SignInWithGoogle _signInUseCase;
  // late MockISignInRepository _mockSignInRepository;
  late MockIAuthFacade _mockAuthFacade;

  setUp(() {
    // _mockSignInRepository = MockISignInRepository();
    _mockAuthFacade = MockIAuthFacade();

    _signInUseCase = SignInWithGoogle(
      // _mockSignInRepository,
      _mockAuthFacade,
    );
  });

  group('when sign in with google', () {
    test('should return success with google sign in', () async {
      // arrange

      when(_mockAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase.call(NoParams());

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthFacade.signInWithGoogle());

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return cancelled by user failure', () async {
      // arrange
      const throwFailure = AuthFailure.cancelledByUser();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithGoogleErrorMessages.cancelledByUser,
      );

      when(_mockAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(NoParams());

      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.signInWithGoogle());

      // verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange
      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithGoogleErrorMessages.unknowError,
      );

      when(_mockAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => const Left(throwFailure));

      // act

      final result = await _signInUseCase.call(NoParams());

      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.signInWithGoogle());

      // verifyNoMoreInteractions(_mockSignInRepository);
    });
  });
}
