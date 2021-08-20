import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';

import 'sign_in_bloc_test.mocks.dart';

@GenerateMocks([
  AuthBloc,
  NavigationCubit,
  SignInWithGoogle,
])
void main() {
  late SignInBloc _bloc;

  late MockAuthBloc _authBloc;
  late MockNavigationCubit _mockNavigation;
  late MockSignInWithGoogle _mockSignInWithGoogle;

  setUp(() {
    _authBloc = MockAuthBloc();
    _mockNavigation = MockNavigationCubit();
    _mockSignInWithGoogle = MockSignInWithGoogle();

    _bloc = SignInBloc(
      _authBloc,
      _mockNavigation,
      _mockSignInWithGoogle,
    );
  });

  test('initialState should be SignInInitial', () {
    // assert
    expect(_bloc.state, equals(const SignInState.initial()));
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
