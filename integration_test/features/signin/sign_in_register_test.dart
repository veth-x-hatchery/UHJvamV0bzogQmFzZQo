import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:vethx_beta/core/notifications/messages.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/home/presentation/pages/home.page.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade_mock.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_secret.page.dart';
import 'package:vethx_beta/main.dart' as app;
import 'package:vethx_beta/service_locator.dart';

import 'finders/sign_in_email.page.dart';
import 'finders/sign_in_secret.page.dart';
import 'helpers/sign_in_integration_tests_helpers.dart';

void main() {
  final IntegrationTestWidgetsFlutterBinding _binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized()
          as IntegrationTestWidgetsFlutterBinding;

  late IntegrationTestsHelpers helper;

  /// This is required prior to taking the screenshot (Android only).
  Future<void> _setupAndroidScreenShots() async {
    await _binding.convertFlutterSurfaceToImage();
  }

  void setupAuth({
    required bool isCredentialAlreadyInUse,
  }) {
    Logger.tests('******************** setupAuth MOCK ***********************');
    getIt.unregister<IAuthFacade>();
    getIt.registerLazySingleton<IAuthFacade>(
      () => FirebaseAuthFacadeMock(
          isCredentialAlreadyInUse: isCredentialAlreadyInUse),
    );
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
      final parameters = IntegrationTestsParameters(
        widgetTester: tester,
        helper: helper,
      );

      const prefix = 'case-1';
      String step = '1_sign_in_options';
      Logger.testStep(step);
      await startingSignInOptions(parameters);
      expect(find.byType(SignInOptionsPage), findsOneWidget);
      await helper.screenshot(prefix: prefix, name: step);

      step = '1.2.2_go_to_register_page';
      Logger.testStep(step);
      await goToEmailPage(parameters);
      expect(find.byType(SignInCredentialPage), findsOneWidget);

      step = '1.2.2.1_invalid_email_message';
      Logger.testStep(step);
      // await enterAnInvalidEmail(tester);
      // await submitEmail(tester);
      expect(find.text(CredentialAddressMessageErrors.invalidCredential),
          findsOneWidget);
      await helper.screenshot(prefix: prefix, name: step);

      step = '1.2.2.2_invalid_password_message';
      Logger.testStep(step);
      // await enterAnInvalidEmail(tester);
      // await submitEmail(tester);
      expect(find.text(SecretMessageErrors.shortSecret), findsOneWidget);
      await helper.screenshot(prefix: prefix, name: step);

      step = '1.2.2.3_enter_a_valid_password_and_go_to_home_page';
      Logger.testStep(step);
      // await submitSecret(tester);
      // await Future.delayed(const Duration(seconds: 5));
      expect(find.byType(HomePage), findsOneWidget);
      await helper.screenshot(prefix: prefix, name: step);
    });
  });
}
