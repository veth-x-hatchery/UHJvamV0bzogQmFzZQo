import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../helpers/features/signin/presentation/pages/sign_in_credential.finders.dart';
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

  tearDown(() {
    _sl.dispose();
    getIt.reset();
  });

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      setupToPump(
        Scaffold(
          body: SignInCredentialPage.create(serviceLocator: _sl),
        ),
      ),
    );
  }

  void _signInState(SignInCredentialState state) {
    when(_sl.mockSignInCredentialBloc.state).thenReturn(state);
    when(_sl.mockSignInCredentialBloc.stream)
        .thenAnswer((_) => Stream.value(state));
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
    when(_sl.mockSignInCredentialBloc.state).thenReturn(state);
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
      credential: AuthFacadeMock.validTestCredential,
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

    await tester.tap(signInCredentialPageInput());

    // assert

    verifyNever(_sl.mockSignInCredentialBloc
        .add(const SignInCredentialEvent.analyseCredentialPressed()));
  });

  testWidgets(
      'when user enters a invalid credential then no events are emitted',
      (tester) async {
    // arrange

    _signInState(SignInCredentialState.initial());

    await _pumpPage(tester);

    const invalidCredential = 'invalidcredential';

    await tester.enterText(signInCredentialPageInput(), invalidCredential);

    _prepareFormValidationValues(value: invalidCredential);

    // Act

    await tester.tap(signInCredentialPageValidationButton());

    await tester.pump();

    // assert

    verifyNever(_sl.mockSignInCredentialBloc
        .add(const SignInCredentialEvent.analyseCredentialPressed()));
  });

  testWidgets('when user enters a correct credential then SignInBLoC is called',
      (tester) async {
    // arrange

    _signInState(SignInCredentialState.initial());

    await _pumpPage(tester);

    await tester.enterText(signInCredentialPageInput(),
        AuthFacadeMock.validTestCredential.inputedValue!);

    _prepareFormValidationValues(
        value: AuthFacadeMock.validTestCredential.inputedValue);

    // Act

    await tester.tap(signInCredentialPageValidationButton());

    // assert

    verify(_sl.mockSignInCredentialBloc
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
      credential: AuthFacadeMock.validTestCredential,
      isLoading: false,
      authFailureOrSuccessOption: some(Left(expectedFailure)),
      notification:
          optionOf(VethxNotification.snack(message: expectedFailure.message)),
    ));

    await _pumpPage(tester);

    await tester.pumpAndSettle();

    // Act && Assert

    expect(find.text(expectedFailure.l10nFromMessage(tester.l10n)!),
        findsOneWidget);
  });
}
