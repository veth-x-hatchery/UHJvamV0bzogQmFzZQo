import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_login/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:vethx_login/features/signin/presentation/utils/custom_validators.dart';

import 'sign_in_bloc_test.mocks.dart';

@GenerateMocks([
  SignInWithEmailAndPassword,
  SignInWithGoogle,
  CustomValidators,
])
void main() {
  late SignInBloc bloc;

  late MockSignInWithEmailAndPassword mockSignInWithEmailAndPassword;
  late MockSignInWithGoogle mockSignInWithGoogle;
  late MockCustomValidators mockCustomValidators;

  setUp(() {
    mockSignInWithEmailAndPassword = MockSignInWithEmailAndPassword();
    mockSignInWithGoogle = MockSignInWithGoogle();
    mockCustomValidators = MockCustomValidators();

    bloc = SignInBloc(
      signInWithEmailAndPassword: mockSignInWithEmailAndPassword,
      signInWithGoogle: mockSignInWithGoogle,
      validators: mockCustomValidators,
    );
  });

  test('initialState should be SignInInitial', () {
    // assert
    expect(bloc.state, equals(SignInInitial()));
  });

  group('use case SignInWithEmailAndPassword', () {
    const String email = 'user@domain.com';
    const String password = 'dXNlckBkb21haW4uY29tCg';

    void _setUpMockCustomValidatorsEmailAnalysisSuccess() =>
        when(mockCustomValidators.emailAnalysis(any)).thenReturn(
          Right(email),
        );

    test(
      'should call the CustomValidators to validate and return a valid email',
      () async {
        // arrange
        _setUpMockCustomValidatorsEmailAnalysisSuccess();
        // act
        bloc.add(SignInWithEmailEvent(email: email));
        await untilCalled(mockCustomValidators.emailAnalysis(any));
        // assert
        verify(mockCustomValidators.emailAnalysis(any));
      },
    );

    test(
      'should emit [Error] when the input is invalid',
      () async {
        // arrange

        final expectedFailure = InvalidEmailFailure(
            message: CustomValidatorsMessages.invalidEmptyEmail);

        when(mockCustomValidators.emailAnalysis(any))
            .thenReturn(Left(expectedFailure));

        // act
        bloc.add(SignInWithEmailEvent(email: ''));

        // assert later
        final expected = [
          SignInError(message: expectedFailure.message),
        ];

        await expectLater(bloc.stream, emitsInOrder(expected));
      },
    );
  });
}
