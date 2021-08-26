import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/core/utils/logger.dart';

import '../../../../test/helpers/features/signin/presentation/pages/sign_in_register.finders.dart';
import '../helpers/sign_in_integration_tests_helpers.dart';

Future<void> enterEmail(WidgetTester tester, {required String text}) async {
  await tester.tap(signInRegisterPageCredentialInput());
  await tester.pumpAndSettle();
  await tester.enterText(signInRegisterPageCredentialInput(), text);
  await tester.pumpAndSettle();
  await hideKeyboard(tester);
}

Future<void> enterAnInvalidEmail(WidgetTester tester) async {
  Logger.tests('Enter an invalid email');
  await enterEmail(tester, text: 'invalid-email');
}

Future<void> enterAvalidUnregisteredEmail(WidgetTester tester) async {
  Logger.tests('Enter a valid registered email');
  await enterEmail(tester, text: 'a@a.com');
}

Future<void> enterSecret(WidgetTester tester, {required String text}) async {
  await tester.pumpAndSettle();
  await tester.tap(signInRegisterPageSecretInput());
  await tester.pumpAndSettle();
  await tester.enterText(signInRegisterPageSecretInput(), text);
  await tester.pumpAndSettle();
  await hideKeyboard(tester);
}

Future<void> enterAnInvalidSecret(WidgetTester tester) async {
  Logger.tests('Enter an invalid password');
  await enterSecret(tester, text: '1234');
}

Future<void> enterAvalidRegisteredSecret(WidgetTester tester) async {
  Logger.tests('Enter a valid registered password');
  await enterSecret(tester, text: '123456');
}

Future<void> submitRegister(WidgetTester tester) async {
  Logger.tests('Submiting credentials');
  await tester.ensureVisible(signInRegisterPageCredentialValidationButton());
  await tester.pumpAndSettle();
  await tester.tap(signInRegisterPageCredentialValidationButton());
  await tester.pumpAndSettle();
}
