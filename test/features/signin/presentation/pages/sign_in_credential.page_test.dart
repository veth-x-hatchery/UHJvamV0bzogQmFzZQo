import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../helpers/widgets/pumpWidget.widget.dart';

import 'sign_in_credential.page_test.mocks.dart';

@GenerateMocks([SignInCredentialBloc])
void main() {
  late MockSignInCredentialBloc _mockBloc;

  setUp(() {
    _mockBloc = MockSignInCredentialBloc();
  });

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          Scaffold(
            body: SignInCredentialPage.create(bloc: _mockBloc),
          ),
        ),
      ),
    );
  }

  void _signInState(SignInCredentialState state) {
    when(_mockBloc.state).thenReturn(state);
    when(_mockBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  Finder _credentialInput() {
    // arrange
    final credentialInput = find.byKey(
        const Key(SignInPageKeys.signInCredentialPageCredentialTextField));
    // Act && Assert
    expect(credentialInput, findsOneWidget);
    return credentialInput;
  }

  Finder _validationButton() {
    // arrange
    final validationButton = find
        .byKey(const Key(SignInPageKeys.signInCredentialPageValidateButton));
    // Act && Assert
    expect(validationButton, findsOneWidget);
    return validationButton;
  }

  /// Form uses BLoC state to realize validations
  void _prepareFormValidationValues({
    String? value,
  }) {
    final credentialVO = Credential(value);
    final state = SignInCredentialState(
      credential: credentialVO,
      isLoading: false,
      authFailureOrSuccessOption: none(),
      notification: none(),
    );
    when(_mockBloc.state).thenReturn(state);
  }

  testWidgets('should find the validation button', (tester) async {
    // arrange

    _signInState(SignInCredentialState.initial());

    await _pumpPage(tester);

    final validationButton = find
        .byKey(const Key(SignInPageKeys.signInCredentialPageValidateButton));

    // Act

    await tester.tap(validationButton);

    // assert

    expect(validationButton, findsOneWidget);
  });

  testWidgets('should find the credential input', (tester) async {
    // arrange

    _signInState(SignInCredentialState.initial());

    await _pumpPage(tester);

    final credentialInput = find.byKey(
        const Key(SignInPageKeys.signInCredentialPageCredentialTextField));

    // Act

    await tester.tap(credentialInput);

    // assert

    expect(credentialInput, findsOneWidget);
  });

  testWidgets('when receive loading event then should show a circular progress',
      (tester) async {
    // Arrange

    _signInState(SignInCredentialState(
      credential: Credential('test@test.com'),
      isLoading: true,
      authFailureOrSuccessOption: none(),
      notification: none(),
    ));

    await _pumpPage(tester);

    // Act && Assert

    expect(find.byType(GenericProgressIndicator), findsOneWidget);
  });

  testWidgets(
      "when user doesn't enter the credential then no events are emitted",
      (tester) async {
    // arrange

    _signInState(SignInCredentialState.initial());

    await _pumpPage(tester);

    // Act

    _prepareFormValidationValues();

    await tester.tap(_validationButton());

    // assert

    verifyNever(
        _mockBloc.add(const SignInCredentialEvent.analyseCredentialPressed()));
  });

  testWidgets(
      'when user enters a invalid credential then no events are emitted',
      (tester) async {
    // arrange

    _signInState(SignInCredentialState.initial());

    await _pumpPage(tester);

    const invalidCredential = 'invalidcredential';

    await tester.enterText(_credentialInput(), invalidCredential);

    _prepareFormValidationValues(value: invalidCredential);

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(
        _mockBloc.add(const SignInCredentialEvent.analyseCredentialPressed()));
  });

  testWidgets('when user enters a correct credential then SignInBLoC is called',
      (tester) async {
    // arrange

    _signInState(SignInCredentialState.initial());

    await _pumpPage(tester);

    await tester.enterText(_credentialInput(), 'teste@teste.com');

    _prepareFormValidationValues(value: 'teste@teste.com');

    // Act

    await tester.tap(_validationButton());

    // assert

    verify(_mockBloc
            .add(const SignInCredentialEvent.analyseCredentialPressed()))
        .called(1);
  });

  testWidgets('when receive a failure then should show a snack message',
      (tester) async {
    // Arrange

    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCredentialAndSecretCombination(),
      message: CheckCredentialErrorMessages.credentialAlreadyRegistered,
    );

    _signInState(SignInCredentialState(
      credential: Credential('test@test.com'),
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
