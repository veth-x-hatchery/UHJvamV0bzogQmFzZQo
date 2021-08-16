import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_email.dart';
import 'package:vethx_beta/features/signin/infrastructure/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/presentation/utils/custom_validators.dart';

import 'sign_in_check_email_test.mocks.dart';

@GenerateMocks([
  ISignInRepository,
  IAuthFacade,
])
void main() {
  late SignInCheckIfEmailIsInUse _signInCheckIfEmailIsInUse;

  late MockISignInRepository _mockSignInRepository;
  late MockIAuthFacade _mockAuthFacade;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _mockAuthFacade = MockIAuthFacade();

    _signInCheckIfEmailIsInUse = SignInCheckIfEmailIsInUse(
      _mockSignInRepository,
      _mockAuthFacade,
    );
  });

  group('sign in check user email is already registered', () {
    final email = EmailAddress('test@vethx.com');

    test('should return user is registered', () async {
      // arrange

      when(_mockAuthFacade.emailIsAlreadyInUse(email))
          .thenAnswer((_) async => const Right(true));

      // act

      final result =
          await _signInCheckIfEmailIsInUse.call(Params(email: email));

      // assert

      expect(result, const Right(true));

      verify(_mockAuthFacade.emailIsAlreadyInUse(email));

      verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange
      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failedValue: throwFailure,
        message: CheckEmailErrorMessages.UnknowError,
      );

      when(_mockAuthFacade.emailIsAlreadyInUse(email))
          .thenAnswer((_) async => const Left(throwFailure));

      // act

      final result =
          await _signInCheckIfEmailIsInUse.call(Params(email: email));

      // assert

      expect(result, left(failureDetails));

      verify(_mockAuthFacade.emailIsAlreadyInUse(email));

      verifyNoMoreInteractions(_mockSignInRepository);
    });
  });
}
