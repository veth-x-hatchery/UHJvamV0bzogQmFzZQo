import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    Key? key,
    this.child,
    this.color,
    this.borderRadius = 2.0,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);
  final Widget? child;
  final Color? color;
  final double borderRadius;
  final double height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        child: child,
        style: ElevatedButton.styleFrom(
          // padding: EdgeInsets.zero,
          primary: color,
          onSurface: Colors.amberAccent,
          onPrimary: Colors.black,
          // enableFeedback: false,
          // animationDuration: Duration(seconds: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
