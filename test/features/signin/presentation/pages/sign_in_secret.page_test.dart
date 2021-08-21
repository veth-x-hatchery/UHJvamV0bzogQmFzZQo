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

@GenerateMocks([SignInSecretBloc])
void main() {
  late MockSignInSecretBloc _mockBloc;

  setUp(() {
    _mockBloc = MockSignInSecretBloc();
  });

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          Scaffold(
            body: SignInSecretPage.create(bloc: _mockBloc),
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

    await tester.pump();

    // assert

    verify(_mockBloc.add(any)).called(1);
  });
}
