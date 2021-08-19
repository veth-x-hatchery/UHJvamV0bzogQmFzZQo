import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

void main() {
  Future<void> _pump(
      WidgetTester tester, GlobalKey<FormState> _emailFormKey) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FieldEmail(
            emailFormKey: _emailFormKey,
            emailFocusNode: FocusNode(),
            controller: TextEditingController(),
            validateEmail: () {},
          ),
        ),
      ),
    );
  }

  testWidgets(
      'when user enters a invalid email then should return the correct error message',
      (tester) async {
    final _emailFormKey = GlobalKey<FormState>();

    await _pump(tester, _emailFormKey);

    const invalidEmail = 'invalidemail';

    final validationErrorMessage = EmailAddress(invalidEmail).validation;

    await tester.enterText(find.byType(TextFormField), invalidEmail);

    _emailFormKey.currentState!.validate();

    await tester.pump();

    expect(find.text(validationErrorMessage!), findsOneWidget);
  });

  testWidgets(
      'when user enters a empty value then should return the correct error message',
      (tester) async {
    final _emailFormKey = GlobalKey<FormState>();

    await _pump(tester, _emailFormKey);

    const invalidEmail = '';

    final validationErrorMessage = EmailAddress(invalidEmail).validation;

    await tester.enterText(find.byType(TextFormField), invalidEmail);

    _emailFormKey.currentState!.validate();

    await tester.pump();

    expect(find.text(validationErrorMessage!), findsOneWidget);
  });
}
