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
  SignInCheckIfCredentialIsInUse,
])
void main() {
  late SignInCredentialBloc _bloc;
  late MockSignInCheckIfCredentialIsInUse _mockSignInWithCredentialAndSecret;
  late MockNavigationCubit _mockNavigation;

  setUp(() {
    _mockSignInWithCredentialAndSecret = MockSignInCheckIfCredentialIsInUse();
    _mockNavigation = MockNavigationCubit();
    _bloc = SignInCredentialBloc(
      _mockSignInWithCredentialAndSecret,
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
            credential: CredentialAddress(credential),
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

    final valueObject = CredentialAddress(credential);

    when(_mockSignInWithCredentialAndSecret.call(any))
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
              credential: valueObject,
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInCredentialState(
              credential: valueObject,
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInCredentialState(
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

    when(_mockSignInWithCredentialAndSecret.call(any))
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
              credential: CredentialAddress(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInCredentialState(
              credential: CredentialAddress(credential),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInCredentialState(
              credential: CredentialAddress(credential),
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
      failure: const AuthFailure.invalidCredentialAndSecretCombination(),
      message: CheckCredentialErrorMessages.credentialAlreadyRegistered,
    );

    when(_mockSignInWithCredentialAndSecret.call(any))
        .thenAnswer((_) => Future.value(Left(expectedFailure)));

    // act

    _bloc.add(const SignInCredentialEvent.credentialChanged(credential));

    _bloc.add(const SignInCredentialEvent.analyseCredentialPressed());

    // assert
    await expectLater(
        _bloc.stream,
        emitsInOrder(
          [
            SignInCredentialState(
              credential: CredentialAddress(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInCredentialState(
              credential: CredentialAddress(credential),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInCredentialState(
              credential: CredentialAddress(credential),
              isLoading: false,
              authFailureOrSuccessOption: some(Left(expectedFailure)),
            )
          ],
        ));
  });

  test('when confirmation occour then should go to other page', () async {
    // arrange

    const credential = 'test@test.com';

    when(_mockSignInWithCredentialAndSecret.call(any))
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
              credential: CredentialAddress(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            ),
            SignInCredentialState(
              credential: CredentialAddress(credential),
              isLoading: true,
              authFailureOrSuccessOption: none(),
            ),
            SignInCredentialState(
              credential: CredentialAddress(credential),
              isLoading: false,
              authFailureOrSuccessOption: none(),
            )
          ],
        )).then(
      (_) => verify(_mockNavigation.goTo(any)).called(1),
    );
  });
}
