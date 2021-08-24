import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

class IntegrationTestsHelpers {
  int index;
  final IntegrationTestWidgetsFlutterBinding binding;

  IntegrationTestsHelpers({
    this.index = 0,
    required this.binding,
  });

  Future<void> screenshot({
    required String prefix,
    required String name,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    index++;

    // Todo(v): create a function that guarantee that folder
    // Maybe create a folder by test group
    final List<int> firstPng = await binding.takeScreenshot(
        '.${Directory.current.path}screenshots/screenshot_$prefix.${index}_$name');

    expect(firstPng.isNotEmpty, isTrue);
  }
}

Future<void> goToEmailPage({
  required WidgetTester tester,
  required IntegrationTestsHelpers helper,
  required String prefix,
  bool screenshots = true,
}) async {
  final signInWithCredentials =
      find.byKey(const Key(SignInPageKeys.signInWithCredential));

  Logger.tests('Starting on Sign In Options Page');

  await tester.pumpAndSettle();

  expect(find.byType(SignInOptionsPage), findsOneWidget);

  if (screenshots) {
    await helper.screenshot(
      prefix: prefix,
      name: 'sign_in_options',
    );
  }

  Logger.tests('Go to Email Sign In Page');

  await tester.tap(signInWithCredentials);

  await tester.pumpAndSettle();

  expect(find.byType(SignInCredentialPage), findsOneWidget);

  if (screenshots) {
    await helper.screenshot(
      prefix: prefix,
      name: 'sign_in_email',
    );
  }
}
