import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

import 'package:vethx_beta/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

  group('end-to-end test', () {
    testWidgets('tap on the sign in with credential button; verify button',
        (WidgetTester tester) async {
      // This is required prior to taking the screenshot (Android only).

      app.main();

      await binding.convertFlutterSurfaceToImage();

      final signInWithCredentials =
          find.byKey(const Key(SignInPageKeys.signInWithCredential));

      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      final List<int> firstPng = await binding.takeScreenshot('screenshot-1');
      expect(firstPng.isNotEmpty, isTrue);

      await tester.tap(signInWithCredentials);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      final List<int> secondPng = await binding.takeScreenshot('screenshot-2');
      expect(secondPng.isNotEmpty, isTrue);

      expect(find.byType(SignInCredentialPage), findsOneWidget);
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
--target=integration_test/foo_test.dart
 */