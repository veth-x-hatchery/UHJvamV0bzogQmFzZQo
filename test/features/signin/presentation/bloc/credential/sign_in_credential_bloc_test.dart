import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';

import 'sign_in_credential_bloc_test.mocks.dart';

@GenerateMocks([
  NavigationCubit,
  SignInCheckIfEmailIsInUse,
])
void main() {
  late SignInEmailBloc _bloc;
  late MockSignInCheckIfEmailIsInUse _mockSignInWithEmailAndPassword;
  late MockNavigationCubit _mockNavigation;

  setUp(() {
    _mockSignInWithEmailAndPassword = MockSignInCheckIfEmailIsInUse();
    _mockNavigation = MockNavigationCubit();
    _bloc = SignInEmailBloc(
      _mockSignInWithEmailAndPassword,
      _mockNavigation,
    );
  });

  test('when credential changes occour then should emit correct state',
      () async {
    // arrange

    const credential = 'test';

    // act

    _bloc.add(const SignInEmailEvent.credentialChanged(credential));

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder([
          SignInEmailState(
            credential: EmailAddress(credential),
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

    const credential = 'test@test.com';

    final valueObject = EmailAddress(credential);

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(right(true)));

    // act

    _bloc.add(const SignInEmailEvent.credentialChanged(credential));

    _bloc.add(const SignInEmailEvent.analyseEmailPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInEmailState(
              credential: valueObject,
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              credential: valueObject,
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              credential: valueObject,
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

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(right(true)));

    // act

    _bloc.add(const SignInEmailEvent.credentialChanged(credential));

    _bloc.add(const SignInEmailEvent.analyseEmailPressed());

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInEmailState(
              credential: EmailAddress(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              credential: EmailAddress(credential),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              credential: EmailAddress(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            )
          ],
        ));
  });

  test('when confirmation occour then should emit an failure detais', () async {
    // arrange

    const credential = 'test@test.com';
    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidEmailAndPasswordCombination(),
      message: CheckEmailErrorMessages.credentialAlreadyRegistered,
    );

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(const SignInEmailEvent.credentialChanged(credential));

    _bloc.add(const SignInEmailEvent.analyseEmailPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInEmailState(
              credential: EmailAddress(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              credential: EmailAddress(credential),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              credential: EmailAddress(credential),
              isLoading: false,
              authFailureOrSuccessOption: some(Left(expectedFailure)),
            )
          ],
        ));
  });

  test('when confirmation occour then should go to other page', () async {
    // arrange

    const credential = 'test@test.com';

    when(_mockSignInWithEmailAndPassword.call(any))
        .thenAnswer((_) => Future.value(right(true)));

    // act

    _bloc.add(const SignInEmailEvent.credentialChanged(credential));

    _bloc.add(const SignInEmailEvent.analyseEmailPressed());

    // assert

    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInEmailState(
              credential: EmailAddress(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              credential: EmailAddress(credential),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInEmailState(
              credential: EmailAddress(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            )
          ],
        )).then(
      (_) => verify(_mockNavigation.goTo(any)).called(1),
    );
  });
}
