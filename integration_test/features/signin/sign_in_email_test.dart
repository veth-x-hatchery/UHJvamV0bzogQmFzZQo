import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_secret.page.dart';
import 'package:vethx_beta/main.dart' as app;

import '../../../test/helpers/features/signin/presentation/pages/sign_in_credential.helpers.dart';
import 'sign_in_integration_tests_helpers.dart';

void main() {
  final IntegrationTestWidgetsFlutterBinding _binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized()
          as IntegrationTestWidgetsFlutterBinding;

  late IntegrationTestsHelpers helper;

  /// This is required prior to taking the screenshot (Android only).
  Future<void> _setupAndroidScreenShots() async {
    await _binding.convertFlutterSurfaceToImage();
  }

  setUp(() async {
    app.main();

    await _setupAndroidScreenShots();

    helper = IntegrationTestsHelpers(binding: _binding);
  });

  tearDown(() => GetIt.instance.reset());

  Future<void> enterEmail(WidgetTester tester, {required String text}) async {
    await tester.tap(signInCredentialPageInput());
    await tester.pumpAndSettle();
    await tester.enterText(signInCredentialPageInput(), text);
    await tester.pumpAndSettle();
  }

  Future<void> enterAnInvalidEmail(WidgetTester tester) async {
    Logger.tests('Enter an invalid email');
    await enterEmail(tester, text: 'invalid-email');
  }

  Future<void> enterAvalidRegisteredEmail(WidgetTester tester) async {
    Logger.tests('Enter a valid registered email');
    await enterEmail(tester, text: 'test@vethx.com');
  }

  Future<void> submitEmail(WidgetTester tester) async {
    Logger.tests('Submiting the email');
    await tester.ensureVisible(signInCredentialPageValidationButton());
    await tester.pumpAndSettle();
    await tester.tap(signInCredentialPageValidationButton());
    await tester.pumpAndSettle();
  }

  Future<void> goBackPage(WidgetTester tester) async {
    Logger.tests('Go back');
    await tester.tap(signInBackPageButton());
    await tester.pumpAndSettle();
  }

  group('sign in with email tests', () {
    testWidgets('should show invalid email message',
        (WidgetTester tester) async {
      const prefix = 'case-1';

      final parameters = IntegrationTestsParameters(
        widgetTester: tester,
        helper: helper,
        prefix: prefix,
      );

      await goToEmailPage(parameters);

      await enterAnInvalidEmail(tester);

      await submitEmail(tester);

      expect(find.text(CredentialAddressMessageErrors.invalidCredential),
          findsOneWidget);

      await helper.screenshot(
        prefix: prefix,
        name: 'sign_in_email_invalid_email',
      );

      await goBackPage(tester);

      expect(find.byType(SignInOptionsPage), findsOneWidget);

      await goToEmailPage(parameters);

      await enterAvalidRegisteredEmail(tester);

      await helper.screenshot(
        prefix: prefix,
        name: 'sign_in_email_valid_registerd_email',
      );

      await submitEmail(tester);

      Logger.tests('Go to password page');

      expect(find.byType(SignInSecretPage), findsOneWidget);

      await helper.screenshot(
        prefix: prefix,
        name: 'sign_in_password_page',
      );
    });
  });
}
