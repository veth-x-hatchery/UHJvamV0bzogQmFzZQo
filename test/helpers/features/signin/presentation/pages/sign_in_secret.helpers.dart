import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

Finder secretInput() {
  // arrange
  final secretInput =
      find.byKey(const Key(SignInPageKeys.signInSecretPageSecretTextField));
  // Act && Assert
  expect(secretInput, findsOneWidget);
  return secretInput;
}

Finder validationButton() {
  // arrange
  final validationButton =
      find.byKey(const Key(SignInPageKeys.signInSecretPageValidateButton));
  // Act && Assert
  expect(validationButton, findsOneWidget);
  return validationButton;
}

Finder changeCredentialButton() {
  // arrange
  final button =
      find.byKey(const Key(SignInPageKeys.signInChangeCredentialButton));
  // Act && Assert
  expect(button, findsOneWidget);
  return button;
}

Finder secretResetButton() {
  // arrange
  final secretResetButton =
      find.byKey(const Key(SignInPageKeys.signInsecretResetButton));
  // Act && Assert
  expect(secretResetButton, findsOneWidget);
  return secretResetButton;
}
