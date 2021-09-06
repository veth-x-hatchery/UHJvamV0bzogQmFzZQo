import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/home/presentation/pages/home.page.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/main.dart' as app;
import 'package:vethx_beta/service_locator.dart';

import '../../../test/helpers/widgets/pumpWidget.widget.dart';
import 'finders/home.page.dart';
import 'finders/sign_in_email.helpers.dart';
import 'finders/sign_in_register.helpers.dart';
import 'helpers/sign_in_integration_tests_helpers.dart';

void main() {
  final IntegrationTestWidgetsFlutterBinding _binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized()
          as IntegrationTestWidgetsFlutterBinding;

  late IntegrationTestsHelpers helper;

  Future<void> _setupAndroidScreenShots() async {
    // TODO
    // await _binding.convertFlutterSurfaceToImage();
  }

  Future<void> setupServiceLocator(WidgetTester tester) async {
    Logger.testStep('Setup service locator scenario');
    await tester.pumpAndSettle();
    (ServiceLocatorConfig.getIt<IAuthFacade>() as AuthFacadeMock)
        .setupSignInRegisterIntegrationTest();
  }

  setUp(() async {
    app.main();

    await _setupAndroidScreenShots();

    helper = IntegrationTestsHelpers(binding: _binding);
  });

  tearDown(() => GetIt.instance.reset());

  testWidgets('should complete the register test plan',
      (WidgetTester tester) async {
    await setupServiceLocator(tester);

    final parameters = IntegrationTestsParameters(
      widgetTester: tester,
      helper: helper,
    );

    const prefix = 'case-2';
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

    step = '1.1.3_valid_unregistered_email';
    Logger.testStep(step);
    await signInEmailEnterAvalidEmail(tester);
    await helper.screenshot(prefix: prefix, name: step);
    await signInEmailSubmitEmail(tester);

    step = '1.1.3.1_go_to_register_page';
    Logger.testStep(step);
    await helper.screenshot(prefix: prefix, name: step);

    step = '1.1.3.1.1_invalid_email_message';
    Logger.testStep(step);
    await signInRegisterEnterAnInvalidEmail(tester);
    await signInRegisterSubmitRegister(tester);
    expect(find.text(tester.l10n.signIn_valueObject_credentialInvalid),
        findsOneWidget);
    await helper.screenshot(prefix: prefix, name: step);

    step = '1.1.3.1.2_invalid_password_message';
    Logger.testStep(step);
    await signInRegisterEnterAnInvalidSecret(tester);
    await signInRegisterSubmitRegister(tester);
    expect(
        find.text(tester.l10n.signIn_valueObject_secretShort), findsOneWidget);
    await helper.screenshot(prefix: prefix, name: step);

    step = '1.1.3.1.3_enter_a_valid_password_and_go_to_home_page';
    Logger.testStep(step);
    await signInRegisterEnterAvalidEmail(tester);
    await signInRegisterSubmitRegister(tester);
    await signInRegisterEnterAvalidSecret(tester);
    await signInRegisterSubmitRegister(tester);
    await Future.delayed(AuthFacadeMock.loadingDuration);
    expect(find.byType(HomePage), findsOneWidget);
    await helper.screenshot(prefix: prefix, name: step);

    step = '1.1.3.1.4_logout';
    Logger.testStep(step);
    await logOut(tester);
    await Future.delayed(AuthFacadeMock.loadingDuration);
    await tester.pumpAndSettle();
    expect(find.byType(SignInOptionsPage), findsOneWidget);
  });
}
