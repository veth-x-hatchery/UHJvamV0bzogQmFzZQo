import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

class SignInLoader extends StatelessWidget {
  const SignInLoader({
    Key? key,
    required this.size,
    required this.loading,
    this.title,
  }) : super(key: key);

  final double size;
  final String? title;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headline3;
    return SizedBox(
      height: size,
      child: Center(
        child: loading
            ? const GenericProgressIndicator()
            : Text(
                title ?? Texts.signInPageTitle,
                textAlign: TextAlign.center,
                style: style,
              ),
      ),
    );
    // Todo(v): Colocar o LOGO Veth-X
    // return Image.asset(
    //   assetsLogoSigavi,
    //   alignment: Alignment.center,
    //   height: SizeConfig.safeBlockVertical * 14,
    // );
  }
}
