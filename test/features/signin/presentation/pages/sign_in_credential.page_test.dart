import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../helpers/widgets/pumpWidget.widget.dart';

import 'sign_in_credential.page_test.mocks.dart';

@GenerateMocks([SignInEmailBloc])
void main() {
  late MockSignInEmailBloc _mockMockSignInEmailBloc;

  setUp(() {
    _mockMockSignInEmailBloc = MockSignInEmailBloc();
  });

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          Scaffold(
            body: SignInEmailPage.create(bloc: _mockMockSignInEmailBloc),
          ),
        ),
      ),
    );
  }

  void _signInState(SignInEmailState state) {
    when(_mockMockSignInEmailBloc.state).thenReturn(state);
    when(_mockMockSignInEmailBloc.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  Finder _credentialInput() {
    // arrange
    final credentialInput =
        find.byKey(const Key(SignInPageKeys.signInEmailPageEmailTextField));
    // Act && Assert
    expect(credentialInput, findsOneWidget);
    return credentialInput;
  }

  Finder _validationButton() {
    // arrange
    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInEmailPageValidateButton));
    // Act && Assert
    expect(validationButton, findsOneWidget);
    return validationButton;
  }

  /// Form uses BLoC state to realize validations
  void _prepareFormValidationValues({
    String? credential,
  }) {
    final credentialVO = EmailAddress(credential);
    final state = SignInEmailState(
      credential: credentialVO,
      isLoading: false,
      authFailureOrSuccessOption: none(),
    );
    when(_mockMockSignInEmailBloc.state).thenReturn(state);
  }

  testWidgets('should find the validation button', (tester) async {
    // arrange

    _signInState(SignInEmailState.initial());

    await _pumpPage(tester);

    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInEmailPageValidateButton));

    // Act

    await tester.tap(validationButton);

    // assert

    expect(validationButton, findsOneWidget);
  });

  testWidgets('should find the credential input', (tester) async {
    // arrange

    _signInState(SignInEmailState.initial());

    await _pumpPage(tester);

    final credentialInput =
        find.byKey(const Key(SignInPageKeys.signInEmailPageEmailTextField));

    // Act

    await tester.tap(credentialInput);

    // assert

    expect(credentialInput, findsOneWidget);
  });

  testWidgets('when receive loading event then should show a circular progress',
      (tester) async {
    // Arrange

    _signInState(SignInEmailState(
      credential: EmailAddress('test@test.com'),
      isLoading: true,
      authFailureOrSuccessOption: none(),
    ));

    await _pumpPage(tester);

    // Act && Assert

    expect(find.byType(GenericProgressIndicator), findsOneWidget);
  });

  testWidgets(
      "when user doesn't enter the credential then no events are emitted",
      (tester) async {
    // arrange

    _signInState(SignInEmailState.initial());

    await _pumpPage(tester);

    // Act

    _prepareFormValidationValues();

    await tester.tap(_validationButton());

    // assert

    verifyNever(_mockMockSignInEmailBloc
        .add(const SignInEmailEvent.analyseEmailPressed()));
  });

  testWidgets(
      'when user enters a invalid credential then no events are emitted',
      (tester) async {
    // arrange

    _signInState(SignInEmailState.initial());

    await _pumpPage(tester);

    const invalidEmail = 'invalidcredential';

    await tester.enterText(_credentialInput(), invalidEmail);

    _prepareFormValidationValues(credential: invalidEmail);

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(_mockMockSignInEmailBloc
        .add(const SignInEmailEvent.analyseEmailPressed()));
  });

  testWidgets('when user enters a correct credential then SignInBLoC is called',
      (tester) async {
    // arrange

    _signInState(SignInEmailState.initial());

    await _pumpPage(tester);

    await tester.enterText(_credentialInput(), 'teste@teste.com');

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verify(_mockMockSignInEmailBloc.add(any)).called(1);
  });
}
