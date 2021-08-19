import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

void main() {
  Future<void> _pump(
      WidgetTester tester, GlobalKey<FormState> _passwordFormKey) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FieldPassword(
            passwordFormKey: _passwordFormKey,
            passwordFocusNode: FocusNode(),
            controller: TextEditingController(),
            validatePassword: () {},
          ),
        ),
      ),
    );
  }

  testWidgets(
      'when user enters a invalid password then should return the correct error message',
      (tester) async {
    final _passwordFormKey = GlobalKey<FormState>();

    await _pump(tester, _passwordFormKey);

    const invalidPassword = '1234';

    final validationErrorMessage = Password(invalidPassword).validation;

    await tester.enterText(find.byType(TextFormField), invalidPassword);

    _passwordFormKey.currentState!.validate();

    await tester.pump();

    expect(find.text(validationErrorMessage!), findsOneWidget);
  });

  testWidgets(
      'when user enters a empty value then should return the correct error message',
      (tester) async {
    final _passwordFormKey = GlobalKey<FormState>();

    await _pump(tester, _passwordFormKey);

    const invalidPassword = '';

    final validationErrorMessage = Password(invalidPassword).validation;

    await tester.enterText(find.byType(TextFormField), invalidPassword);

    _passwordFormKey.currentState!.validate();

    await tester.pump();

    expect(find.text(validationErrorMessage!), findsOneWidget);
  });
}
