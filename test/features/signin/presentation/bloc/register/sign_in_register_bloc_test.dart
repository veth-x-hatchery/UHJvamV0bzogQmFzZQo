import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_credential_and_secret.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';
import 'package:vethx_beta/l10n/l10n.dart';

import 'sign_in_register_bloc_test.mocks.dart';

@GenerateMocks([
  AuthBloc,
  SignInRegisterCredentialAndSecret,
])
void main() {
  late SignInRegisterBloc _bloc;
  late MockSignInRegisterCredentialAndSecret _mockSignInWithSecret;
  late MockAuthBloc _mockAuthBloc;

  setUp(() {
    _mockAuthBloc = MockAuthBloc();
    _mockSignInWithSecret = MockSignInRegisterCredentialAndSecret();
    _bloc = SignInRegisterBloc(
      _mockAuthBloc,
      _mockSignInWithSecret,
    );
  });

  test('when credential changes occour then should emit correct state',
      () async {
    // arrange

    const credential = 'test';

    // act

    _bloc.add(const SignInRegisterEvent.credentialChanged(credential));

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder([
          SignInRegisterState(
            credential: Credential(credential),
            secret: Secret(''),
            isLoading: false,
            authFailureOrSuccessOption: none(),
            notification: none(),
          )
        ]));
    //
  });

  test('when secret changes occour then should emit correct state', () async {
    // arrange

    final secret = AuthFacadeMock.invalidSecret.inputedValue!;

    // act

    _bloc.add(SignInRegisterEvent.secretChanged(secret));

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder([
          SignInRegisterState(
            credential: Credential(''),
            secret: Secret(secret),
            isLoading: false,
            authFailureOrSuccessOption: none(),
            notification: none(),
          )
        ]));
    //
  });

  test(
      'when confirmation occour then should emit correct state and notify AuthBLoC',
      () async {
    // arrange

    final credential = AuthFacadeMock.validTestCredential.inputedValue!;
    final secret = AuthFacadeMock.validTestSecret.inputedValue!;

    when(_mockSignInWithSecret.call(any))
        .thenAnswer((_) => Future.value(const Right(unit)));

    // act

    _bloc.add(SignInRegisterEvent.credentialChanged(credential));

    _bloc.add(SignInRegisterEvent.secretChanged(secret));

    _bloc.add(
        const SignInRegisterEvent.registerWithCredentialAndSecretPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            // SignInRegisterState.initial(),
            SignInRegisterState(
              credential: Credential(credential),
              secret: Secret(''),
              isLoading: false,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInRegisterState(
              credential: Credential(credential),
              secret: Secret(secret),
              isLoading: false,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInRegisterState(
              credential: Credential(credential),
              secret: Secret(secret),
              isLoading: true,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInRegisterState(
              credential: Credential(credential),
              secret: Secret(secret),
              isLoading: false,
              authFailureOrSuccessOption: some(right(unit)),
              notification: none(),
            )
          ],
        )).then((_) {
      verify(_mockAuthBloc.add(const AuthEvent.authCheckRequested())).called(1);
    });
  });

  test(
      'when confirmation occour then should emit a failure detais and a notification message',
      () async {
    // arrange

    final credential = AuthFacadeMock.invalidCredential.inputedValue!;
    final secret = AuthFacadeMock.validTestSecret.inputedValue!;

    final expectedFailure = FailureDetails(
      failure: const AuthFailure.credentialAlreadyInUse(),
      message: SignInRegisterCredentialAndSecretErrorMessages
              .credentialAlreadyInUse()
          .translate(null)!,
    );

    when(_mockSignInWithSecret.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(SignInRegisterEvent.credentialChanged(credential));
    _bloc.add(SignInRegisterEvent.secretChanged(secret));
    _bloc.add(
        const SignInRegisterEvent.registerWithCredentialAndSecretPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInRegisterState(
              credential: Credential(credential),
              secret: Secret(''),
              isLoading: false,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInRegisterState(
              credential: Credential(credential),
              secret: Secret(secret),
              isLoading: false,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInRegisterState(
              credential: Credential(credential),
              secret: Secret(secret),
              isLoading: true,
              authFailureOrSuccessOption: none(),
              notification: none(),
            ),
            SignInRegisterState(
              credential: Credential(credential),
              secret: Secret(secret),
              isLoading: false,
              authFailureOrSuccessOption: some(Left(expectedFailure)),
              notification: optionOf(
                  VethxNotification.snack(message: expectedFailure.message)),
            )
          ],
        ));
  });
}
