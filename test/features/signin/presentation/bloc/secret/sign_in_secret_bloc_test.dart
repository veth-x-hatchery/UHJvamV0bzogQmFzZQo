import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_credential_and_secret.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';

import 'sign_in_secret_bloc_test.mocks.dart';

@GenerateMocks([
  AuthBloc,
  SignInWithCredentialAndPassword,
])
void main() {
  late SignInPasswordBloc _bloc;
  late MockAuthBloc _mockAuthBloc;
  late MockSignInWithCredentialAndPassword _mockSignInWithCredentialAndPassword;

  setUp(() {
    _mockAuthBloc = MockAuthBloc();
    _mockSignInWithCredentialAndPassword =
        MockSignInWithCredentialAndPassword();
    _bloc = SignInPasswordBloc(
      _mockAuthBloc,
      _mockSignInWithCredentialAndPassword,
    );
  });

  test('when secret changes occour then should emit correct state', () async {
    // arrange

    const secret = 'test';

    // act

    _bloc.add(const SignInPasswordEvent.secretChanged(secret));

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder([
          SignInPasswordState(
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

    const secret = 'dmFsaWRwYXNzd29yZAo';

    final valueObject = Password(secret);

    when(_mockSignInWithCredentialAndPassword.call(any))
        .thenAnswer((_) => Future.value(right(unit)));

    // act

    _bloc.add(const SignInPasswordEvent.secretChanged(secret));

    _bloc.add(const SignInPasswordEvent.analysePasswordPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInPasswordState(
              secret: valueObject,
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInPasswordState(
              secret: valueObject,
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInPasswordState(
              secret: valueObject,
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

    const secret = 'test';

    when(_mockSignInWithCredentialAndPassword.call(any))
        .thenAnswer((_) => Future.value(right(unit)));

    // act

    _bloc.add(const SignInPasswordEvent.secretChanged(secret));

    _bloc.add(const SignInPasswordEvent.analysePasswordPressed());

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInPasswordState(
              secret: Password(secret),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInPasswordState(
              secret: Password(secret),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInPasswordState(
              secret: Password(secret),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            )
          ],
        ));
  });

  test('when confirmation occour then should emit an failure detais', () async {
    // arrange

    const secret = 'dmFsaWRwYXNzd29yZAo';
    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCredentialAndPasswordCombination(),
      message: SignInWithCredentialAndPasswordErrorMessages
          .invalidCredentialAndPasswordCombination,
    );

    when(_mockSignInWithCredentialAndPassword.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(const SignInPasswordEvent.secretChanged(secret));

    _bloc.add(const SignInPasswordEvent.analysePasswordPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInPasswordState(
              secret: Password(secret),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInPasswordState(
              secret: Password(secret),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInPasswordState(
              secret: Password(secret),
              isLoading: false,
              authFailureOrSuccessOption: some(Left(expectedFailure)),
            )
          ],
        ));
  });

  test('should notify Auth BLoC when sign in is allowed', () async {
    // arrange

    const secret = 'dmFsaWRwYXNzd29yZAo';

    final valueObject = Password(secret);

    when(_mockSignInWithCredentialAndPassword.call(any))
        .thenAnswer((_) => Future.value(right(unit)));

    // act

    _bloc.add(const SignInPasswordEvent.secretChanged(secret));

    _bloc.add(const SignInPasswordEvent.analysePasswordPressed());

    // assert
    await expectLater(
      _bloc.stream,
      emitsInOrder([
        SignInPasswordState(
          secret: valueObject,
          isLoading: false,
          authFailureOrSuccessOption: none(),
        ),
        SignInPasswordState(
          secret: valueObject,
          isLoading: true,
          authFailureOrSuccessOption: none(),
        ),
        SignInPasswordState(
          secret: valueObject,
          isLoading: false,
          authFailureOrSuccessOption: none(),
        )
      ]),
    ).then((_) {
      verify(_mockAuthBloc.add(const AuthEvent.authCheckRequested())).called(1);
    });
  });
}
