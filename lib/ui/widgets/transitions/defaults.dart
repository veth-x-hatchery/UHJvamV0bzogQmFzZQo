import 'package:flutter/widgets.dart';

// ignore: avoid_classes_with_only_static_members
class DefaultAnimationSettings {
  static const Duration duration = Duration(milliseconds: 700);

  static CurvedAnimation pageCurve(Animation<double> animation) =>
      CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCirc,
      );
}
