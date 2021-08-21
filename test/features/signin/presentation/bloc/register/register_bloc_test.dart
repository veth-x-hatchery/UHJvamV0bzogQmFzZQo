import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_credential_and_secret.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';

import 'register_bloc_test.mocks.dart';

@GenerateMocks([SignInRegisterCredentialAndPassword])
void main() {
  late SignInRegisterBloc _bloc;
  late MockSignInRegisterCredentialAndPassword
      _mockSignInWithCredentialAndPassword;

  setUp(() {
    _mockSignInWithCredentialAndPassword =
        MockSignInRegisterCredentialAndPassword();
    _bloc = SignInRegisterBloc(_mockSignInWithCredentialAndPassword);
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
            credential: CredentialAddress(credential),
            secret: Password(''),
            isLoading: false,
            authFailureOrSuccessOption: none(),
          )
        ]));
    //
  });

  test('when secret changes occour then should emit correct state', () async {
    // arrange

    const secret = '1234';

    // act

    _bloc.add(const SignInRegisterEvent.secretChanged(secret));

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder([
          SignInRegisterState(
            credential: CredentialAddress(''),
            secret: Password(secret),
            isLoading: false,
            authFailureOrSuccessOption: none(),
          )
        ]));
    //
  });

  test(
      'when confirmation occour then should emit correct state with loading indicator',
      () async {
    // arrange

    const credential = 'test';
    const secret = '1234';

    when(_mockSignInWithCredentialAndPassword.call(any))
        .thenAnswer((_) => Future.value(const Right(unit)));

    // act

    _bloc.add(const SignInRegisterEvent.credentialChanged(credential));
    _bloc.add(const SignInRegisterEvent.secretChanged(secret));
    _bloc.add(
        const SignInRegisterEvent.registerWithCredentialAndPasswordPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInRegisterState(
              credential: CredentialAddress(credential),
              secret: Password(''),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: CredentialAddress(credential),
              secret: Password(secret),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: CredentialAddress(credential),
              secret: Password(secret),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: CredentialAddress(credential),
              secret: Password(secret),
              isLoading: false,
              authFailureOrSuccessOption: none(),
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
    const secret = '1234';

    when(_mockSignInWithCredentialAndPassword.call(any))
        .thenAnswer((_) => Future.value(const Right(unit)));

    // act

    _bloc.add(const SignInRegisterEvent.credentialChanged(credential));
    _bloc.add(const SignInRegisterEvent.secretChanged(secret));
    _bloc.add(
        const SignInRegisterEvent.registerWithCredentialAndPasswordPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInRegisterState(
              credential: CredentialAddress(credential),
              secret: Password(''),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: CredentialAddress(credential),
              secret: Password(secret),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: CredentialAddress(credential),
              secret: Password(secret),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: CredentialAddress(credential),
              secret: Password(secret),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            )
          ],
        ));
  });

  test('when confirmation occour then should emit an failure detais', () async {
    // arrange

    const credential = 'test';
    const secret = '1234';
    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCredentialAndPasswordCombination(),
      message: SignInRegisterCredentialAndPasswordErrorMessages
          .invalidCredentialAndPasswordCombination,
    );

    when(_mockSignInWithCredentialAndPassword.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(const SignInRegisterEvent.credentialChanged(credential));
    _bloc.add(const SignInRegisterEvent.secretChanged(secret));
    _bloc.add(
        const SignInRegisterEvent.registerWithCredentialAndPasswordPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInRegisterState(
              credential: CredentialAddress(credential),
              secret: Password(''),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: CredentialAddress(credential),
              secret: Password(secret),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: CredentialAddress(credential),
              secret: Password(secret),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: CredentialAddress(credential),
              secret: Password(secret),
              isLoading: false,
              authFailureOrSuccessOption: some(Left(expectedFailure)),
            )
          ],
        ));
  });
}
