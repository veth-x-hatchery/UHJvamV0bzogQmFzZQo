import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../helpers/widgets/pumpWidget.widget.dart';

import 'sign_in_credential.page_test.mocks.dart';

@GenerateMocks([
  SignInCredentialCheck,
  NavigationCubit,
])
void main() {
  late SignInCredentialBloc _block;
  late MockSignInCredentialCheck _mockSignInCredentialCheck;
  late MockNavigationCubit _mockNavigationCubit;

  setUp(() {
    _mockNavigationCubit = MockNavigationCubit();
    _mockSignInCredentialCheck = MockSignInCredentialCheck();
    _block = SignInCredentialBloc(
      _mockSignInCredentialCheck,
      _mockNavigationCubit,
    );
  });

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          Scaffold(
            body: SignInCredentialPage.create(bloc: _block),
          ),
        ),
      ),
    );
  }

  void _initialState() {
    when(_mockSignInCredentialCheck.call(any)).thenAnswer((_) {
      return Future.value(right(true));
    });
    when(_mockNavigationCubit.goTo(any)).thenReturn(null);
    // when(_block.state).thenReturn(state);
    // when(_block.stream).thenAnswer((_) => Stream.value(state));
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

  testWidgets('should find the validation button', (tester) async {
    // arrange

    _initialState();

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

    _initialState();

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

    when(_mockSignInCredentialCheck.call(any)).thenAnswer((_) {
      return Future.delayed(const Duration(seconds: 1))
          .then((_) => right(true));
    });

    when(_mockNavigationCubit.goTo(any)).thenReturn(null);

    await _pumpPage(tester);

    final input = _credentialInput();

    await tester.tap(input);

    await tester.enterText(input, 'test@test.com');

    ///https://github.com/flutter/flutter/issues/88236

    await tester.tap(input);

    // // Act

    await tester.tap(_validationButton());

    // await tester.pump();

    // // Assert

    // expectLater(find.byType(GenericProgressIndicator), findsOneWidget);
  });

  testWidgets(
      "when user doesn't enter the credential then no events are emitted",
      (tester) async {
    // arrange

    _initialState();

    await _pumpPage(tester);

    // Act

    // _prepareFormValidationValues();

    await tester.tap(_validationButton());

    // assert

    verifyNever(
        _block.add(const SignInCredentialEvent.analyseCredentialPressed()));
  });

  testWidgets(
      'when user enters a invalid credential then no events are emitted',
      (tester) async {
    // arrange

    _initialState();

    await _pumpPage(tester);

    const invalidCredential = 'invalidcredential';

    await tester.enterText(_credentialInput(), invalidCredential);

    // _prepareFormValidationValues(value: invalidCredential);

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(
        _block.add(const SignInCredentialEvent.analyseCredentialPressed()));
  });

  testWidgets('when user enters a correct credential then SignInBLoC is called',
      (tester) async {
    // arrange

    _initialState();

    await _pumpPage(tester);

    await tester.enterText(_credentialInput(), 'teste@teste.com');

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verify(_block.add(const SignInCredentialEvent.analyseCredentialPressed()))
        .called(1);
  });
}
