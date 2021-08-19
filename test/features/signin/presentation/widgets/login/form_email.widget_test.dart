import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

import '../../../../../helpers/widgets/pumpWidget.widget.dart';

import 'form_email.widget_test.mocks.dart';

@GenerateMocks([SignInBloc])
void main() {
  late MockSignInBloc _mockSignInBloc;

  setUp(() {
    _mockSignInBloc = MockSignInBloc();
  });

  Future<void> _pumpEmailForm(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          Scaffold(
            body: BlocProvider<SignInBloc>(
              create: (context) => _mockSignInBloc,
              child: const FormEmail(),
            ),
          ),
        ),
      ),
    );
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

    await _pumpEmailForm(tester);

    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInEmailPageValidateButton));

    // Act

    await tester.tap(validationButton);

    // assert

    expect(validationButton, findsOneWidget);
  });

  testWidgets('should find the email input', (tester) async {
    // arrange

    await _pumpEmailForm(tester);

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

    await _pumpEmailForm(tester);

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(_mockSignInBloc.add(any));
  });

  testWidgets('when user enters a correct email then SignInBLoC is called',
      (tester) async {
    // arrange

    when(_mockSignInBloc.stream)
        .thenAnswer((_) => Stream.value(const SignInState.initial()));

    await _pumpEmailForm(tester);

    await tester.enterText(_emailInput(), 'teste@teste.com');

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verify(_mockSignInBloc.add(any)).called(1);
  });
}
