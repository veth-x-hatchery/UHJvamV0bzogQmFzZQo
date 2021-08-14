import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/features/signin/data/repositories/sign_in_repository.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_check_email.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_login/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:vethx_login/features/signin/presentation/utils/custom_validators.dart';

import 'sign_in_bloc_test.mocks.dart';

@GenerateMocks([
  SignInCheckIfEmailIsInUse,
  SignInWithEmailAndPassword,
  SignInWithGoogle,
])
void main() {
  late SignInBloc _bloc;

  late MockSignInWithEmailAndPassword _mockSignInWithEmailAndPassword;
  late MockSignInWithGoogle _mockSignInWithGoogle;
  late MockSignInCheckIfEmailIsInUse _mockSignInCheckIfEmailIsInUse;

  setUp(() {
    _mockSignInWithEmailAndPassword = MockSignInWithEmailAndPassword();
    _mockSignInWithGoogle = MockSignInWithGoogle();
    _mockSignInCheckIfEmailIsInUse = MockSignInCheckIfEmailIsInUse();
    _bloc = SignInBloc(
      signInCheckIfEmailIsInUse: _mockSignInCheckIfEmailIsInUse,
      signInWithEmailAndPassword: _mockSignInWithEmailAndPassword,
      signInWithGoogle: _mockSignInWithGoogle,
    );
  });

  test('initialState should be SignInInitial', () {
    // assert
    expect(_bloc.state, equals(SignInInitial()));
  });

  group('when sign in check user email', () {
    const testEmail = 'test@vethx.com';

    test(
      'should emit [SignInLoading, EmailNotFound]',
      () async {
        // arrange
        const isEmailAlreadyRegistered = false;

        when(_mockSignInCheckIfEmailIsInUse.call(any))
            .thenAnswer((_) async => Right(isEmailAlreadyRegistered));

        // act
        _bloc.add(SignInCheckEmail(email: testEmail));

        // assert later

        final expected = [
          SignInLoading(),
          EmailNotFound(),
        ];

        await expectLater(_bloc.stream, emitsInOrder(expected));
      },
    );

    test(
      'should emit [SignInLoading, EmailAlreadyRegistered]',
      () async {
        // arrange
        const isEmailAlreadyRegistered = true;

        when(_mockSignInCheckIfEmailIsInUse.call(any))
            .thenAnswer((_) async => Right(isEmailAlreadyRegistered));

        // act
        _bloc.add(SignInCheckEmail(email: testEmail));

        // assert later

        final expected = [
          SignInLoading(),
          EmailAlreadyRegistered(),
        ];

        await expectLater(_bloc.stream, emitsInOrder(expected));
      },
    );

    test(
      'should emit [SignInError(message: CustomValidatorsMessages.invalidEmail)] when email is invalid',
      () async {
        // arrange
        const errorMessage = CustomValidatorsMessages.invalidEmail;

        when(_mockSignInCheckIfEmailIsInUse.call(any))
            .thenAnswer((_) async => Left(InvalidEmailFailure(
                  message: errorMessage,
                )));

        // act
        _bloc.add(SignInCheckEmail(email: testEmail));

        // assert later

        final expected = [
          SignInLoading(),
          SignInError(message: errorMessage),
        ];

        await expectLater(_bloc.stream, emitsInOrder(expected));
      },
    );

    test(
      'should emit [SignInError(message: CustomValidatorsMessages.invalidEmptyEmail)] when email is not given',
      () async {
        // arrange
        const errorMessage = CustomValidatorsMessages.invalidEmptyEmail;

        when(_mockSignInCheckIfEmailIsInUse.call(any))
            .thenAnswer((_) async => Left(InvalidEmailFailure(
                  message: errorMessage,
                )));

        // act
        _bloc.add(SignInCheckEmail(email: ''));

        // assert later

        final expected = [
          SignInLoading(),
          SignInError(message: errorMessage),
        ];

        await expectLater(_bloc.stream, emitsInOrder(expected));
      },
    );

    test(
      'should emit [SignInError(message: [UseCasesDefaultMessages.error])] when email check fail',
      () async {
        // arrange
        const errorMessage = UseCasesDefaultMessages.error;

        when(_mockSignInCheckIfEmailIsInUse.call(any)).thenAnswer(
            (_) async => Left(ServerFailure(message: errorMessage)));

        // act
        _bloc.add(SignInCheckEmail(email: testEmail));

        // assert later

        final expected = [
          SignInLoading(),
          SignInError(message: errorMessage),
        ];

        await expectLater(_bloc.stream, emitsInOrder(expected));
      },
    );
  });
}
