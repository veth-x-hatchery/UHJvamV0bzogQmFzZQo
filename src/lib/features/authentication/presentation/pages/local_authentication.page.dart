import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/ui/widgets/shared/custom_raised_button.dart';

class LocalAuthenticationPage extends StatelessWidget {
  final void Function()? onAuthenticate;
  const LocalAuthenticationPage({
    Key? key,
    this.onAuthenticate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: SizeConfig.defaultEdgeInsetsAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.security,
              size: SizeConfig.screenHeight * 0.2,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.35),
            CustomRaisedButton(
              child: const Text(
                context.l10n.localAuthentication_page_button,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
              onPressed: () => onAuthenticate?.call(),
            )
          ],
        ),
      ),
    );
  }
}
