import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

import '../../../../../helpers/widgets/pumpWidget.widget.dart';

void main() {
  testWidgets('should insert find the confirmation button', (tester) async {
    // arrange

    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          const Scaffold(
            body: FormEmail(),
          ),
        ),
      ),
    );

    final nextButton =
        find.byKey(const Key(SignInPageKeys.signInEmailPageNextButton));

    // Act

    await tester.tap(nextButton);

    // assert

    expect(nextButton, findsOneWidget);
  });
  testWidgets(
      'when blank email should insert return correct validation message',
      (tester) async {
    // arrange

    await tester.pumpWidget(
      MaterialApp(
        home: setupToPump(
          const Scaffold(
            body: FormEmail(),
          ),
        ),
      ),
    );

    final nextButton =
        find.byKey(const Key(SignInPageKeys.signInEmailPageNextButton));

    // Act

    await tester.tap(nextButton);

    // assert

    // verifyNever(mockAuth.signInWithEmailAndPassword(any, any));
  });
}
