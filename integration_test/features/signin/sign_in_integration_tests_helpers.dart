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

class IntegrationTestsParameters {
  final WidgetTester widgetTester;
  final IntegrationTestsHelpers helper;
  final String prefix;
  final bool screenshots;
  IntegrationTestsParameters({
    required this.widgetTester,
    required this.helper,
    required this.prefix,
    this.screenshots = true,
  });
}

Future<void> startingSignInOptions(
    IntegrationTestsParameters parameters) async {
  Logger.tests('Starting on Sign In Options Page');

  await parameters.widgetTester.pumpAndSettle();

  expect(find.byType(SignInOptionsPage), findsOneWidget);

  if (parameters.screenshots) {
    await parameters.helper.screenshot(
      prefix: parameters.prefix,
      name: 'sign_in_options',
    );
  }
}

Future<void> goToEmailPage(IntegrationTestsParameters parameters) async {
  final signInWithCredentials =
      find.byKey(const Key(SignInPageKeys.signInWithCredential));

  Logger.tests('Go to Email Sign In Page');

  await parameters.widgetTester.tap(signInWithCredentials);

  await parameters.widgetTester.pumpAndSettle();

  expect(find.byType(SignInCredentialPage), findsOneWidget);

  if (parameters.screenshots) {
    await parameters.helper.screenshot(
      prefix: parameters.prefix,
      name: 'sign_in_email',
    );
  }
}
