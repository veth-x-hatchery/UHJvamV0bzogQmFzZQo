import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_password.page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../helpers/widgets/pumpWidget.widget.dart';

import 'sign_in_password.page_test.mocks.dart';

@GenerateMocks([SignInBloc])
void main() {
  late MockSignInBloc _mockSignInBloc;

  setUp(() {
    _mockSignInBloc = MockSignInBloc();
  });

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          Scaffold(
            body: SignInPasswordPage.create(signInBloc: _mockSignInBloc),
          ),
        ),
      ),
    );
  }

  void _signInState(SignInState state) {
    when(_mockSignInBloc.state).thenReturn(state);
    when(_mockSignInBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  Finder _passwordInput() {
    // arrange
    final passwordInput = find
        .byKey(const Key(SignInPageKeys.signInPasswordPagePasswordTextField));
    // Act && Assert
    expect(passwordInput, findsOneWidget);
    return passwordInput;
  }

  Finder _validationButton() {
    // arrange
    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInPasswordPageValidateButton));
    // Act && Assert
    expect(validationButton, findsOneWidget);
    return validationButton;
  }

  testWidgets('should find the validation button', (tester) async {
    // arrange

    _signInState(const SignInState.initial());

    await _pumpPage(tester);

    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInPasswordPageValidateButton));

    // Act

    await tester.tap(validationButton);

    // assert

    expect(validationButton, findsOneWidget);
  });

  testWidgets('should find the password input', (tester) async {
    // arrange

    _signInState(const SignInState.initial());

    await _pumpPage(tester);

    final passwordInput = find
        .byKey(const Key(SignInPageKeys.signInPasswordPagePasswordTextField));

    // Act

    await tester.tap(passwordInput);

    // assert

    expect(passwordInput, findsOneWidget);
  });

  testWidgets('when receive loading event then should show a circular progress',
      (tester) async {
    // Arrange

    _signInState(const SignInState.loading());

    await _pumpPage(tester);

    // Act && Assert

    expect(find.byType(GenericProgressIndicator), findsOneWidget);
  });

  testWidgets("when user doesn't enter the password then no events are emitted",
      (tester) async {
    // arrange

    _signInState(const SignInState.initial());

    await _pumpPage(tester);

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(_mockSignInBloc.add(any));
  });

  testWidgets('when user enters a invalid password then no events are emitted',
      (tester) async {
    // arrange

    _signInState(const SignInState.initial());

    await _pumpPage(tester);

    await tester.enterText(_passwordInput(), 'invalidpassword');

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(_mockSignInBloc.add(any));
  });

  testWidgets('when user enters a correct password then SignInBLoC is called',
      (tester) async {
    // arrange

    _signInState(const SignInState.initial());

    await _pumpPage(tester);

    await tester.enterText(_passwordInput(), 'teste@teste.com');

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verify(_mockSignInBloc.add(any)).called(1);
  });
}
