import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/core/utils/logger.dart';

import '../../../../test/helpers/features/home/pages/home.page.helpers.dart';

Future<void> logOut(WidgetTester tester) async {
  Logger.tests('Logout');
  await tester.tap(logOutHomePageButton());
  await tester.pumpAndSettle();
}
