import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

import '../test/helpers/features/signin/sign_in_credential.helpers.dart';

import 'package:vethx_beta/main.dart' as app;

void main() {
  final _binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

  group('when ZYX', () {
    app.main();
    late int _screenshotIndex;

    final signInWithCredentials =
        find.byKey(const Key(SignInPageKeys.signInWithCredential));

    Future<void> _setupAndroidScreenShots() async {
      // This is required prior to taking the screenshot (Android only).
      _screenshotIndex = 1;
      await _binding.convertFlutterSurfaceToImage();
    }

    Future<void> _screenshot(String name) async {
      await Future.delayed(const Duration(seconds: 3));

      _screenshotIndex++;

      final List<int> firstPng =
          await _binding.takeScreenshot('screenshot-$_screenshotIndex-$name');

      expect(firstPng.isNotEmpty, isTrue);
    }

    setUp(() async {
      await _setupAndroidScreenShots();
    });

    testWidgets('should show invalid email message',
        (WidgetTester tester) async {
      Logger.tests('1 - Sign In Options Page');

      await tester.pumpAndSettle();

      expect(find.byType(SignInOptionsPage), findsOneWidget);

      await _screenshot('sign_in_options');

      Logger.tests('2 - Email Sign In Page');

      await tester.tap(signInWithCredentials);

      await tester.pumpAndSettle();

      expect(find.byType(SignInCredentialPage), findsOneWidget);

      await _screenshot('sign_in_email');

      Logger.tests('3 - Invalid email message');

      await tester.enterText(signInCredentialPageInput(), 'invalid-email');

      await tester.tap(signInCredentialPageValidationButton());

      await tester.pumpAndSettle();

      expect(find.text(CredentialAddressMessageErrors.invalidCredential),
          findsOneWidget);

      await _screenshot('sign_in_email_invalid_email');
    });
  });
}

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   testWidgets('failing test example', (WidgetTester tester) async {
//     expect(2 + 2, equals(5));
//   });
// }

/**
 * 
flutter drive --driver=test_driver/integration_test_driver_extended.dart \
--target=integration_test/app_test.dart
 */
