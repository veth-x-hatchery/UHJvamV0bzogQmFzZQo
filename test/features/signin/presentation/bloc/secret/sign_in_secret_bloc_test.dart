import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_secret.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/manager/navigation.manager.dart';

import 'sign_in_secret_bloc_test.mocks.dart';

@GenerateMocks([
  AuthBloc,
  SignInSecretResetBloc,
  NavigationManager,
  SignInWithSecret,
])
void main() {
  late SignInSecretBloc _bloc;
  late MockAuthBloc _mockAuthBloc;
  late MockNavigationManager _mockNavigation;
  late MockSignInWithSecret _mockSignInWithSecret;

  setUp(() {
    _mockAuthBloc = MockAuthBloc();
    _mockSignInWithSecret = MockSignInWithSecret();
    _mockNavigation = MockNavigationManager();
    _bloc = SignInSecretBloc(
      _mockAuthBloc,
      _mockNavigation,
      _mockSignInWithSecret,
    );
  });

  test('when secret changes occour then should emit correct state', () async {
    // arrange

    final secret = AuthFacadeMock.invalidSecret.inputedValue!;

    // act

    _bloc.add(SignInSecretEvent.secretChanged(secret));

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder([
          SignInSecretState(
            secret: Secret(secret),
            isLoading: false,
            authFailureOrSuccessOption: none(),
            notification: none(),
          )
        ]));
    //
  });

  test(
      'when confirmation occour then should emit correct state with loading indicator',
      () async {
    // arrange

    final secret = AuthFacadeMock.validTestSecret.inputedValue!;

    final valueObject = Secret(secret);

    when(_mockSignInWithSecret.call(any))
        .thenAnswer((_) => Future.value(right(unit)));

    // act

    _bloc.add(SignInSecretEvent.secretChanged(secret));

    _bloc.add(const SignInSecretEvent.analyseSecretPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInSecretState(
              secret: valueObject,
              isLoading: false,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInSecretState(
              secret: valueObject,
              isLoading: true,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInSecretState(
              secret: valueObject,
              isLoading: false,
              authFailureOrSuccessOption: some(right(unit)),
              notification: none(),
            )
          ],
        ));
    //
  });

  test(
      'when confirmation occour then should emit correct state with loading indicator',
      () async {
    // arrange

    final secret = AuthFacadeMock.invalidSecret.inputedValue!;

    when(_mockSignInWithSecret.call(any))
        .thenAnswer((_) => Future.value(right(unit)));

    // act

    _bloc.add(SignInSecretEvent.secretChanged(secret));

    _bloc.add(const SignInSecretEvent.analyseSecretPressed());

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInSecretState(
              secret: Secret(secret),
              isLoading: false,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInSecretState(
              secret: Secret(secret),
              isLoading: true,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInSecretState(
              secret: Secret(secret),
              isLoading: false,
              authFailureOrSuccessOption: some(right(unit)),
              notification: none(),
            )
          ],
        ));
  });

  test('when confirmation occour then should emit a failure detais', () async {
    // arrange

    final secret = AuthFacadeMock.validTestSecret.inputedValue!;
    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCredentialAndSecretCombination(),
      message:
          SignInWithSecretErrorMessages.invalidCredentialAndSecretCombination,
    );

    when(_mockSignInWithSecret.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(SignInSecretEvent.secretChanged(secret));

    _bloc.add(const SignInSecretEvent.analyseSecretPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInSecretState(
              secret: Secret(secret),
              isLoading: false,
              notification: none(),
              authFailureOrSuccessOption: none(),
            ),
            SignInSecretState(
              secret: Secret(secret),
              isLoading: true,
              notification: none(),
              authFailureOrSuccessOption: none(),
            ),
            SignInSecretState(
              secret: Secret(secret),
              isLoading: false,
              authFailureOrSuccessOption: some(Left(expectedFailure)),
              notification: optionOf(
                  VethxNotification.snack(message: expectedFailure.message)),
            )
          ],
        ));
  });

  test('should notify Auth BLoC when sign in is allowed', () async {
    // arrange

    final secret = AuthFacadeMock.validTestSecret.inputedValue!;

    final valueObject = Secret(secret);

    when(_mockSignInWithSecret.call(any))
        .thenAnswer((_) => Future.value(right(unit)));

    // act

    _bloc.add(SignInSecretEvent.secretChanged(secret));

    _bloc.add(const SignInSecretEvent.analyseSecretPressed());

    // assert
    await expectLater(
      _bloc.stream,
      emitsInOrder([
        SignInSecretState(
          secret: valueObject,
          isLoading: false,
          authFailureOrSuccessOption: none(),
          notification: none(),
        ),
        SignInSecretState(
          secret: valueObject,
          isLoading: true,
          authFailureOrSuccessOption: none(),
          notification: none(),
        ),
        SignInSecretState(
          secret: valueObject,
          isLoading: false,
          authFailureOrSuccessOption: some(right(unit)),
          notification: none(),
        )
      ]),
    ).then((_) {
      verify(_mockAuthBloc.add(const AuthEvent.authCheckRequested())).called(1);
    });
  });

  test('should go to credential page when cached credential fail occours',
      () async {
    // arrange

    final secret = AuthFacadeMock.validTestSecret.inputedValue!;

    final valueObject = Secret(secret);

    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCachedCredential(),
      message: SignInWithSecretErrorMessages.invalidCachedCredential,
    );

    when(_mockSignInWithSecret.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(SignInSecretEvent.secretChanged(secret));

    _bloc.add(const SignInSecretEvent.analyseSecretPressed());

    // assert
    await expectLater(
      _bloc.stream,
      emitsInOrder([
        SignInSecretState(
          secret: valueObject,
          isLoading: false,
          authFailureOrSuccessOption: none(),
          notification: none(),
        ),
        SignInSecretState(
          secret: valueObject,
          isLoading: true,
          authFailureOrSuccessOption: none(),
          notification: none(),
        ),
        SignInSecretState(
          secret: valueObject,
          isLoading: false,
          authFailureOrSuccessOption: some(Left(expectedFailure)),
          notification: optionOf(
              VethxNotification.snack(message: expectedFailure.message)),
        )
      ]),
    ).then((_) => verify(_mockNavigation.goTo(any)).called(1));
  });
}
