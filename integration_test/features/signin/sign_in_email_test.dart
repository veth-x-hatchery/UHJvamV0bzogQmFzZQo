import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/home/presentation/pages/home.page.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_secret.page.dart';
import 'package:vethx_beta/main.dart' as app;

import 'finders/sign_in_email.page.dart';
import 'finders/sign_in_secret.page.dart';
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

  group('sign in with email tests', () {
    testWidgets('should show invalid email message',
        (WidgetTester tester) async {
      const prefix = 'case-1';

      final parameters = IntegrationTestsParameters(
        widgetTester: tester,
        helper: helper,
      );

      Logger.tests('1 - Sign in options');
      await startingSignInOptions(parameters);
      expect(find.byType(SignInOptionsPage), findsOneWidget);
      await helper.screenshot(prefix: prefix, name: '1_sign_in_options');

      Logger.tests('1.1 - Sign in with email');
      await goToEmailPage(parameters);
      expect(find.byType(SignInCredentialPage), findsOneWidget);
      await helper.screenshot(prefix: prefix, name: '1.1_sign_in_with_email');

      Logger.tests('1.1.1 - Invalid email message');
      await enterAnInvalidEmail(tester);
      await submitEmail(tester);
      expect(find.text(CredentialAddressMessageErrors.invalidCredential),
          findsOneWidget);
      await helper.screenshot(
          prefix: prefix, name: '1.1.1_invalid_email_message');

      Logger.tests('Goto:  1.1 - Sign in with email');
      await signInCredentialGoBackPage(tester);
      expect(find.byType(SignInOptionsPage), findsOneWidget);
      await goToEmailPage(parameters);

      Logger.tests('1.2 - Valid Registered email');
      await enterAvalidRegisteredEmail(tester);
      await helper.screenshot(
          prefix: prefix, name: '1.2_valid_registered_email');

      Logger.tests('1.2.1 - Go To Secret Page');
      await submitEmail(tester);
      expect(find.byType(SignInSecretPage), findsOneWidget);
      await helper.screenshot(prefix: prefix, name: '1.2.1_go_to_secret_page');

      Logger.tests('1.2.1.1 - Forgot my password');
      await forgotSecret(tester);
      expect(find.byType(SnackBar), findsOneWidget);
      await helper.screenshot(
          prefix: prefix, name: '1.2.1.1_forgot_my_password');

      Logger.tests('1.2.1.2 - Change my email');
      await signInSecretDragChangeCredentialButton(tester);
      await helper.screenshot(prefix: prefix, name: '1.2.1.2_change_my_email');
      await changeCredential(tester);
      expect(find.byType(SignInCredentialPage), findsOneWidget);

      Logger.tests('Goto:  1.1 - Sign in with email');
      Logger.tests('Goto:  1.2 - Valid Registered email');
      await enterAvalidRegisteredEmail(tester);
      Logger.tests('Goto:  1.2.1 - Go To Secret Page');
      await submitEmail(tester);

      Logger.tests('1.2.1.2 - Enter a valid password');
      await enterAvalidRegisteredSecret(tester);
      await helper.screenshot(
          prefix: prefix, name: '1.2.1.2_enter_a_valid_password');

      Logger.tests('1.2.1.3 - Authenticate with success and go to Home Page');
      await submitSecret(tester);
      await helper.screenshot(
          prefix: prefix,
          name: '1.2.1.3_authenticate_with_success_and_go_to_home_page');
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
