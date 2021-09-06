import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatchery/features/signin/presentation/widgets/sign_in.widgets.dart';

Finder signInCredentialPageInput() {
  // arrange
  final credentialInput = find
      .byKey(const Key(SignInPageKeys.signInCredentialPageCredentialTextField));
  // Act && Assert
  expect(credentialInput, findsOneWidget);
  return credentialInput;
}

Finder signInCredentialPageValidationButton() {
  // arrange
  final validationButton =
      find.byKey(const Key(SignInPageKeys.signInCredentialPageValidateButton));
  // Act && Assert
  expect(validationButton, findsOneWidget);
  return validationButton;
}

Finder signInBackPageButton() {
  // arrange
  final button = find.byKey(const Key(SignInPageKeys.signInBackPageButton));
  // Act && Assert
  expect(button, findsOneWidget);
  return button;
}
