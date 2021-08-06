import 'package:flutter/material.dart';
import 'package:vethx_login/core/consts/size_config.dart';
import 'package:vethx_login/ui/login/log_in.page.dart';

class AlphaPage extends StatelessWidget {
  const AlphaPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: LoginPage(),
    );
  }
}
