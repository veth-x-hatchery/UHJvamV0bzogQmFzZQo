import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/core/utils/logger.dart';

import '../../../../test/helpers/features/signin/presentation/pages/sign_in_secret.helpers.dart';

Future<void> enterSecret(WidgetTester tester, {required String text}) async {
  await tester.tap(signInSecretInput());
  await tester.pumpAndSettle();
  await tester.enterText(signInSecretInput(), text);
  await tester.pumpAndSettle();
}

Future<void> enterAnInvalidSecret(WidgetTester tester) async {
  Logger.tests('Enter an invalid password');
  await enterSecret(tester, text: '1234');
}

Future<void> enterAvalidRegisteredSecret(WidgetTester tester) async {
  Logger.tests('Enter a valid registered password');
  await enterSecret(tester, text: '123456');
}

Future<void> submitSecret(WidgetTester tester) async {
  Logger.tests('Submiting password');
  await tester.ensureVisible(signInSecretValidationButton());
  await tester.pumpAndSettle();
  await tester.tap(signInSecretValidationButton());
  await tester.pumpAndSettle();
}

Future<void> changeCredential(WidgetTester tester) async {
  Logger.tests('Changing email, going to Credential Page');
  await tester.ensureVisible(signInSecretChangeCredentialButton());
  await tester.pumpAndSettle();
  await tester.tap(signInSecretChangeCredentialButton());
  await tester.pumpAndSettle();
}

Future<void> forgotSecret(WidgetTester tester) async {
  Logger.tests('Forgot password, will emmit a notification');
  await tester.ensureVisible(signInSecretResetButton());
  await tester.pumpAndSettle();
  await tester.tap(signInSecretResetButton());
  await tester.pumpAndSettle();
}

Future<void> signInSecretGoBackPage(WidgetTester tester) async {
  Logger.tests('Go back');
  await tester.tap(signInBackPageButton());
  await tester.pumpAndSettle();
}
