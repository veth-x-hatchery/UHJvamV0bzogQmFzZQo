import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_page.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_button.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/logo_text_loading.widget.dart';

class SignInOptions extends StatefulWidget {
  const SignInOptions({Key? key}) : super(key: key);

  @override
  _SignInOptionsState createState() => _SignInOptionsState();
}

class _SignInOptionsState extends State<SignInOptions> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        final _loading = state == const SignInState.loading();
        return FormColumn(
          children: [
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            LogoTextLoading(
                size: SizeConfig.screenHeight * 0.25, loading: _loading),
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            SignInButton(
              assetName: 'assets/images/google-logo.png',
              text: 'Sign in with Google',
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: () => BlocProvider.of<SignInBloc>(context)
                  .add(const SignInEvent.signInWithGoogleEvent()),
            ),
            // SizedBox(height: SizeConfig.defaultEdgeSpace),
            // SignInButton(
            //   assetName: 'assets/images/facebook-logo.png',
            //   text: 'Sign in with Facebook',
            //   textColor: Colors.white,
            //   color: const Color(0xFF334D92),
            //   // ignore: avoid_returning_null_for_void
            //   onPressed: _signIn,
            // ),
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            SignInButton(
              assetName: 'assets/images/mail-logo.png',
              text: 'Sign in with email',
              textColor: Colors.white,
              color: Colors.teal[700],
              onPressed: () => BlocProvider.of<SignInBloc>(context).goToPage(
                const SignInPageGoTo(
                  from: SignInPageRoutes.signInOptions,
                  to: SignInPageRoutes.emailEntry,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
