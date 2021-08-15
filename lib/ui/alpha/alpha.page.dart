import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_page.dart';

class AlphaPage extends StatelessWidget {
  const AlphaPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SignInPage.create(context),
    );
  }
}
