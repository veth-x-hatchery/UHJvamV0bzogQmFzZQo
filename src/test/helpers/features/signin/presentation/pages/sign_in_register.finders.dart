import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

Finder signInRegisterPageCredentialInput() {
  // arrange
  final credentialInput = find
      .byKey(const Key(SignInPageKeys.signInRegisterPageCredentialTextField));
  // Act && Assert
  // expect(credentialInput, findsOneWidget);
  return credentialInput;
}

Finder signInRegisterPageSecretInput() {
  // arrange
  final secretInput =
      find.byKey(const Key(SignInPageKeys.signInRegisterPageSecretTextField));
  // Act && Assert
  // expect(secretInput, findsOneWidget);
  return secretInput;
}

Finder signInRegisterPageCredentialValidationButton() {
  // arrange
  final validationButton =
      find.byKey(const Key(SignInPageKeys.signInRegisterPageValidateButton));
  // Act && Assert
  expect(validationButton, findsOneWidget);
  return validationButton;
}
