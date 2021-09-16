import 'package:flutter_test/flutter_test.dart';
import 'package:hatchery/core/utils/logger.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_auth.service.mock.dart';

import '../../../../test/helpers/features/signin/presentation/pages/sign_in_register.finders.dart';
import '../helpers/sign_in_integration_tests_helpers.dart';

Future<void> signInRegisterEnterEmail(WidgetTester tester,
    {required String text}) async {
  await tester.tap(signInRegisterPageCredentialInput());
  await tester.pumpAndSettle();
  await tester.enterText(signInRegisterPageCredentialInput(), text);
  await tester.pumpAndSettle();
  await hideKeyboard(tester);
}

Future<void> signInRegisterEnterAnInvalidEmail(WidgetTester tester) async {
  Logger.tests('Enter an invalid email');
  await signInRegisterEnterEmail(tester,
      text: AuthServiceMock.invalidCredential.inputedValue!);
}

Future<void> signInRegisterEnterAvalidEmail(WidgetTester tester) async {
  Logger.tests('Enter a valid registered email');
  await signInRegisterEnterEmail(tester,
      text: AuthServiceMock.validTestCredential.inputedValue!);
}

Future<void> signInRegisterEnterSecret(WidgetTester tester,
    {required String text}) async {
  await tester.pumpAndSettle();
  await tester.tap(signInRegisterPageSecretInput());
  await tester.pumpAndSettle();
  await tester.enterText(signInRegisterPageSecretInput(), text);
  await tester.pumpAndSettle();
  await hideKeyboard(tester);
}

Future<void> signInRegisterEnterAnInvalidSecret(WidgetTester tester) async {
  Logger.tests('Enter an invalid password');
  await signInRegisterEnterSecret(tester,
      text: AuthServiceMock.invalidSecret.getOrCrash());
}

Future<void> signInRegisterEnterAvalidSecret(WidgetTester tester) async {
  Logger.tests('Enter a valid registered password');
  await signInRegisterEnterSecret(tester,
      text: AuthServiceMock.validTestSecret.getOrCrash());
}

Future<void> signInRegisterSubmitRegister(WidgetTester tester) async {
  Logger.tests('Submiting credentials');
  await tester.ensureVisible(signInRegisterPageCredentialValidationButton());
  await tester.pumpAndSettle();
  await tester.tap(signInRegisterPageCredentialValidationButton());
  await tester.pumpAndSettle();
}
