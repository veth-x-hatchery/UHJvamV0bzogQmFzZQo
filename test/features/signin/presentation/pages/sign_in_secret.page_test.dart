import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_secret.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_secret.page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../helpers/widgets/pumpWidget.widget.dart';

import 'sign_in_secret.page_test.mocks.dart';

@GenerateMocks([
  SignInSecretBloc,
  SignInSecretResetBloc,
])
void main() {
  late MockSignInSecretBloc _mockBloc;
  late MockSignInSecretResetBloc _mockSignInSecretResetBloc;

  setUp(() {
    _mockBloc = MockSignInSecretBloc();
    _mockSignInSecretResetBloc = MockSignInSecretResetBloc();
  });

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          Scaffold(
            body: SignInSecretPage.create(
              secretBloc: _mockBloc,
              secretResetbloc: _mockSignInSecretResetBloc,
            ),
          ),
        ),
      ),
    );
  }

  void _signInState(SignInSecretState state) {
    when(_mockBloc.state).thenReturn(state);
    when(_mockBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  Finder _secretInput() {
    // arrange
    final secretInput =
        find.byKey(const Key(SignInPageKeys.signInSecretPageSecretTextField));
    // Act && Assert
    expect(secretInput, findsOneWidget);
    return secretInput;
  }

  Finder _validationButton() {
    // arrange
    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInSecretPageValidateButton));
    // Act && Assert
    expect(validationButton, findsOneWidget);
    return validationButton;
  }

  /// Form uses BLoC state to realize validations
  void _prepareFormValidationValues({
    String? value,
  }) {
    final credentialVO = Secret(value);
    final state = SignInSecretState(
      secret: credentialVO,
      isLoading: false,
      authFailureOrSuccessOption: none(),
      notification: none(),
    );
    when(_mockBloc.state).thenReturn(state);
  }

  testWidgets('should find the validation button', (tester) async {
    // arrange

    _signInState(SignInSecretState.initial());

    await _pumpPage(tester);

    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInSecretPageValidateButton));

    // Act

    await tester.tap(validationButton);

    // assert

    expect(validationButton, findsOneWidget);
  });

  testWidgets('should find the secret input', (tester) async {
    // arrange

    _signInState(SignInSecretState.initial());

    await _pumpPage(tester);

    final secretInput =
        find.byKey(const Key(SignInPageKeys.signInSecretPageSecretTextField));

    // Act

    await tester.tap(secretInput);

    // assert

    expect(secretInput, findsOneWidget);
  });

  testWidgets('when receive loading event then should show a circular progress',
      (tester) async {
    // Arrange

    _signInState(SignInSecretState(
      isLoading: true,
      secret: Secret(''),
      authFailureOrSuccessOption: none(),
      notification: none(),
    ));

    await _pumpPage(tester);

    // Act && Assert

    expect(find.byType(GenericProgressIndicator), findsOneWidget);
  });

  testWidgets("when user doesn't enter the secret then no events are emitted",
      (tester) async {
    // arrange

    _signInState(SignInSecretState.initial());

    await _pumpPage(tester);

    // Act

    _prepareFormValidationValues();

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(_mockBloc.add(any));
  });

  testWidgets('when user enters a invalid secret then no events are emitted',
      (tester) async {
    // arrange

    _signInState(SignInSecretState.initial());

    await _pumpPage(tester);

    const invalidSecret = '1234';

    await tester.enterText(_secretInput(), invalidSecret);

    // Act

    _prepareFormValidationValues(value: invalidSecret);

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(_mockBloc.add(const SignInSecretEvent.analyseSecretPressed()));
  });

  testWidgets('when user enters a correct secret then SignInBLoC is called',
      (tester) async {
    // arrange

    _signInState(SignInSecretState.initial());

    await _pumpPage(tester);

    const validSecret = 'dmFsaWRwYXNzd29yZAo';

    await tester.enterText(_secretInput(), validSecret);

    _prepareFormValidationValues(value: validSecret);

    // Act

    await tester.tap(_validationButton());

    // assert

    verify(_mockBloc.add(const SignInSecretEvent.analyseSecretPressed()))
        .called(1);
  });

  testWidgets('when receive a failure then should show a snack message',
      (tester) async {
    // Arrange

    const secret = 'dmFsaWRwYXNzd29yZAo';

    final valueObject = Secret(secret);

    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCachedCredential(),
      message: SignInWithSecretErrorMessages.invalidCachedCredential,
    );

    _signInState(SignInSecretState(
      secret: valueObject,
      isLoading: false,
      authFailureOrSuccessOption: some(Left(expectedFailure)),
      notification:
          optionOf(VethxNotification.snack(message: expectedFailure.message)),
    ));

    await _pumpPage(tester);

    await tester.pumpAndSettle();

    // Act && Assert

    expect(find.text(expectedFailure.message), findsOneWidget);
  });
}
