import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_register_page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../helpers/widgets/pumpWidget.widget.dart';

import 'sign_in_register_page_test.mocks.dart';

@GenerateMocks([SignInRegisterBloc])
void main() {
  late MockSignInRegisterBloc _mockSignInBloc;

  setUp(() {
    _mockSignInBloc = MockSignInRegisterBloc();
  });

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          Scaffold(
            body: SignInRegisterPage.create(bloc: _mockSignInBloc),
          ),
        ),
      ),
    );
  }

  void _signInState(SignInRegisterState state) {
    when(_mockSignInBloc.state).thenReturn(state);
    when(_mockSignInBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  Finder _credentialInput() {
    // arrange
    final credentialInput =
        find.byKey(const Key(SignInPageKeys.signInRegisterPageEmailTextField));
    // Act && Assert
    // expect(credentialInput, findsOneWidget);
    return credentialInput;
  }

  Finder _passwordInput() {
    // arrange
    final passwordInput = find
        .byKey(const Key(SignInPageKeys.signInRegisterPagePasswordTextField));
    // Act && Assert
    // expect(passwordInput, findsOneWidget);
    return passwordInput;
  }

  Finder _validationButton() {
    // arrange
    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInRegisterPageValidateButton));
    // Act && Assert
    expect(validationButton, findsOneWidget);
    return validationButton;
  }

  const validEmail = 'test@test.com';
  const validPassword = 'dmFsaWRwYXNzd29yZAo';

  const invalidEmail = 'invalidcredential';
  const invalidPassword = '1234';

  /// Form uses BLoC state to realize validations
  void _prepareFormValidationValues({
    String? credential,
    String? password,
  }) {
    final credentialVO = EmailAddress(credential);
    final passwordVO = Password(password);
    final state = SignInRegisterState(
      credential: credentialVO,
      password: passwordVO,
      isLoading: false,
      authFailureOrSuccessOption: none(),
    );
    when(_mockSignInBloc.state).thenReturn(state);
  }

  group('when searching for controllers', () {
    testWidgets('should find the validation button', (tester) async {
      // arrange

      _signInState(SignInRegisterState.initial());

      await _pumpPage(tester);

      final validationButton = find
          .byKey(const Key(SignInPageKeys.signInRegisterPageValidateButton));

      // Act

      await tester.tap(validationButton);

      // assert

      expect(validationButton, findsOneWidget);
    });

    testWidgets('should find the credential input', (tester) async {
      // arrange

      _signInState(SignInRegisterState.initial());

      await _pumpPage(tester);

      final credentialInput = find
          .byKey(const Key(SignInPageKeys.signInRegisterPageEmailTextField));

      // Act

      await tester.tap(credentialInput);

      // assert

      expect(credentialInput, findsOneWidget);
    });

    testWidgets('should find the password input', (tester) async {
      // arrange

      _signInState(SignInRegisterState.initial());

      await _pumpPage(tester);

      final credentialInput = find
          .byKey(const Key(SignInPageKeys.signInRegisterPagePasswordTextField));

      // Act

      await tester.tap(credentialInput);

      // assert

      expect(credentialInput, findsOneWidget);
    });
  });

  testWidgets('when receive loading event then should show a circular progress',
      (tester) async {
    // Arrange

    _signInState(SignInRegisterState(
      credential: EmailAddress(validEmail),
      password: Password(validPassword),
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

    _signInState(SignInRegisterState.initial());

    await _pumpPage(tester);

    _prepareFormValidationValues();

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(_mockSignInBloc.add(any));
  });

  testWidgets(
      'when user enters a invalid credential then no events are emitted',
      (tester) async {
    // arrange

    _signInState(SignInRegisterState.initial());

    await _pumpPage(tester);

    await tester.enterText(_credentialInput(), invalidEmail);

    _prepareFormValidationValues(credential: invalidEmail);

    // Act

    await tester.tap(_validationButton());

    // assert

    verifyNever(_mockSignInBloc
        .add(const SignInRegisterEvent.registerWithEmailAndPasswordPressed()));
  });

  testWidgets('when user enters a invalid password then no events are emitted',
      (tester) async {
    // arrange

    _signInState(SignInRegisterState.initial());

    await _pumpPage(tester);

    await tester.enterText(_credentialInput(), validEmail);

    await tester.enterText(_passwordInput(), invalidPassword);

    _prepareFormValidationValues(
        credential: validEmail, password: invalidPassword);

    // Act

    await tester.tap(_validationButton());

    // assert

    verifyNever(_mockSignInBloc
        .add(const SignInRegisterEvent.registerWithEmailAndPasswordPressed()));
  });

  testWidgets(
      'when user enters valid credential and password then SignInBLoC is called',
      (tester) async {
    // arrange

    _signInState(SignInRegisterState.initial());

    await _pumpPage(tester);

    await tester.enterText(_credentialInput(), validEmail);

    await tester.enterText(_passwordInput(), validPassword);

    _prepareFormValidationValues(
        credential: validEmail, password: validPassword);

    // Act

    await tester.tap(_validationButton());

    // assert

    verify(_mockSignInBloc.add(
            const SignInRegisterEvent.registerWithEmailAndPasswordPressed()))
        .called(1);
  });
}
