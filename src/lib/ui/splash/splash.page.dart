import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00e1f5fe).withOpacity(1.0),
      body: Center(child: Image.asset('assets/splash/splash.png')),
    );
  }
}
