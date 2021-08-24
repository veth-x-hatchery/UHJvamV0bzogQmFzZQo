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

  Future<void> _setupAndroidScreenShots() async {
    // This is required prior to taking the screenshot (Android only).
    await _binding.convertFlutterSurfaceToImage();
  }

  testWidgets('should show invalid email message', (WidgetTester tester) async {
    app.main();

    await _setupAndroidScreenShots();

    helper = IntegrationTestsHelpers(binding: _binding);

    const prefix = 'case-1';

    await goToEmailPage(
      prefix: prefix,
      tester: tester,
      helper: helper,
    );

    Logger.tests('3 - Invalid email message');

    await tester.tap(signInCredentialPageInput());
    await tester.pumpAndSettle();

    await tester.enterText(signInCredentialPageInput(), 'invalid-email');
    await tester.pumpAndSettle();

    await tester.ensureVisible(signInCredentialPageValidationButton());
    await tester.pumpAndSettle();

    await tester.tap(signInCredentialPageValidationButton());
    await tester.pumpAndSettle();

    expect(find.text(CredentialAddressMessageErrors.invalidCredential),
        findsOneWidget);

    await helper.screenshot(
      prefix: prefix,
      name: 'sign_in_email_invalid_email',
    );

    await tester.tap(signInBackPageButton());

    await tester.pumpAndSettle();

    expect(find.byType(SignInOptionsPage), findsOneWidget);
  });
  // group('sign in with email tests', () {
  //   setUp(() async {
  //     await _setupAndroidScreenShots();
  //     helper = IntegrationTestsHelpers(binding: _binding);
  //   });

  // testWidgets('should show accept the email and go to password page',
  //     (WidgetTester tester) async {
  //   const prefix = 'case-2';

  //   await goToEmailPage(
  //     tester: tester,
  //     helper: helper,
  //     prefix: prefix,
  //   );

  //   Logger.tests('3 - Valid email and go to password page');

  //   await tester.tap(signInCredentialPageInput());
  //   await tester.pumpAndSettle();

  //   await tester.enterText(signInCredentialPageInput(), 'test@vethx.com');
  //   await tester.pumpAndSettle();

  //   await tester.ensureVisible(signInCredentialPageValidationButton());
  //   await tester.pumpAndSettle();

  //   await tester.tap(signInCredentialPageValidationButton());
  //   await tester.pumpAndSettle();

  //   expect(find.byType(SignInSecretPage), findsOneWidget);

  //   await helper.screenshot(
  //     prefix: prefix,
  //     name: 'sign_in_password',
  //   );
  // });
  // });
}

/**
 * 
flutter drive --driver=test_driver/integration_test_driver_extended.dart \
--target=integration_test/app_test.dart
 */
