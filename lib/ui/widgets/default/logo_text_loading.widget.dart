import 'package:flutter/material.dart';
import 'package:vethx_login/ui/widgets/shared/progress-indicator.widget.dart';

class LogoTextLoading extends StatelessWidget {
  const LogoTextLoading({
    Key? key,
    required this.size,
    required this.loading,
    this.title,
  }) : super(key: key);

  final double size;
  final bool loading;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headline3;
    return SizedBox(
      height: size,
      child: Center(
        child: loading
            ? GenericProgressIndicator()
            : Text(
                title ?? 'Sign in',
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
