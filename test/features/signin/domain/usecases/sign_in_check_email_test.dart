import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_email.dart';
import 'package:vethx_beta/features/signin/infrastructure/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/presentation/utils/custom_validators.dart';

import 'sign_in_check_email_test.mocks.dart';

@GenerateMocks([
  ISignInRepository,
  CustomValidators,
  IAuthFacade,
])
void main() {
  late SignInCheckIfEmailIsInUse _signInCheckIfEmailIsInUse;

  late MockCustomValidators _mockCustomValidators;
  late MockISignInRepository _mockSignInRepository;
  late MockIAuthFacade _mockAuthFacade;

  setUp(() {
    _mockCustomValidators = MockCustomValidators();
    _mockSignInRepository = MockISignInRepository();
    _mockAuthFacade = MockIAuthFacade();

    _signInCheckIfEmailIsInUse = SignInCheckIfEmailIsInUse(
      _mockCustomValidators,
      _mockSignInRepository,
      _mockAuthFacade,
    );
  });

  void _setUpEmailAnalysis({
    required String email,
    required bool isValid,
    InvalidEmailFailure? expectedFailure,
  }) {
    when(_mockCustomValidators.emailAnalysis(any)).thenReturn(
      isValid
          ? Right(email)
          : Left(expectedFailure ??
              const InvalidEmailFailure(
                message: InvalidEmailFailure.invalidEmail,
              )),
    );
  }

  group('custom validations', () {
    const String email = 'user@domain.com';

    test(
      'should call the CustomValidators to return a valid email',
      () async {
        // arrange

        _setUpEmailAnalysis(email: email, isValid: true);

        when(_mockSignInRepository.emailAlreadyRegistered(email))
            .thenAnswer((_) async => const Right(true));

        // act

        await _signInCheckIfEmailIsInUse.call(const Params(email: email));

        await untilCalled(_mockCustomValidators.emailAnalysis(any));

        // assert

        verify(_mockCustomValidators.emailAnalysis(any));
      },
    );

    test(
      'should emit [InvalidEmailFailure(message: InvalidEmailFailure.invalidEmail)] when the input is invalid',
      () async {
        // arrange
        const expectedFailure =
            InvalidEmailFailure(message: InvalidEmailFailure.invalidEmail);

        _setUpEmailAnalysis(
          email: 'asdf@',
          isValid: false,
          expectedFailure: expectedFailure,
        );

        final result =
            await _signInCheckIfEmailIsInUse.call(const Params(email: email));

        await untilCalled(_mockCustomValidators.emailAnalysis(any));

        expect(result, const Left(expectedFailure));

        result.fold(
          (l) => expect(l.message, expectedFailure.message),
          (r) => null,
        );
      },
    );

    test(
      'should emit [InvalidEmailFailure(message: InvalidEmailFailure.invalidEmptyEmail)] when the input is not given',
      () async {
        // arrange
        const expectedFailure =
            InvalidEmailFailure(message: InvalidEmailFailure.invalidEmptyEmail);

        _setUpEmailAnalysis(
          email: '',
          isValid: false,
          expectedFailure: expectedFailure,
        );

        final result =
            await _signInCheckIfEmailIsInUse.call(const Params(email: email));

        await untilCalled(_mockCustomValidators.emailAnalysis(any));

        expect(result, const Left(expectedFailure));

        result.fold(
          (l) => expect(l.message, expectedFailure.message),
          (r) => null,
        );
      },
    );
  });

  group('sign in check user email is already registered', () {
    const testEmail = 'test@vethx.com';

    test('should return user is registered', () async {
      // arrange

      _setUpEmailAnalysis(email: testEmail, isValid: true);

      when(_mockSignInRepository.emailAlreadyRegistered(testEmail))
          .thenAnswer((_) async => const Right(true));

      // act

      final result =
          await _signInCheckIfEmailIsInUse.call(const Params(email: testEmail));

      // assert

      expect(result, const Right(true));

      verify(_mockSignInRepository.emailAlreadyRegistered(testEmail));

      verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange

      _setUpEmailAnalysis(email: testEmail, isValid: true);

      when(_mockSignInRepository.emailAlreadyRegistered(testEmail)).thenAnswer(
          (_) async => const Left(
              ServerFailure(message: SignInRepositoryDefaultMessages.error)));

      // act

      final result =
          await _signInCheckIfEmailIsInUse.call(const Params(email: testEmail));

      // assert

      expect(
          result,
          const Left(
              ServerFailure(message: SignInRepositoryDefaultMessages.error)));

      verify(_mockSignInRepository.emailAlreadyRegistered(testEmail));

      verifyNoMoreInteractions(_mockSignInRepository);
    });
  });
}
