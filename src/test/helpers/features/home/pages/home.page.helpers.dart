import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatchery/features/signin/presentation/widgets/sign_in.widgets.dart';

Finder logOutHomePageButton() {
  // arrange
  final button = find.byKey(const Key(SignInPageKeys.logOutHomePageButton));
  // Act && Assert
  expect(button, findsOneWidget);
  return button;
}
