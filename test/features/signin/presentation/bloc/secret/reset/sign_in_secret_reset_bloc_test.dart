import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_secret_reset.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';

import 'sign_in_secret_reset_bloc_test.mocks.dart';

@GenerateMocks([
  NavigationCubit,
  SignInSecretReset,
])
void main() {
  late SignInSecretResetBloc _bloc;
  late MockNavigationCubit _mockNavigation;
  late MockSignInSecretReset _mockSignInSecretReset;

  setUp(() {
    _mockSignInSecretReset = MockSignInSecretReset();
    _mockNavigation = MockNavigationCubit();
    _bloc = SignInSecretResetBloc(
      _mockSignInSecretReset,
      _mockNavigation,
    );
  });

  test(
      'when confirmation occour then should emit correct state with success message',
      () async {
    // arrange

    when(_mockSignInSecretReset.call(any))
        .thenAnswer((_) => Future.value(right(unit)));

    // act

    _bloc.add(const SignInPasswordResetEvent.resetPasswordRequest());

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInPasswordResetState(
                notification: optionOf(VethxNotification.snack(
                    message: SignInSecretResetMessages.success))),
          ],
        ));
  });

  test('when confirmation occour then should emit a failure detais', () async {
    // arrange

    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCredentialAndSecretCombination(),
      message: SignInSecretResetMessages.invalidCachedCredential,
    );

    when(_mockSignInSecretReset.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(const SignInPasswordResetEvent.resetPasswordRequest());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInPasswordResetState(
                notification: optionOf(
                    VethxNotification.snack(message: expectedFailure.message))),
          ],
        ));
  });

  test('when cached credential fail occours should go to credential page',
      () async {
    // arrange

    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCachedCredential(),
      message: SignInSecretResetMessages.invalidCachedCredential,
    );

    when(_mockSignInSecretReset.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(const SignInPasswordResetEvent.resetPasswordRequest());

    // assert
    await expectLater(
      _bloc.stream,
      emitsInOrder([
        SignInPasswordResetState(
            notification: optionOf(
                VethxNotification.snack(message: expectedFailure.message))),
      ]),
    ).then((_) => verify(_mockNavigation.goTo(any)).called(1));
  });
}
