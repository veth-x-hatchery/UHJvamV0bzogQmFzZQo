import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_secret.page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../helpers/widgets/pumpWidget.widget.dart';

import 'sign_in_secret.page_test.mocks.dart';

@GenerateMocks([SignInPasswordBloc])
void main() {
  late MockSignInPasswordBloc _mockBloc;

  setUp(() {
    _mockBloc = MockSignInPasswordBloc();
  });

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          Scaffold(
            body: SignInPasswordPage.create(bloc: _mockBloc),
          ),
        ),
      ),
    );
  }

  void _signInState(SignInPasswordState state) {
    when(_mockBloc.state).thenReturn(state);
    when(_mockBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  Finder _secretInput() {
    // arrange
    final secretInput = find
        .byKey(const Key(SignInPageKeys.signInPasswordPagePasswordTextField));
    // Act && Assert
    expect(secretInput, findsOneWidget);
    return secretInput;
  }

  Finder _validationButton() {
    // arrange
    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInPasswordPageValidateButton));
    // Act && Assert
    expect(validationButton, findsOneWidget);
    return validationButton;
  }

  /// Form uses BLoC state to realize validations
  void _prepareFormValidationValues({
    String? value,
  }) {
    final credentialVO = Password(value);
    final state = SignInPasswordState(
      secret: credentialVO,
      isLoading: false,
      authFailureOrSuccessOption: none(),
    );
    when(_mockBloc.state).thenReturn(state);
  }

  testWidgets('should find the validation button', (tester) async {
    // arrange

    _signInState(SignInPasswordState.initial());

    await _pumpPage(tester);

    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInPasswordPageValidateButton));

    // Act

    await tester.tap(validationButton);

    // assert

    expect(validationButton, findsOneWidget);
  });

  testWidgets('should find the secret input', (tester) async {
    // arrange

    _signInState(SignInPasswordState.initial());

    await _pumpPage(tester);

    final secretInput = find
        .byKey(const Key(SignInPageKeys.signInPasswordPagePasswordTextField));

    // Act

    await tester.tap(secretInput);

    // assert

    expect(secretInput, findsOneWidget);
  });

  testWidgets('when receive loading event then should show a circular progress',
      (tester) async {
    // Arrange

    _signInState(SignInPasswordState(
      isLoading: true,
      secret: Password(''),
      authFailureOrSuccessOption: none(),
    ));

    await _pumpPage(tester);

    // Act && Assert

    expect(find.byType(GenericProgressIndicator), findsOneWidget);
  });

  testWidgets("when user doesn't enter the secret then no events are emitted",
      (tester) async {
    // arrange

    _signInState(SignInPasswordState.initial());

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

    _signInState(SignInPasswordState.initial());

    await _pumpPage(tester);

    const invalidPassword = '1234';

    await tester.enterText(_secretInput(), invalidPassword);

    // Act

    _prepareFormValidationValues(value: invalidPassword);

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(
        _mockBloc.add(const SignInPasswordEvent.analysePasswordPressed()));
  });

  testWidgets('when user enters a correct secret then SignInBLoC is called',
      (tester) async {
    // arrange

    _signInState(SignInPasswordState.initial());

    await _pumpPage(tester);

    const validPassword = 'dmFsaWRwYXNzd29yZAo';

    await tester.enterText(_secretInput(), validPassword);

    _prepareFormValidationValues(value: validPassword);

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verify(_mockBloc.add(any)).called(1);
  });
}
