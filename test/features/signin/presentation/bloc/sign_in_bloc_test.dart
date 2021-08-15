import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/features/signin/data/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_email.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/utils/custom_validators.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_page.dart';

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
      _mockSignInCheckIfEmailIsInUse,
      _mockSignInWithEmailAndPassword,
      _mockSignInWithGoogle,
    );
  });

  test('initialState should be SignInInitial', () {
    // assert
    expect(_bloc.state, equals(SignInInitial()));
  });

  group('when sign in check user email', () {
    const testEmail = 'test@vethx.com';

    Future<void> _assertSignInStatesAndNativation(bool isEmailAlreadyRegistered,
        SignInPageGoTo signInPageGoTo, List<SignInState> statesExpected,
        {bool goToExpected = true}) async {
      // arrange

      when(_mockSignInCheckIfEmailIsInUse.call(any))
          .thenAnswer((_) async => Right(isEmailAlreadyRegistered));

      // act
      _bloc.add(SignInCheckEmail(
        fromPage: signInPageGoTo.from,
        email: testEmail,
      ));

      // assert later

      _bloc.goTo.listen(
        (goTo) => goToExpected
            ? expectLater(goTo, equals(signInPageGoTo))
            : expectLater(goTo, null),
      );

      // Todo(v): discover
      // else {
      //   verifyNever(() => _bloc.goToPage);
      // }

      await expectLater(_bloc.stream, emitsInOrder(statesExpected));
    }

    group('comming from page [SignInPageRoutes.emailEntry]', () {
      test(
        'should emit [SignInLoading, EmailNotFound] and go to page [SignInPageRoutes.registerEmailSignIn]',
        () async {
          // arrange
          const isEmailAlreadyRegistered = false;
          const fromPage = SignInPageRoutes.emailEntry;
          const toPage = SignInPageRoutes.registerEmailSignIn;
          const signInPageGoTo = SignInPageGoTo(from: fromPage, to: toPage);

          final statesExpected = [
            SignInLoading(),
            EmailNotFound(),
          ];

          await _assertSignInStatesAndNativation(
            isEmailAlreadyRegistered,
            signInPageGoTo,
            statesExpected,
          );
        },
      );

      test(
        'should emit [SignInLoading, EmailAlreadyRegistered] and go to page [SignInPageRoutes.passwordEntry]',
        () async {
          // arrange
          const isEmailAlreadyRegistered = true;
          const fromPage = SignInPageRoutes.emailEntry;
          const toPage = SignInPageRoutes.passwordEntry;
          const signInPageGoTo = SignInPageGoTo(from: fromPage, to: toPage);

          final statesExpected = [
            SignInLoading(),
            EmailAlreadyRegistered(),
          ];

          await _assertSignInStatesAndNativation(
            isEmailAlreadyRegistered,
            signInPageGoTo,
            statesExpected,
          );
        },
      );
    });

    group('comming from page [SignInPageRoutes.registerEmailSignIn]', () {
      test(
        'should just emit [SignInLoading, EmailAlreadyRegistered]',
        () async {
          // arrange
          const isEmailAlreadyRegistered = true;
          const fromPage = SignInPageRoutes.registerEmailSignIn;
          const toPage = SignInPageRoutes.passwordEntry;
          const signInPageGoTo = SignInPageGoTo(from: fromPage, to: toPage);

          final statesExpected = [
            SignInLoading(),
            EmailAlreadyRegistered(),
          ];

          await _assertSignInStatesAndNativation(
            isEmailAlreadyRegistered,
            signInPageGoTo,
            statesExpected,
            goToExpected: false,
          );
        },
      );

      test(
        'should just emit [SignInLoading, EmailNotFound]',
        () async {
          // arrange
          const isEmailAlreadyRegistered = false;
          const fromPage = SignInPageRoutes.registerEmailSignIn;
          const toPage = SignInPageRoutes.passwordEntry;
          const signInPageGoTo = SignInPageGoTo(from: fromPage, to: toPage);

          final statesExpected = [
            SignInLoading(),
            EmailNotFound(),
          ];

          await _assertSignInStatesAndNativation(
            isEmailAlreadyRegistered,
            signInPageGoTo,
            statesExpected,
            goToExpected: false,
          );
        },
      );
    });

    test(
      'should emit [SignInError(message: InvalidEmailFailure.invalidEmail)] when email is invalid',
      () async {
        // arrange
        const errorMessage = InvalidEmailFailure.invalidEmail;

        when(_mockSignInCheckIfEmailIsInUse.call(any))
            .thenAnswer((_) async => Left(InvalidEmailFailure(
                  message: errorMessage,
                )));

        // act
        _bloc.add(SignInCheckEmail(
          email: testEmail,
          fromPage: SignInPageRoutes.emailEntry,
        ));

        // assert later

        final expected = [
          SignInLoading(),
          SignInError(message: errorMessage),
        ];

        await expectLater(_bloc.stream, emitsInOrder(expected));
      },
    );

    test(
      'should emit [SignInError(message: InvalidEmailFailure.invalidEmptyEmail)] when email is not given',
      () async {
        // arrange
        const errorMessage = InvalidEmailFailure.invalidEmptyEmail;

        when(_mockSignInCheckIfEmailIsInUse.call(any))
            .thenAnswer((_) async => Left(InvalidEmailFailure(
                  message: errorMessage,
                )));

        // act
        _bloc.add(SignInCheckEmail(
          email: '',
          fromPage: SignInPageRoutes.emailEntry,
        ));

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
        _bloc.add(SignInCheckEmail(
          email: testEmail,
          fromPage: SignInPageRoutes.emailEntry,
        ));

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
