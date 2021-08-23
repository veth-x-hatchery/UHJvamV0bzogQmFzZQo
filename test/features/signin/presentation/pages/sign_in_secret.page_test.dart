import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/notifications/notification.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_secret_reset.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_secret.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_secret.page.dart';
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

  tearDown(() {
    _sl.dispose();
    getIt.reset();
  });

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          Scaffold(
            body: SignInSecretPage.create(serviceLocator: _sl),
          ),
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
    when(_sl.mockNavigationCubit.goTo(any)).thenReturn(null);
    when(_sl.mockNavigationCubit.stream)
        .thenAnswer((_) => Stream.value(const NavigationState.initial()));
  }

  void _setInitialState() {
    _secretBlocState(SignInSecretState.initial());
    _scretResetBlocState(SignInSecretResetState.initial());
    _navigationCubitState();
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

  Finder _changeCredentialButton() {
    // arrange
    final button =
        find.byKey(const Key(SignInPageKeys.signInChangeCredentialButton));
    // Act && Assert
    expect(button, findsOneWidget);
    return button;
  }

  Finder _secretResetButton() {
    // arrange
    final secretResetButton =
        find.byKey(const Key(SignInPageKeys.signInsecretResetButton));
    // Act && Assert
    expect(secretResetButton, findsOneWidget);
    return secretResetButton;
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

    await tester.tap(_validationButton());

    await tester.pump();

    // assert

    verifyNever(_sl.mockSignInSecretBloc.add(any));
  });

  testWidgets('when user enters a invalid secret then no events are emitted',
      (tester) async {
    // arrange

    _setInitialState();

    await _pumpPage(tester);

    const invalidSecret = '1234';

    await tester.enterText(_secretInput(), invalidSecret);

    // Act

    _prepareFormValidationValues(value: invalidSecret);

    await tester.tap(_validationButton());

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

    await tester.enterText(_secretInput(), validSecret);

    _prepareFormValidationValues(value: validSecret);

    // Act

    await tester.tap(_validationButton());

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

    await tester.tap(_changeCredentialButton());

    // assert

    // verify(_sl.mockNavigationCubit).called(1);
  });

  testWidgets('when receive a failure then should show a snack message',
      (tester) async {
    // Arrange

    const secret = 'dmFsaWRwYXNzd29yZAo';

    final valueObject = Secret(secret);

    final expectedFailure = FailureDetails(
      failure: const AuthFailure.invalidCachedCredential(),
      message: SignInWithSecretErrorMessages.invalidCachedCredential,
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

    expect(find.text(expectedFailure.message), findsOneWidget);
  });

  group('when request change credentials', () {
    testWidgets('should trigger the change credential event', (tester) async {
      // arrange

      _setInitialState();

      await _pumpPage(tester);

      // Act

      await tester.tap(_changeCredentialButton());

      // assert

      verify(_sl.mockNavigationCubit.goTo(any)).called(1);
    });
  });

  group('when request secret reset', () {
    testWidgets('should trigger the reset password event', (tester) async {
      // arrange

      _setInitialState();

      await _pumpPage(tester);

      // Act

      await tester.tap(_secretResetButton());

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
        message: SignInSecretResetMessages.invalidCachedCredential,
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

      expect(find.text(expectedFailure.message), findsOneWidget);
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
            message: SignInSecretResetMessages.success)),
      ));

      await _pumpPage(tester);

      await tester.pumpAndSettle();

      // Act && Assert

      expect(find.text(SignInSecretResetMessages.success), findsOneWidget);
    });
  });
}
