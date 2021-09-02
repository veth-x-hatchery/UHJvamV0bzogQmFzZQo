import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/shared_kernel/shared_kernel.dart';
import 'package:vethx_beta/features/authorization/presentation/bloc/auth_bloc.dart';

import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/options/sign_in_options_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/manager/navigation.manager.dart';

import 'sign_in_options_bloc_test.mocks.dart';

@GenerateMocks([
  AuthBloc,
  NavigationManager,
  SignInWithGoogle,
])
void main() {
  late SignInOptionsBloc _bloc;

  late MockAuthBloc _authBloc;
  late MockNavigationManager _mockNavigation;
  late MockSignInWithGoogle _mockSignInWithGoogle;

  setUp(() {
    _authBloc = MockAuthBloc();
    _mockNavigation = MockNavigationManager();
    _mockSignInWithGoogle = MockSignInWithGoogle();

    _bloc = SignInOptionsBloc(
      _authBloc,
      _mockNavigation,
      _mockSignInWithGoogle,
    );
  });

  test('initialState should be SignInInitial', () {
    // assert
    expect(_bloc.state, equals(const SignInOptionsState.initial()));
  });

  group('when sign in with google', () {
    test(
        'should return cancelled by user and go back to sign in options page normaly',
        () async {
      // arrange
      const throwFailure = AuthFailure.cancelledByUser();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithGoogleErrorMessages.cancelledByUser(),
      );

      when(_mockSignInWithGoogle.call(any))
          .thenAnswer((_) async => Left(failureDetails));

      // act
      _bloc.add(const SignInOptionsEvent.signInWithGoogleEvent());

      // assert later

      final expected = [
        const SignInOptionsState.loading(),
        const SignInOptionsState.signInCancelled(),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });

    test('should return unavailable notification', () async {
      // arrange
      const throwFailure = AuthFailure.serverError();

      final failureDetails = FailureDetails(
        failure: throwFailure,
        message: SignInWithGoogleErrorMessages.unknowError(),
      );

      when(_mockSignInWithGoogle.call(any))
          .thenAnswer((_) async => Left(failureDetails));

      // act
      _bloc.add(const SignInOptionsEvent.signInWithGoogleEvent());

      // assert later

      final expected = [
        const SignInOptionsState.loading(),
        SignInOptionsState.signInNotification(message: failureDetails.message),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });

    test('should sign in with success', () async {
      // arrange

      when(_mockSignInWithGoogle.call(any))
          .thenAnswer((_) async => const Right(unit));

      // act
      _bloc.add(const SignInOptionsEvent.signInWithGoogleEvent());

      // assert later

      final expected = [
        const SignInOptionsState.loading(),
        const SignInOptionsState.signInAllowed(),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });

    test('should notify Auth BLoC when sign in is allowed', () async {
      // arrange

      when(_mockSignInWithGoogle.call(any))
          .thenAnswer((_) async => const Right(unit));

      // act
      _bloc.add(const SignInOptionsEvent.signInWithGoogleEvent());

      // assert later

      final expected = [
        const SignInOptionsState.loading(),
        const SignInOptionsState.signInAllowed(),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected)).then((_) {
        verify(_authBloc.add(const AuthEvent.authCheckRequested())).called(1);
      });
    });
  });

  group('when sign in with credential', () {
    test('should go to credential page', () async {
      // arrange

      when(_mockNavigation.goTo(any)).thenReturn(null);

      // act
      _bloc.add(const SignInOptionsEvent.signInWithCredentialEvent());

      // assert later

      final expected = [
        const SignInOptionsState.initial(),
      ];

      await expectLater(_bloc.stream, emitsInOrder(expected)).then((_) {
        verify(_mockNavigation.goTo(any)).called(1);
      });
    });
  });
}
