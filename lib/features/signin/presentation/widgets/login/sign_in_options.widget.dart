import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_button.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';

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
              key: const Key(SignInPageKeys.signInWithGoogleButton),
              assetName: 'assets/images/google-logo.png',
              text: Texts.signInWithGoogle,
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: () => BlocProvider.of<SignInBloc>(context)
                  .add(const SignInEvent.signInWithGoogleEvent()),
            ),
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            SignInButton(
              key: const Key(SignInPageKeys.signInWithEmail),
              assetName: 'assets/images/mail-logo.png',
              text: Texts.signInWithEmail,
              textColor: Colors.white,
              color: Colors.teal[700],
              onPressed: () => BlocProvider.of<NavigationCubit>(context).goTo(
                SignInPageGoTo.emailPage(from: SignInPageRoutes.signInOptions),
              ),
            ),
          ],
        );
      },
    );
  }
}
