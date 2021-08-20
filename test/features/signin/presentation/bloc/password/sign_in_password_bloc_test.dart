import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/password/sign_in_password_bloc.dart';

import 'sign_in_password_bloc.mocks.dart';

@GenerateMocks([SignInWithEmailAndPassword])
void main() {
  late SignInPasswordBloc _bloc;
  late MockSignInWithEmailAndPassword _mockSignInWithEmailAndPassword;

  setUp(() {
    _mockSignInWithEmailAndPassword = MockSignInWithEmailAndPassword();
    _bloc = SignInPasswordBloc(_mockSignInWithEmailAndPassword);
  });

  test('when password changes occour then should emit correct state', () async {
    // arrange

    const password = 'test';

    // act

    _bloc.add(const SignInPasswordEvent.passwordChanged(password));

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder([
          SignInPasswordState(
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

    const password = 'test@test.com';

    final valueObject = Password(password);

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(right(unit)));

    // act

    _bloc.add(const SignInPasswordEvent.passwordChanged(password));

    _bloc.add(const SignInPasswordEvent.analysePasswordPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInPasswordState(
              password: valueObject,
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInPasswordState(
              password: valueObject,
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInPasswordState(
              password: valueObject,
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

    const password = 'test';

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(right(unit)));

    // act

    _bloc.add(const SignInPasswordEvent.passwordChanged(password));

    _bloc.add(const SignInPasswordEvent.analysePasswordPressed());

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInPasswordState(
              password: Password(password),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInPasswordState(
              password: Password(password),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInPasswordState(
              password: Password(password),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            )
          ],
        ));
  });

  test('when confirmation occour then should emit an failure detais', () async {
    // arrange

    const password = 'test@test.com';
    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidEmailAndPasswordCombination(),
      message: SignInWithEmailAndPasswordErrorMessages
          .invalidEmailAndPasswordCombination,
    );

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(const SignInPasswordEvent.passwordChanged(password));

    _bloc.add(const SignInPasswordEvent.analysePasswordPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInPasswordState(
              password: Password(password),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInPasswordState(
              password: Password(password),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInPasswordState(
              password: Password(password),
              isLoading: false,
              authFailureOrSuccessOption: some(Left(expectedFailure)),
            )
          ],
        ));
  });
}
