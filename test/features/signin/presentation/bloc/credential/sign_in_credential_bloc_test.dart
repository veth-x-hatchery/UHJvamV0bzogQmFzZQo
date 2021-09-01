import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/manager/navigation.manager.dart';

import 'sign_in_credential_bloc_test.mocks.dart';

@GenerateMocks([
  NavigationManager,
  SignInCredentialCheck,
])
void main() {
  late SignInCredentialBloc _bloc;
  late MockSignInCredentialCheck _mockSignInWithSecret;
  late MockNavigationManager _mockNavigation;

  setUp(() {
    _mockSignInWithSecret = MockSignInCredentialCheck();
    _mockNavigation = MockNavigationManager();
    _bloc = SignInCredentialBloc(
      _mockSignInWithSecret,
      _mockNavigation,
    );
  });

  test('when credential changes occour then should emit correct state',
      () async {
    // arrange

    const credential = 'test';

    // act

    _bloc.add(const SignInCredentialEvent.credentialChanged(credential));

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder([
          SignInCredentialState(
            credential: Credential(credential),
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

    final credential = AuthFacadeMock.validTestCredential.inputedValue!;

    final valueObject = Credential(credential);

    when(_mockSignInWithSecret.call(any))
        .thenAnswer((_) => Future.value(right(true)));

    // act

    _bloc.add(SignInCredentialEvent.credentialChanged(credential));

    _bloc.add(const SignInCredentialEvent.analyseCredentialPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInCredentialState(
              credential: valueObject,
              isLoading: false,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInCredentialState(
              credential: valueObject,
              isLoading: true,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInCredentialState(
              credential: valueObject,
              isLoading: false,
              authFailureOrSuccessOption: none(),
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

    const credential = 'test';

    when(_mockSignInWithSecret.call(any))
        .thenAnswer((_) => Future.value(right(true)));

    // act

    _bloc.add(const SignInCredentialEvent.credentialChanged(credential));

    _bloc.add(const SignInCredentialEvent.analyseCredentialPressed());

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInCredentialState(
              credential: Credential(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInCredentialState(
              credential: Credential(credential),
              isLoading: true,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInCredentialState(
              credential: Credential(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
              notification: none(),
            )
          ],
        ));
  });

  test(
      'when confirmation occour then should emit a failure detais with a notification',
      () async {
    // arrange

    final credential = AuthFacadeMock.validTestCredential.inputedValue!;
    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCredentialAndSecretCombination(),
      message: CheckCredentialErrorMessages.credentialAlreadyRegistered(),
    );

    when(_mockSignInWithSecret.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(SignInCredentialEvent.credentialChanged(credential));

    _bloc.add(const SignInCredentialEvent.analyseCredentialPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInCredentialState(
              credential: Credential(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInCredentialState(
              credential: Credential(credential),
              isLoading: true,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInCredentialState(
              credential: Credential(credential),
              isLoading: false,
              authFailureOrSuccessOption: some(Left(expectedFailure)),
              notification: optionOf(
                  VethxNotification.snack(message: expectedFailure.message)),
            )
          ],
        ));
  });

  test('when confirmation occour then should go to other page', () async {
    // arrange

    final credential = AuthFacadeMock.validTestCredential.inputedValue!;

    when(_mockSignInWithSecret.call(any))
        .thenAnswer((_) => Future.value(right(true)));

    // act

    _bloc.add(SignInCredentialEvent.credentialChanged(credential));

    _bloc.add(const SignInCredentialEvent.analyseCredentialPressed());

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInCredentialState(
              credential: Credential(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInCredentialState(
              credential: Credential(credential),
              isLoading: true,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInCredentialState(
              credential: Credential(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
              notification: none(),
            )
          ],
        )).then(
      (_) => verify(_mockNavigation.goTo(any)).called(1),
    );
  });
}
