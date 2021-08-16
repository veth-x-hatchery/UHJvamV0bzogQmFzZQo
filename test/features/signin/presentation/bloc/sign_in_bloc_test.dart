import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_email.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/sign_in_bloc.dart';
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

  group('when check email', () {
    final testEmail = EmailAddress('test@vethx.com');

    Future<void> _assertSignInStatesAndNativation(
      EmailAddress email,
      bool isEmailAlreadyRegistered,
      SignInPageGoTo signInPageGoTo,
      List<SignInState> statesExpected, {
      bool goToExpected = true,
    }) async {
      // arrange

      when(_mockSignInCheckIfEmailIsInUse.call(any))
          .thenAnswer((_) async => Right(isEmailAlreadyRegistered));

      // act
      _bloc.add(SignInCheckEmail(
        fromPage: signInPageGoTo.from,
        email: email,
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
        'should emit [SignInLoading, EmailNotFound] and go to page [SignInPageRoutes.registerEmailSignIn] passing String email as parameter',
        () async {
          // arrange
          const isEmailAlreadyRegistered = false;
          const fromPage = SignInPageRoutes.emailEntry;
          const toPage = SignInPageRoutes.registerEmailSignIn;

          final signInPageGoTo = SignInPageGoTo(
            from: fromPage,
            to: toPage,
            parameters: testEmail.getOrCrash(),
          );

          final statesExpected = [
            SignInLoading(),
            EmailNotFound(),
          ];

          await _assertSignInStatesAndNativation(
            testEmail,
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

          final signInPageGoTo = SignInPageGoTo(
            from: fromPage,
            to: toPage,
            parameters: testEmail.getOrCrash(),
          );

          final statesExpected = [
            SignInLoading(),
            EmailAlreadyRegistered(),
          ];

          await _assertSignInStatesAndNativation(
            testEmail,
            isEmailAlreadyRegistered,
            signInPageGoTo,
            statesExpected,
          );
        },
      );

      test(
        'should emit [SignInNotification(message: [CheckEmailErrorMessages.unavailable])] when email check fail',
        () async {
          // arrange
          const throwFailure = AuthFailure.serverError();

          final failureDetails = FailureDetails(
            failure: throwFailure,
            message: CheckEmailErrorMessages.unavailable,
          );

          when(_mockSignInCheckIfEmailIsInUse.call(any))
              .thenAnswer((_) async => Left(failureDetails));

          // act
          _bloc.add(SignInCheckEmail(
            email: testEmail,
            fromPage: SignInPageRoutes.emailEntry,
          ));

          // assert later

          final expected = [
            SignInLoading(),
            SignInNotification(message: failureDetails.message),
          ];

          await expectLater(_bloc.stream, emitsInOrder(expected));
        },
      );
    });
  });
}
