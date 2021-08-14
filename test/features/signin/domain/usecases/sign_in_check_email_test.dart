import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_check_email.dart';
import 'package:vethx_login/features/signin/presentation/utils/custom_validators.dart';

import 'sign_in_check_email_test.mocks.dart';

@GenerateMocks([
  ISignInRepository,
  CustomValidators,
])
void main() {
  late SignInCheckIfEmailIsInUse _signInCheckIfEmailIsInUse;

  late MockCustomValidators _mockCustomValidators;
  late MockISignInRepository _mockSignInRepository;

  setUp(() {
    _mockCustomValidators = MockCustomValidators();
    _mockSignInRepository = MockISignInRepository();

    _signInCheckIfEmailIsInUse = SignInCheckIfEmailIsInUse(
      _mockCustomValidators,
      _mockSignInRepository,
    );
  });

  group('custom validations', () {
    const String email = 'user@domain.com';

    test(
      'should call the CustomValidators to return a valid email',
      () async {
        // arrange
        when(_mockCustomValidators.emailAnalysis(any)).thenReturn(
          Right(email),
        );

        when(_mockSignInRepository.emailAlreadyRegistered(email))
            .thenAnswer((_) async => Right(true));

        when(_signInCheckIfEmailIsInUse.call(Params(email: email)))
            .thenAnswer((_) async => Right(true));

        // act

        await untilCalled(_mockCustomValidators.emailAnalysis(any));

        // assert

        verify(_mockCustomValidators.emailAnalysis(any));
      },
    );

    // test(
    //   'should emit [Error] when the input is invalid',
    //   () async {
    //     // arrange

    //     final expectedFailure = InvalidEmailFailure(
    //         message: CustomValidatorsMessages.invalidEmptyEmail);

    //     when(_mockCustomValidators.emailAnalysis(any))
    //         .thenReturn(Left(expectedFailure));

    //     // act
    //     _bloc.add(SignInCheckEmail(email: ''));

    //     // assert later
    //     final expected = [
    //       SignInError(message: expectedFailure.message),
    //     ];

    //     await expectLater(_bloc.stream, emitsInOrder(expected));
    //   },
    // );
  });

  group('sign in check if user is already registered', () {
    const emailTester = 'test@vethx.com';
    test('should return that the user is registered', () async {
      // arrange
      when(_mockSignInRepository.emailAlreadyRegistered(emailTester))
          .thenAnswer((_) async => Right(true));
      // act
      final result =
          await _signInCheckIfEmailIsInUse.call(Params(email: emailTester));
      // assert
      expect(result, Right(true));
      verify(_mockSignInRepository.emailAlreadyRegistered(emailTester));
      verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange
      when(_mockSignInRepository.emailAlreadyRegistered(emailTester))
          .thenAnswer((_) async => Left(ServerFailure()));
      // act
      final result =
          await _signInCheckIfEmailIsInUse.call(Params(email: emailTester));
      // assert
      expect(result, Left(ServerFailure()));
      verify(_mockSignInRepository.emailAlreadyRegistered(emailTester));
      verifyNoMoreInteractions(_mockSignInRepository);
    });
  });
}
