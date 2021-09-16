import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hatchery/core/notifications/messages.dart';
import 'package:hatchery/core/utils/logger.dart';
import 'package:hatchery/features/home/presentation/pages/home.page.dart';
import 'package:hatchery/features/signin/domain/services/i_auth.service.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_auth.service.mock.dart';
import 'package:hatchery/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:hatchery/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:hatchery/features/signin/presentation/pages/sign_in_secret.page.dart';
import 'package:hatchery/main.dart' as app;
import 'package:hatchery/service_locator.dart';
import 'package:integration_test/integration_test.dart';

import '../../../test/helpers/widgets/pumpWidget.widget.dart';
import 'finders/home.page.dart';
import 'finders/sign_in_email.helpers.dart';
import 'finders/sign_in_secret.helpers.dart';
import 'helpers/sign_in_integration_tests_helpers.dart';

void main() {
  final IntegrationTestWidgetsFlutterBinding _binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized()
          as IntegrationTestWidgetsFlutterBinding;

  late IntegrationTestsHelpers helper;

  Future<void> _setupAndroidScreenShots() async {
    await _binding.convertFlutterSurfaceToImage();
  }

  Future<void> setupServiceLocator(WidgetTester tester) async {
    Logger.testStep('Setup service locator scenario');
    await tester.pumpAndSettle();
    // Todo(v): set this value on our ENV
    // Create an IntegrationTests StartUp that guarantee everything is ready
    await Future.delayed(const Duration(seconds: 3));
    (ServiceLocatorConfig.getIt<IAuthService>() as AuthServiceMock)
        .setupSignInEmailIntegrationTest();
  }

  setUp(() async {
    app.main();

    await _setupAndroidScreenShots();

    helper = IntegrationTestsHelpers(binding: _binding);
  });

  tearDown(() => GetIt.instance.reset());

  Future<void> _waitToPump(
    WidgetTester tester, {
    Duration duration = AuthServiceMock.loadingDuration,
  }) async {
    await Future.delayed(duration);
    await tester.pumpAndSettle();
  }

  testWidgets('should complete the sign in with email test plan',
      (WidgetTester tester) async {
    await setupServiceLocator(tester);

    final parameters = IntegrationTestsParameters(
      widgetTester: tester,
      helper: helper,
    );

    Logger.tests('all states:');
    // ignore: avoid_print, avoid_function_literals_in_foreach_calls
    tester.allStates.forEach(
        (s) => Logger.tests(s.toString(minLevel: DiagnosticLevel.fine)));

    const prefix = 'case-1';
    String step = '1_sign_in_options';
    Logger.testStep(step);
    await startingSignInOptions(parameters);

    expect(find.byType(SignInOptionsPage), findsOneWidget);
    await helper.screenshot(prefix: prefix, name: step);

    step = '1.1_sign_in_with_email';
    Logger.testStep(step);
    await goToEmailPage(parameters);
    expect(find.byType(SignInCredentialPage), findsOneWidget);
    await helper.screenshot(prefix: prefix, name: step);

    step = '1.1.1_invalid_email_message';
    Logger.testStep(step);
    await signInEmailEnterAnInvalidEmail(tester);
    await signInEmailSubmitEmail(tester);
    expect(find.text(tester.l10n.signIn_valueObject_credentialInvalid),
        findsOneWidget);
    await helper.screenshot(prefix: prefix, name: step);

    step = 'goto:__1.1_-_sign_in_with_email';
    Logger.testStep(step);
    await signInEmailSignInCredentialGoBackPage(tester);
    expect(find.byType(SignInOptionsPage), findsOneWidget);
    await goToEmailPage(parameters);

    step = '1.1.2_valid_registered_email';
    Logger.testStep(step);
    await signInEmailEnterAvalidEmail(tester);
    await helper.screenshot(prefix: prefix, name: step);

    step = '1.1.2.1_go_to_secret_page';
    Logger.testStep(step);
    await signInEmailSubmitEmail(tester);
    expect(find.byType(SignInSecretPage), findsOneWidget);
    await helper.screenshot(prefix: prefix, name: step);

    step = '1.1.2.1.1_forgot_my_password';
    Logger.testStep(step);
    await forgotSecret(tester);
    expect(find.byType(SnackBar), findsOneWidget);
    await tester.pump();
    await helper.screenshot(prefix: prefix, name: step);
    await _waitToPump(tester, duration: snackBarNotificationDuration * 2);

    step = '1.1.2.1.2_change_my_email';
    Logger.testStep(step);

    // await dragChangeCredentialButton(tester);
    await helper.screenshot(prefix: prefix, name: step);
    await changeCredential(tester);
    expect(find.byType(SignInCredentialPage), findsOneWidget);

    Logger.testStep('goto:__1.1_-_sign_in_with_email');
    Logger.testStep('goto:__1.2_-_valid_registered_email');
    await signInEmailEnterAvalidEmail(tester);
    Logger.testStep('goto:__1.1.2.1_-_go_to_secret_page');
    await signInEmailSubmitEmail(tester);
    await _waitToPump(tester);
    expect(find.byType(SignInSecretPage), findsOneWidget);

    step = '1.1.2.1.3_enter_an_invalid_password';
    Logger.testStep(step);
    await enterAnInvalidSecret(tester);
    await submitSecret(tester);
    expect(
        find.text(tester.l10n.signIn_valueObject_secretShort), findsOneWidget);
    await helper.screenshot(prefix: prefix, name: step);

    step = '1.1.2.1.4_authenticate_with_success_and_go_to_home_page';
    Logger.testStep(step);
    await enterAvalidRegisteredSecret(tester);
    await submitSecret(tester);
    await _waitToPump(tester);
    expect(find.byType(HomePage), findsOneWidget);
    await helper.screenshot(prefix: prefix, name: step);

    step = '1.1.2.1.5_logout';
    Logger.testStep(step);
    await logOut(tester);

    // LocalAuth time to rebuild
    await _waitToPump(tester);
    expect(find.byType(SignInOptionsPage), findsOneWidget);
  });
}
