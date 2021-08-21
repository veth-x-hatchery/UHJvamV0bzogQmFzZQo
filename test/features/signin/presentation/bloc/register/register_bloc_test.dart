import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_credential_and_password.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';

import 'register_bloc_test.mocks.dart';

@GenerateMocks([SignInRegisterEmailAndPassword])
void main() {
  late SignInRegisterBloc _bloc;
  late MockSignInRegisterEmailAndPassword _mockSignInWithEmailAndPassword;

  setUp(() {
    _mockSignInWithEmailAndPassword = MockSignInRegisterEmailAndPassword();
    _bloc = SignInRegisterBloc(_mockSignInWithEmailAndPassword);
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
            credential: EmailAddress(credential),
            password: Password(''),
            isLoading: false,
            authFailureOrSuccessOption: none(),
          )
        ]));
    //
  });

  test('when password changes occour then should emit correct state', () async {
    // arrange

    const password = '1234';

    // act

    _bloc.add(const SignInRegisterEvent.passwordChanged(password));

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder([
          SignInRegisterState(
            credential: EmailAddress(''),
            password: Password(password),
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
    const password = '1234';

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(const Right(unit)));

    // act

    _bloc.add(const SignInRegisterEvent.credentialChanged(credential));
    _bloc.add(const SignInRegisterEvent.passwordChanged(password));
    _bloc.add(const SignInRegisterEvent.registerWithEmailAndPasswordPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInRegisterState(
              credential: EmailAddress(credential),
              password: Password(''),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: EmailAddress(credential),
              password: Password(password),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: EmailAddress(credential),
              password: Password(password),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: EmailAddress(credential),
              password: Password(password),
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
    const password = '1234';

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(const Right(unit)));

    // act

    _bloc.add(const SignInRegisterEvent.credentialChanged(credential));
    _bloc.add(const SignInRegisterEvent.passwordChanged(password));
    _bloc.add(const SignInRegisterEvent.registerWithEmailAndPasswordPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInRegisterState(
              credential: EmailAddress(credential),
              password: Password(''),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: EmailAddress(credential),
              password: Password(password),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: EmailAddress(credential),
              password: Password(password),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: EmailAddress(credential),
              password: Password(password),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            )
          ],
        ));
  });

  test('when confirmation occour then should emit an failure detais', () async {
    // arrange

    const credential = 'test';
    const password = '1234';
    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidEmailAndPasswordCombination(),
      message: SignInRegisterEmailAndPasswordErrorMessages
          .invalidEmailAndPasswordCombination,
    );

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(const SignInRegisterEvent.credentialChanged(credential));
    _bloc.add(const SignInRegisterEvent.passwordChanged(password));
    _bloc.add(const SignInRegisterEvent.registerWithEmailAndPasswordPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInRegisterState(
              credential: EmailAddress(credential),
              password: Password(''),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: EmailAddress(credential),
              password: Password(password),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: EmailAddress(credential),
              password: Password(password),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInRegisterState(
              credential: EmailAddress(credential),
              password: Password(password),
              isLoading: false,
              authFailureOrSuccessOption: some(Left(expectedFailure)),
            )
          ],
        ));
  });
}
