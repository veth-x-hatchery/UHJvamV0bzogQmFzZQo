import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_email.page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

import '../../../../helpers/widgets/pumpWidget.widget.dart';

void main() {
  testWidgets('should show email form', (WidgetTester tester) async {
    // Arrange && Act

    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: setupToPump(const SignInEmailPage()),
      ),
    );

    // Assert

    expect(find.byType(FormEmail), findsOneWidget);
  });
}
