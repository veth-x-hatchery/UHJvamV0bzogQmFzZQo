import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

import 'package:vethx_beta/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the sign in with credential button; verify button',
        (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      final signInWithCredentials =
          find.byKey(const Key(SignInPageKeys.signInWithCredential));

      await tester.tap(signInWithCredentials);

      await tester.pumpAndSettle();

      expect(signInWithCredentials, findsOneWidget);
    });
  });
}


// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   testWidgets('failing test example', (WidgetTester tester) async {
//     expect(2 + 2, equals(5));
//   });
// }
