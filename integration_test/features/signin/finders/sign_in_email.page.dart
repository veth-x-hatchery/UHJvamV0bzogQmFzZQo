import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/core/utils/logger.dart';

import '../../../../test/helpers/features/signin/presentation/pages/sign_in_credential.helpers.dart';
import '../sign_in_integration_tests_helpers.dart';

Future<void> enterEmail(WidgetTester tester, {required String text}) async {
  await tester.tap(signInCredentialPageInput());
  await tester.pumpAndSettle();
  await tester.enterText(signInCredentialPageInput(), text);
  await tester.pumpAndSettle();
  await hideKeyboard(tester);
}

Future<void> enterAnInvalidEmail(WidgetTester tester) async {
  Logger.tests('Enter an invalid email');
  await enterEmail(tester, text: 'invalid-email');
}

Future<void> enterAvalidRegisteredEmail(WidgetTester tester) async {
  Logger.tests('Enter a valid registered email');
  await enterEmail(tester, text: 'a@a.com');
}

Future<void> submitEmail(WidgetTester tester) async {
  Logger.tests('Submiting email');
  await tester.ensureVisible(signInCredentialPageValidationButton());
  await tester.pumpAndSettle();
  await tester.tap(signInCredentialPageValidationButton());
  await tester.pumpAndSettle();
}

Future<void> signInCredentialGoBackPage(WidgetTester tester) async {
  Logger.tests('Go back');
  await tester.tap(signInBackPageButton());
  await tester.pumpAndSettle();
}
