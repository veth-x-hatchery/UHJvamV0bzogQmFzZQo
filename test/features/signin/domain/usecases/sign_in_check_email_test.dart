import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/error/failures.dart';
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

  // group('custom validations', () {
  //   final email = EmailAddress('test@vethx.com');
  //   test(
  //     'should call the CustomValidators to return a valid email',
  //     () async {
  //       // arrange

  //       // _setUpEmailAnalysis(email: email, isValid: true);

  //       when(_mockAuthFacade.emailIsAlreadyInUse(email))
  //           .thenAnswer((_) async => const Right(true));

  //       // act

  //       await _signInCheckIfEmailIsInUse.call(Params(email: email));

  //       await untilCalled(_mockCustomValidators.emailAnalysis(any));

  //       // assert

  //       verify(_mockCustomValidators.emailAnalysis(any));
  //     },
  //   );

  //   test(
  //     'should emit [InvalidEmailFailure(message: InvalidEmailFailure.invalidEmail)] when the input is invalid',
  //     () async {
  //       // arrange
  //       const expectedFailure =
  //           InvalidEmailFailure(message: InvalidEmailFailure.invalidEmail);

  //       // _setUpEmailAnalysis(
  //         email: email,
  //         isValid: false,
  //         expectedFailure: expectedFailure,
  //       );

  //       final result =
  //           await _signInCheckIfEmailIsInUse.call(Params(email: email));

  //       await untilCalled(_mockCustomValidators.emailAnalysis(any));

  //       expect(result, const Left(expectedFailure));

  //       result.fold(
  //         (l) => expect(l.message, expectedFailure.message),
  //         (r) => null,
  //       );
  //     },
  //   );

  //   test(
  //     'should emit [InvalidEmailFailure(message: InvalidEmailFailure.invalidEmptyEmail)] when the input is not given',
  //     () async {
  //       // arrange
  //       const expectedFailure =
  //           InvalidEmailFailure(message: InvalidEmailFailure.invalidEmptyEmail);

  //       // _setUpEmailAnalysis(
  //         email: email,
  //         isValid: false,
  //         expectedFailure: expectedFailure,
  //       );

  //       final result =
  //           await _signInCheckIfEmailIsInUse.call(Params(email: email));

  //       await untilCalled(_mockCustomValidators.emailAnalysis(any));

  //       expect(result, const Left(expectedFailure));

  //       result.fold(
  //         (l) => expect(l.message, expectedFailure.message),
  //         (r) => null,
  //       );
  //     },
  //   );
  // });

  group('sign in check user email is already registered', () {
    final testEmail = EmailAddress('test@vethx.com');

    test('should return user is registered', () async {
      // arrange

      when(_mockAuthFacade.emailIsAlreadyInUse(testEmail))
          .thenAnswer((_) async => const Right(true));

      // act

      final result =
          await _signInCheckIfEmailIsInUse.call(Params(email: testEmail));

      // assert

      expect(result, const Right(true));

      verify(_mockAuthFacade.emailIsAlreadyInUse(testEmail));

      verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange

      const expectedFailure = AuthFailure.serverError();

      when(_mockAuthFacade.emailIsAlreadyInUse(testEmail))
          .thenAnswer((_) async => const Left(expectedFailure));

      // act

      final result =
          await _signInCheckIfEmailIsInUse.call(Params(email: testEmail));

      // assert

      expect(result, const Left(expectedFailure));

      verify(_mockAuthFacade.emailIsAlreadyInUse(testEmail));

      verifyNoMoreInteractions(_mockSignInRepository);
    });
  });
}
