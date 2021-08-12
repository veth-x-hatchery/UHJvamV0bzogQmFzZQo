import 'package:flutter/widgets.dart';

class DefaultAnimationSettings {
  static const Duration duration = Duration(milliseconds: 700);

  static CurvedAnimation pageCurve(Animation<double> animation) =>
      CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCirc,
      );
}
