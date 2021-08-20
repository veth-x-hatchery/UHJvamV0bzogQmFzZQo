import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_email.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/email/sign_in_email_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';

import 'register_bloc_test.mocks.dart';

@GenerateMocks([SignInCheckIfEmailIsInUse])
void main() {
  late SignInEmailBloc _bloc;
  late MockSignInCheckIfEmailIsInUse _mockSignInWithEmailAndPassword;

  setUp(() {
    _mockSignInWithEmailAndPassword = MockSignInCheckIfEmailIsInUse();
    _bloc = SignInEmailBloc(_mockSignInWithEmailAndPassword);
  });

  test('when email changes occour then should emit correct state', () async {
    // arrange

    const email = 'test';

    // act

    _bloc.add(const SignInEmailEvent.emailChanged(email));

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder([
          SignInEmailState(
            email: EmailAddress(email),
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

    const email = 'test';

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(const Right(unit)));

    // act

    _bloc.add(const SignInEmailEvent.emailChanged(email));
    _bloc.add(const SignInEmailEvent.analyseEmailPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInEmailState(
              email: EmailAddress(email),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              email: EmailAddress(email),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              email: EmailAddress(email),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              email: EmailAddress(email),
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

    const email = 'test';

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(const Right(unit)));

    // act

    _bloc.add(const SignInEmailEvent.emailChanged(email));
    _bloc.add(const SignInEmailEvent.analyseEmailPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInEmailState(
              email: EmailAddress(email),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              email: EmailAddress(email),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              email: EmailAddress(email),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              email: EmailAddress(email),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            )
          ],
        ));
  });

  test('when confirmation occour then should emit an failure detais', () async {
    // arrange

    const email = 'test';
    const password = '1234';
    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidEmailAndPasswordCombination(),
      message: CheckEmailErrorMessages.emailAlreadyRegistered,
    );

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(const SignInEmailEvent.emailChanged(email));
    _bloc.add(const SignInEmailEvent.analyseEmailPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInEmailState(
              email: EmailAddress(email),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              email: EmailAddress(email),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              email: EmailAddress(email),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              email: EmailAddress(email),
              isLoading: false,
              authFailureOrSuccessOption: some(Left(expectedFailure)),
            )
          ],
        ));
  });
}
