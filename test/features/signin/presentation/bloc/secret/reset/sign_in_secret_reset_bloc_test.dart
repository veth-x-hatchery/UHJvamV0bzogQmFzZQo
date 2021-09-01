import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_secret_reset.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/manager/navigation.manager.dart';
import 'package:vethx_beta/l10n/l10n.dart';

import 'sign_in_secret_reset_bloc_test.mocks.dart';

@GenerateMocks([
  NavigationManager,
  SignInSecretReset,
])
void main() {
  late SignInSecretResetBloc _bloc;
  late MockNavigationManager _mockNavigation;
  late MockSignInSecretReset _mockSignInSecretReset;

  setUp(() {
    _mockSignInSecretReset = MockSignInSecretReset();
    _mockNavigation = MockNavigationManager();
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

    _bloc.add(const SignInSecretResetEvent.secretResetRequest());

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInSecretResetState(
              isLoading: true,
              notification: none(),
            ),
            SignInSecretResetState(
                isLoading: false,
                notification: optionOf(VethxNotification.snack(
                    message:
                        SignInSecretResetMessages.success().translate(null)!))),
          ],
        ));
  });

  test('when confirmation occour then should emit a failure detais', () async {
    // arrange

    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCredentialAndSecretCombination(),
      message:
          SignInSecretResetMessages.invalidCachedCredential().translate(null)!,
    );

    when(_mockSignInSecretReset.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(const SignInSecretResetEvent.secretResetRequest());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInSecretResetState(
              isLoading: true,
              notification: none(),
            ),
            SignInSecretResetState(
                isLoading: false,
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
      message:
          SignInSecretResetMessages.invalidCachedCredential().translate(null)!,
    );

    when(_mockSignInSecretReset.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(const SignInSecretResetEvent.secretResetRequest());

    // assert
    await expectLater(
      _bloc.stream,
      emitsInOrder([
        SignInSecretResetState(
          isLoading: true,
          notification: none(),
        ),
        SignInSecretResetState(
            isLoading: false,
            notification: optionOf(
                VethxNotification.snack(message: expectedFailure.message))),
      ]),
    ).then((_) => verify(_mockNavigation.goTo(any)).called(1));
  });
}
