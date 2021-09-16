import 'package:flutter_test/flutter_test.dart';
import 'package:hatchery/core/utils/logger.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_auth.service.mock.dart';

import '../../../../test/helpers/features/signin/presentation/pages/sign_in_credential.finders.dart';
import '../helpers/sign_in_integration_tests_helpers.dart';

Future<void> signInEmailEnterEmail(WidgetTester tester,
    {required String text}) async {
  await tester.tap(signInCredentialPageInput());
  await tester.pumpAndSettle();
  await tester.enterText(signInCredentialPageInput(), text);
  await tester.pumpAndSettle();
  await hideKeyboard(tester);
}

Future<void> signInEmailEnterAnInvalidEmail(WidgetTester tester) async {
  Logger.tests('Enter an invalid email');
  await signInEmailEnterEmail(tester,
      text: AuthServiceMock.invalidCredential.inputedValue!);
}

Future<void> signInEmailEnterAvalidEmail(WidgetTester tester) async {
  Logger.tests('Enter a valid registered email');
  await signInEmailEnterEmail(tester,
      text: AuthServiceMock.validTestCredential.inputedValue!);
}

Future<void> signInEmailSubmitEmail(WidgetTester tester) async {
  Logger.tests('Submiting email');
  await tester.ensureVisible(signInCredentialPageValidationButton());
  await tester.pumpAndSettle();
  await tester.tap(signInCredentialPageValidationButton());
  await tester.pumpAndSettle();
}

Future<void> signInEmailSignInCredentialGoBackPage(WidgetTester tester) async {
  Logger.tests('Go back');
  await tester.tap(signInBackPageButton());
  await tester.pumpAndSettle();
}
