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

class IntegrationTestsParametersScreeenshot {
  final String prefix;
  IntegrationTestsParametersScreeenshot(this.prefix);
}

class IntegrationTestsParameters {
  final WidgetTester widgetTester;
  final IntegrationTestsHelpers helper;
  final IntegrationTestsParametersScreeenshot? screenshots;
  IntegrationTestsParameters({
    required this.widgetTester,
    required this.helper,
    this.screenshots,
  });
  bool get takeScreenshot => screenshots != null;
}

Future<void> startingSignInOptions(
    IntegrationTestsParameters parameters) async {
  await parameters.widgetTester.pumpAndSettle();

  expect(find.byType(SignInOptionsPage), findsOneWidget);

  if (parameters.takeScreenshot) {
    await parameters.helper.screenshot(
      prefix: parameters.screenshots!.prefix,
      name: 'sign_in_options',
    );
  }
}

Future<void> goToEmailPage(IntegrationTestsParameters parameters) async {
  await parameters.widgetTester
      .tap(find.byKey(const Key(SignInPageKeys.signInWithCredential)));

  await parameters.widgetTester.pumpAndSettle();

  expect(find.byType(SignInCredentialPage), findsOneWidget);

  if (parameters.takeScreenshot) {
    await parameters.helper.screenshot(
      prefix: parameters.screenshots!.prefix,
      name: 'sign_in_email',
    );
  }
}

Future<void> hideKeyboard(WidgetTester tester) async {
  Logger.tests('Hiding keyboard...');
  if (tester.testTextInput.isRegistered) {
    tester.testTextInput.hide();
    await tester.pumpAndSettle();
  }
}
