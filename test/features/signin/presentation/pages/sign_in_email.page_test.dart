import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_email.page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

import '../../../../helpers/widgets/pumpWidget.widget.dart';

import 'sign_in_email.page_test.mocks.dart';

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
            body: BlocProvider<SignInBloc>(
              create: (context) => _mockSignInBloc,
              child: const SignInEmailPage(),
            ),
          ),
        ),
      ),
    );
  }

  void _signInState(SignInState state) {
    when(_mockSignInBloc.state).thenReturn(state);
    when(_mockSignInBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  Finder _emailInput() {
    // arrange
    final emailInput =
        find.byKey(const Key(SignInPageKeys.signInEmailPageEmailTextField));
    // Act && Assert
    expect(emailInput, findsOneWidget);
    return emailInput;
  }

  Finder _validationButton() {
    // arrange
    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInEmailPageValidateButton));
    // Act && Assert
    expect(validationButton, findsOneWidget);
    return validationButton;
  }

  testWidgets('should find the validation button', (tester) async {
    // arrange

    _signInState(const SignInState.initial());

    await _pumpPage(tester);

    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInEmailPageValidateButton));

    // Act

    await tester.tap(validationButton);

    // assert

    expect(validationButton, findsOneWidget);
  });

  testWidgets('should find the email input', (tester) async {
    // arrange

    _signInState(const SignInState.initial());

    await _pumpPage(tester);

    final emailInput =
        find.byKey(const Key(SignInPageKeys.signInEmailPageEmailTextField));

    // Act

    await tester.tap(emailInput);

    // assert

    expect(emailInput, findsOneWidget);
  });

  testWidgets("when user doesn't enter the email then no events are emitted",
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

  testWidgets('when user enters a invalid email then no events are emitted',
      (tester) async {
    // arrange

    _signInState(const SignInState.initial());

    when(_mockSignInBloc.stream)
        .thenAnswer((_) => Stream.value(const SignInState.initial()));

    await _pumpPage(tester);

    await tester.enterText(_emailInput(), 'invalidemail');

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(_mockSignInBloc.add(any));
  });

  testWidgets('when user enters a correct email then SignInBLoC is called',
      (tester) async {
    // arrange

    _signInState(const SignInState.initial());

    when(_mockSignInBloc.stream)
        .thenAnswer((_) => Stream.value(const SignInState.initial()));

    await _pumpPage(tester);

    await tester.enterText(_emailInput(), 'teste@teste.com');

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verify(_mockSignInBloc.add(any)).called(1);
  });
}
