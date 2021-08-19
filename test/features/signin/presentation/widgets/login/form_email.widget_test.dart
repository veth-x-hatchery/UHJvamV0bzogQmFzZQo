import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';

import '../../../../../helpers/widgets/pumpWidget.widget.dart';

void main() {
  testWidgets('should insert email and return correct validation message',
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

    // act

    //

    // assert

    //
  });
}
