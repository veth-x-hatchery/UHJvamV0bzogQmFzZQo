import 'package:flutter/material.dart';
import 'package:vethx_beta/l10n/l10n.dart';
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
    return Localizations.override(
      context: context,
      locale: const Locale('en'),
      child: Builder(builder: (context) {
        return SizedBox(
          height: size,
          child: Center(
            child: loading
                ? const GenericProgressIndicator()
                : Text(
                    title ??
                        context.l10n
                            .signin_page_options_title, //context.l10n.signin_page_options_title,
                    textAlign: TextAlign.center,
                    style: style,
                  ),
          ),
        );
      }),
    );
    // Todo(v): Colocar o LOGO Veth-X
    // return Image.asset(
    //   assetsLogoSigavi,
    //   alignment: Alignment.center,
    //   height: SizeConfig.safeBlockVertical * 14,
    // );
  }
}
