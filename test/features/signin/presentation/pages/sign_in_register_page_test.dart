import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_credential_and_secret.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_register_page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../helpers/features/signin/sign_in_service_locator.mock.dart';
import '../../../../helpers/widgets/pumpWidget.widget.dart';

void main() {
  late MockISignInServiceLocator _sl;
  late GetIt getIt;

  setUp(() {
    getIt = GetIt.instance;
    _sl = MockISignInServiceLocator(getIt: getIt);
    _sl.init();
  });

  tearDown(() => getIt.reset());

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          Scaffold(
            body: SignInRegisterPage.create(serviceLocator: _sl),
          ),
        ),
      ),
    );
  }

  void _signInState(SignInRegisterState state) {
    when(_sl.mockSignInRegisterBloc.state).thenReturn(state);
    when(_sl.mockSignInRegisterBloc.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  Finder _credentialInput() {
    // arrange
    final credentialInput = find
        .byKey(const Key(SignInPageKeys.signInRegisterPageCredentialTextField));
    // Act && Assert
    // expect(credentialInput, findsOneWidget);
    return credentialInput;
  }

  Finder _secretInput() {
    // arrange
    final secretInput =
        find.byKey(const Key(SignInPageKeys.signInRegisterPageSecretTextField));
    // Act && Assert
    // expect(secretInput, findsOneWidget);
    return secretInput;
  }

  Finder _validationButton() {
    // arrange
    final validationButton =
        find.byKey(const Key(SignInPageKeys.signInRegisterPageValidateButton));
    // Act && Assert
    expect(validationButton, findsOneWidget);
    return validationButton;
  }

  const validCredential = 'test@test.com';
  const validSecret = 'dmFsaWRwYXNzd29yZAo';

  const invalidCredential = 'invalidcredential';
  const invalidSecret = '1234';

  /// Form uses BLoC state to realize validations
  void _prepareFormValidationValues({
    String? credential,
    String? secret,
  }) {
    final credentialVO = Credential(credential);
    final secretVO = Secret(secret);
    final state = SignInRegisterState(
      credential: credentialVO,
      secret: secretVO,
      isLoading: false,
      authFailureOrSuccessOption: none(),
      notification: none(),
    );
    when(_sl.mockSignInRegisterBloc.state).thenReturn(state);
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

      final credentialInput = find.byKey(
          const Key(SignInPageKeys.signInRegisterPageCredentialTextField));

      // Act

      await tester.tap(credentialInput);

      // assert

      expect(credentialInput, findsOneWidget);
    });

    testWidgets('should find the secret input', (tester) async {
      // arrange

      _signInState(SignInRegisterState.initial());

      await _pumpPage(tester);

      final credentialInput = find
          .byKey(const Key(SignInPageKeys.signInRegisterPageSecretTextField));

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
      credential: Credential(validCredential),
      secret: Secret(validSecret),
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

    _signInState(SignInRegisterState.initial());

    await _pumpPage(tester);

    _prepareFormValidationValues();

    // Act

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(_sl.mockSignInRegisterBloc.add(any));
  });

  testWidgets(
      'when user enters a invalid credential then no events are emitted',
      (tester) async {
    // arrange

    _signInState(SignInRegisterState.initial());

    await _pumpPage(tester);

    await tester.enterText(_credentialInput(), invalidCredential);

    _prepareFormValidationValues(credential: invalidCredential);

    // Act

    await tester.tap(_validationButton());

    // assert

    verifyNever(_sl.mockSignInRegisterBloc.add(
        const SignInRegisterEvent.registerWithCredentialAndSecretPressed()));
  });

  testWidgets('when user enters a invalid secret then no events are emitted',
      (tester) async {
    // arrange

    _signInState(SignInRegisterState.initial());

    await _pumpPage(tester);

    await tester.enterText(_credentialInput(), validCredential);

    await tester.enterText(_secretInput(), invalidSecret);

    _prepareFormValidationValues(
        credential: validCredential, secret: invalidSecret);

    // Act

    await tester.tap(_validationButton());

    // assert

    verifyNever(_sl.mockSignInRegisterBloc.add(
        const SignInRegisterEvent.registerWithCredentialAndSecretPressed()));
  });

  testWidgets(
      'when user enters valid credential and secret then SignInBLoC is called',
      (tester) async {
    // arrange

    _signInState(SignInRegisterState.initial());

    await _pumpPage(tester);

    await tester.enterText(_credentialInput(), validCredential);

    await tester.enterText(_secretInput(), validSecret);

    _prepareFormValidationValues(
        credential: validCredential, secret: validSecret);

    // Act

    await tester.tap(_validationButton());

    // assert

    verify(_sl.mockSignInRegisterBloc.add(
            const SignInRegisterEvent.registerWithCredentialAndSecretPressed()))
        .called(1);
  });

  testWidgets('when receive a failure then should show a snack message',
      (tester) async {
    // Arrange

    const credential = 'test@test.com';

    const secret = 'dmFsaWRwYXNzd29yZAo';

    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCredentialAndSecretCombination(),
      message: SignInRegisterCredentialAndSecretErrorMessages
          .invalidCredentialAndSecretCombination,
    );

    _signInState(SignInRegisterState(
      credential: Credential(credential),
      secret: Secret(secret),
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
