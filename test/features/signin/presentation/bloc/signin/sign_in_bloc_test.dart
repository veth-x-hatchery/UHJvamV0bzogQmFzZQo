import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_email.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_email_and_password.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_page.dart';

import 'sign_in_bloc_test.mocks.dart';

@GenerateMocks([
  AuthBloc,
  SignInCheckIfEmailIsInUse,
  SignInRegisterEmailAndPassword,
  SignInWithEmailAndPassword,
  SignInWithGoogle,
])
void main() {
  late SignInBloc _bloc;

  late MockAuthBloc _authBloc;
  late MockSignInWithEmailAndPassword _mockSignInWithEmailAndPassword;
  late MockSignInWithGoogle _mockSignInWithGoogle;
  late MockSignInCheckIfEmailIsInUse _mockSignInCheckIfEmailIsInUse;
  late MockSignInRegisterEmailAndPassword _mockSignInRegisterEmailAndPassword;

  setUp(() {
    _mockSignInCheckIfEmailIsInUse = MockSignInCheckIfEmailIsInUse();
    _mockSignInWithEmailAndPassword = MockSignInWithEmailAndPassword();
    _mockSignInWithGoogle = MockSignInWithGoogle();
    _mockSignInRegisterEmailAndPassword = MockSignInRegisterEmailAndPassword();
    _authBloc = MockAuthBloc();

    _bloc = SignInBloc(
      _mockSignInCheckIfEmailIsInUse,
      _mockSignInWithEmailAndPassword,
      _mockSignInWithGoogle,
      _mockSignInRegisterEmailAndPassword,
      _authBloc,
    );
  });

  test('initialState should be SignInInitial', () {
    // assert
    expect(_bloc.state, equals(const SignInState.initial()));
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
      _bloc.add(SignInEvent.checkEmailEvent(
        fromPage: signInPageGoTo.from,
        email: email,
      ));

      // assert later

      _bloc.goTo.listen(
        (goTo) => goToExpected
            ? expectLater(goTo, equals(signInPageGoTo))
            : expectLater(goTo, null),
      );

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
            const SignInState.loading(),
            const SignInState.emailNotFound(),
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
            const SignInState.loading(),
            const SignInState.emailAlreadyRegistered(),
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
        'should emit [SignInState.signInNotification(message: [CheckEmailErrorMessages.unavailable])] when email check fail',
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
          _bloc.add(SignInEvent.checkEmailEvent(
            email: testEmail,
            fromPage: SignInPageRoutes.emailEntry,
          ));

          // assert later

          final expected = [
            const SignInState.loading(),
            SignInState.signInNotification(message: failureDetails.message),
          ];

          await expectLater(_bloc.stream, emitsInOrder(expected));
        },
      );
    });
  });

  group('when register with email and password', () {
    final email = EmailAddress('test@vethx.com');
    final password = Password('Nsd@#7DASBd(nasd=ASD*&@#');

    test('should return email already in use', () async {
      // arrange
      const throwFailure = AuthFailure.emailAlreadyInUse();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInRegisterEmailAndPasswordErrorMessages.emailAlreadyInUse,
      );

      when(_mockSignInRegisterEmailAndPassword.call(any))
          .thenAnswer((_) async => Left(failureDetails));

      // act
      _bloc.add(SignInEvent.emailRegisterEvent(
        email: email,
        password: password,
      ));

      // assert later

      final expected = [
        const SignInState.loading(),
        SignInState.signInNotification(message: failureDetails.message),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });

    test('should return unavailable notification', () async {
      // arrange
      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInRegisterEmailAndPasswordErrorMessages.unavailable,
      );

      when(_mockSignInRegisterEmailAndPassword.call(any))
          .thenAnswer((_) async => Left(failureDetails));

      // act
      _bloc.add(SignInEvent.emailRegisterEvent(
        email: email,
        password: password,
      ));

      // assert later

      final expected = [
        const SignInState.loading(),
        SignInState.signInNotification(message: failureDetails.message),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });

    test('should emit [SignInAllowed]', () async {
      // arrange

      when(_mockSignInRegisterEmailAndPassword.call(any))
          .thenAnswer((_) async => const Right(unit));

      // act
      _bloc.add(SignInEvent.emailRegisterEvent(
        email: email,
        password: password,
      ));

      // assert later

      final expected = [
        const SignInState.loading(),
        const SignInState.signInAllowed(),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });
  });

  group('when logging with email and password', () {
    final email = EmailAddress('test@vethx.com');
    final password = Password('Nsd@#7DASBd(nasd=ASD*&@#');

    test('should return invalid email and password combination', () async {
      // arrange
      const throwFailure = AuthFailure.invalidEmailAndPasswordCombination();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithEmailAndPasswordErrorMessages
            .invalidEmailAndPasswordCombination,
      );

      when(_mockSignInWithEmailAndPassword.call(any))
          .thenAnswer((_) async => Left(failureDetails));

      // act
      _bloc.add(SignInEvent.signInWithEmailEvent(
        email: email,
        password: password,
      ));

      // assert later

      final expected = [
        const SignInState.loading(),
        SignInState.signInNotification(message: failureDetails.message),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });

    test('should return unavailable notification', () async {
      // arrange
      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithEmailAndPasswordErrorMessages.unavailable,
      );

      when(_mockSignInWithEmailAndPassword.call(any))
          .thenAnswer((_) async => Left(failureDetails));

      // act
      _bloc.add(SignInEvent.signInWithEmailEvent(
        email: email,
        password: password,
      ));

      // assert later

      final expected = [
        const SignInState.loading(),
        SignInState.signInNotification(message: failureDetails.message),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });

    test('should emit [SignInAllowed]', () async {
      // arrange

      when(_mockSignInWithEmailAndPassword.call(any))
          .thenAnswer((_) async => const Right(unit));

      // act
      _bloc.add(SignInEvent.signInWithEmailEvent(
        email: email,
        password: password,
      ));

      // assert later

      final expected = [
        const SignInState.loading(),
        const SignInState.signInAllowed(),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });
  });

  group('when sign in with google', () {
    test(
        'should return cancelled by user and go back to sign in options page normaly',
        () async {
      // arrange
      const throwFailure = AuthFailure.cancelledByUser();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithGoogleErrorMessages.cancelledByUser,
      );

      when(_mockSignInWithGoogle.call(any))
          .thenAnswer((_) async => Left(failureDetails));

      // act
      _bloc.add(const SignInEvent.signInWithGoogleEvent());

      // assert later

      final expected = [
        const SignInState.loading(),
        const SignInState.signInCancelled(),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });

    test('should return unavailable notification', () async {
      // arrange
      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithGoogleErrorMessages.unknowError,
      );

      when(_mockSignInWithGoogle.call(any))
          .thenAnswer((_) async => Left(failureDetails));

      // act
      _bloc.add(const SignInEvent.signInWithGoogleEvent());

      // assert later

      final expected = [
        const SignInState.loading(),
        SignInState.signInNotification(message: failureDetails.message),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });

    test('should sign in with success', () async {
      // arrange

      when(_mockSignInWithGoogle.call(any))
          .thenAnswer((_) async => const Right(unit));

      // act
      _bloc.add(const SignInEvent.signInWithGoogleEvent());

      // assert later

      final expected = [
        const SignInState.loading(),
        const SignInState.signInAllowed(),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });
  });

  group('when auth changes accours', () {
    test('should notify Auth BLoC when sign in is allowed', () async {
      // arrange

      when(_mockSignInWithGoogle.call(any))
          .thenAnswer((_) async => const Right(unit));

      // act
      _bloc.add(const SignInEvent.signInWithGoogleEvent());

      // assert later

      final expected = [
        const SignInState.loading(),
        const SignInState.signInAllowed(),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected)).then((_) {
        verify(_authBloc.add(const AuthEvent.authCheckRequested())).called(1);
      });
    });
  });
}
