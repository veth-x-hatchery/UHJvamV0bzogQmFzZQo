import 'package:flutter/material.dart';
import 'package:vethx_login/ui/alpha/alpha.page.dart';
import 'package:vethx_login/ui/login/sign_in_page.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlphaPage(),
    );
  }
}
