import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

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
