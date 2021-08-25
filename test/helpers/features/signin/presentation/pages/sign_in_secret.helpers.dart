import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

Finder signInSecretInput() {
  // arrange
  final secretInput =
      find.byKey(const Key(SignInPageKeys.signInSecretPageSecretTextField));
  // Act && Assert
  expect(secretInput, findsOneWidget);
  return secretInput;
}

Finder signInSecretValidationButton() {
  // arrange
  final validationButton =
      find.byKey(const Key(SignInPageKeys.signInSecretPageValidateButton));
  // Act && Assert
  expect(validationButton, findsOneWidget);
  return validationButton;
}

Finder signInSecretChangeCredentialButton() {
  // arrange
  final button =
      find.byKey(const Key(SignInPageKeys.signInChangeCredentialButton));
  // Act && Assert
  expect(button, findsOneWidget);
  return button;
}

Finder signInSecretResetButton() {
  // arrange
  final secretResetButton =
      find.byKey(const Key(SignInPageKeys.signInsecretResetButton));
  // Act && Assert
  expect(secretResetButton, findsOneWidget);
  return secretResetButton;
}

// Todo(v): duplicated
Finder signInBackPageButton() {
  // arrange
  final button = find.byKey(const Key(SignInPageKeys.signInBackPageButton));
  // Act && Assert
  expect(button, findsOneWidget);
  return button;
}

Finder signInSecretPageFormColumn() {
  // arrange
  final widget =
      find.byKey(const Key(SignInPageKeys.signInSecretPageFormColumn));
  // Act && Assert
  expect(widget, findsOneWidget);
  return widget;
}
