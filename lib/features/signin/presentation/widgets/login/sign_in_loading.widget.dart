import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      locale: const Locale('es'),
      child: Builder(builder: (context) {
        return SizedBox(
          height: size,
          child: Center(
            child: loading
                ? const GenericProgressIndicator()
                : Text(
                    title ??
                        AppLocalizations.of(context)!
                            .helloWorld, //Texts.signInPageTitle,
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
