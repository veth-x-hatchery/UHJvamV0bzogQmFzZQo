import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hatchery/core/notifications/notification.dart';
import 'package:hatchery/core/shared_kernel/shared_kernel.dart';
import 'package:hatchery/features/signin/domain/entities/value_objects.dart';
import 'package:hatchery/features/signin/domain/services/auth_failure.dart';
import 'package:hatchery/features/signin/domain/usecases/sign_in_secret_reset.dart';
import 'package:hatchery/features/signin/domain/usecases/sign_in_with_secret.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_auth.service.mock.dart';
import 'package:hatchery/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc.dart';
import 'package:hatchery/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';
import 'package:hatchery/features/signin/presentation/pages/sign_in_secret.page.dart';
import 'package:hatchery/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:hatchery/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:hatchery/l10n/l10n.dart';
import 'package:hatchery/ui/widgets/shared/progress-indicator.widget.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/features/signin/presentation/pages/sign_in_secret.finders.dart';
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
          body: SignInSecretPage.create(serviceLocator: _sl),
        ),
      ),
    );
  }

  void _scretResetBlocState(SignInSecretResetState state) {
    when(_sl.mockSignInSecretResetBloc.state).thenReturn(state);
    when(_sl.mockSignInSecretResetBloc.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  void _secretBlocState(SignInSecretState state) {
    when(_sl.mockSignInSecretBloc.state).thenReturn(state);
    when(_sl.mockSignInSecretBloc.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  void _navigationCubitState() {
    when(_sl.mockNavigationManager.goTo(any)).thenReturn(null);
    when(_sl.mockNavigationManager.stream)
        .thenAnswer((_) => Stream.value(SignInPageGoTo.optionsPage()));
  }

  void _setInitialState() {
    _secretBlocState(SignInSecretState.initial());
    _scretResetBlocState(SignInSecretResetState.initial());
    _navigationCubitState();
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
      notification: none(),
    );
    when(_sl.mockSignInSecretBloc.state).thenReturn(state);
  }

  testWidgets('should find the change credential reset button', (tester) async {
    // arrange

    _setInitialState();

    await _pumpPage(tester);

    final button =
        find.byKey(const Key(SignInPageKeys.signInChangeCredentialButton));

    // Act

    await tester.tap(button);

    // assert

    expect(button, findsOneWidget);
  });

  testWidgets('should find the secret reset button', (tester) async {
    // arrange

    _setInitialState();

    await _pumpPage(tester);

    final button =
        find.byKey(const Key(SignInPageKeys.signInsecretResetButton));

    // Act

    await tester.tap(button);

    // assert

    expect(button, findsOneWidget);
  });

  testWidgets('should find the validation button', (tester) async {
    // arrange

    _setInitialState();

    await _pumpPage(tester);

    final button =
        find.byKey(const Key(SignInPageKeys.signInSecretPageValidateButton));

    // Act

    await tester.tap(button);

    // assert

    expect(button, findsOneWidget);
  });

  testWidgets('should find the secret input', (tester) async {
    // arrange

    _setInitialState();

    await _pumpPage(tester);

    final input =
        find.byKey(const Key(SignInPageKeys.signInSecretPageSecretTextField));

    // Act

    await tester.tap(input);

    // assert

    expect(input, findsOneWidget);
  });

  testWidgets('when receive loading event then should show a circular progress',
      (tester) async {
    // Arrange

    _scretResetBlocState(SignInSecretResetState.initial());

    _secretBlocState(SignInSecretState(
      isLoading: true,
      secret: Secret(''),
      authFailureOrSuccessOption: none(),
      notification: none(),
    ));

    await _pumpPage(tester);

    // Act && Assert

    expect(find.byType(GenericProgressIndicator), findsOneWidget);
  });

  testWidgets("when user doesn't enter the secret then no events are emitted",
      (tester) async {
    // arrange

    _setInitialState();

    await _pumpPage(tester);

    // Act

    _prepareFormValidationValues();

    await tester.tap(signInSecretValidationButton());

    await tester.pump();

    // assert

    verifyNever(_sl.mockSignInSecretBloc.add(any));
  });

  testWidgets('when user enters a invalid secret then no events are emitted',
      (tester) async {
    // arrange

    _setInitialState();

    await _pumpPage(tester);

    final invalidSecret = AuthServiceMock.invalidSecret.inputedValue!;

    await tester.enterText(signInSecretInput(), invalidSecret);

    // Act

    _prepareFormValidationValues(value: invalidSecret);

    await tester.tap(signInSecretValidationButton());

    await tester.pump();

    // assert

    verifyNever(_sl.mockSignInSecretBloc
        .add(const SignInSecretEvent.analyseSecretPressed()));
  });

  testWidgets('when user enters a correct secret then SignInBLoC is called',
      (tester) async {
    // arrange

    _setInitialState();

    await _pumpPage(tester);

    const validSecret = 'dmFsaWRwYXNzd29yZAo';

    await tester.enterText(signInSecretInput(), validSecret);

    _prepareFormValidationValues(value: validSecret);

    // Act

    await tester.tap(signInSecretValidationButton());

    // assert

    verify(_sl.mockSignInSecretBloc
            .add(const SignInSecretEvent.analyseSecretPressed()))
        .called(1);
  });

  testWidgets('when secret is validated with success should pop the page',
      (tester) async {
    // arrange

    _setInitialState();

    await _pumpPage(tester);

    // Act

    await tester.tap(signInSecretChangeCredentialButton());

    // assert

    // verify(_sl.mockNavigationManager).called(1);
  });

  testWidgets('when receive a failure then should show a snack message',
      (tester) async {
    // Arrange

    final secret = AuthServiceMock.validTestSecret.inputedValue!;

    final valueObject = Secret(secret);

    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCachedCredential(),
      message: SignInWithSecretErrorMessages.invalidCachedCredential(),
    );

    _scretResetBlocState(SignInSecretResetState.initial());

    _secretBlocState(SignInSecretState(
      secret: valueObject,
      isLoading: false,
      authFailureOrSuccessOption: some(Left(expectedFailure)),
      notification:
          optionOf(VethxNotification.snack(message: expectedFailure.message)),
    ));

    await _pumpPage(tester);

    await tester.pumpAndSettle();

    // Act && Assert

    expect(find.text(expectedFailure.message.translate(tester.l10n)),
        findsOneWidget);
  });

  group('when request change credentials', () {
    testWidgets('should trigger the change credential event', (tester) async {
      // arrange

      _setInitialState();

      await _pumpPage(tester);

      // Act

      await tester.tap(signInSecretChangeCredentialButton());

      // assert

      verify(_sl.mockNavigationManager.goTo(any)).called(1);
    });
  });

  group('when request secret reset', () {
    testWidgets('should trigger the reset password event', (tester) async {
      // arrange

      _setInitialState();

      await _pumpPage(tester);

      // Act

      await tester.tap(signInSecretResetButton());

      // assert

      verify(_sl.mockSignInSecretResetBloc
              .add(const SignInSecretResetEvent.secretResetRequest()))
          .called(1);
    });

    testWidgets('when receive a failure then should show a snack message',
        (tester) async {
      // Arrange

      final expectedFailure = FailureDetails(
        failure: const AuthFailure.invalidCachedCredential(),
        message: SignInSecretResetMessages.invalidCachedCredential(),
      );

      _secretBlocState(SignInSecretState.initial());

      _scretResetBlocState(SignInSecretResetState(
        isLoading: false,
        notification:
            optionOf(VethxNotification.snack(message: expectedFailure.message)),
      ));

      await _pumpPage(tester);

      await tester.pumpAndSettle();

      // Act && Assert

      expect(find.text(expectedFailure.message.translate(tester.l10n)),
          findsOneWidget);
    });

    testWidgets('when request a reset should show a progress indicator',
        (tester) async {
      // Arrange

      _secretBlocState(SignInSecretState.initial());

      _scretResetBlocState(SignInSecretResetState(
        isLoading: true,
        notification: none(),
      ));

      await _pumpPage(tester);

      // Act && Assert

      expect(find.byType(GenericProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'when reset secret result a success should show a snack message',
        (tester) async {
      // Arrange

      _secretBlocState(SignInSecretState.initial());

      _scretResetBlocState(SignInSecretResetState(
        isLoading: false,
        notification: optionOf(VethxNotification.snack(
            message: SignInSecretResetMessages.success())),
      ));

      await _pumpPage(tester);

      await tester.pumpAndSettle();

      // Act && Assert

      expect(
          find.text(SignInSecretResetMessages.success().translate(tester.l10n)),
          findsOneWidget);
    });
  });
}
