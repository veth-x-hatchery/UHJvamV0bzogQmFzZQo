import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/options/sign_in_options_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_register_page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_secret.page.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/login/sign_in_loading.widget.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/features/signin/sign_in_service_locator.dart';
import 'package:vethx_beta/service_locator.dart';
import 'package:vethx_beta/ui/widgets/shared/forms/form_column.widget.dart';
import 'package:vethx_beta/ui/widgets/transitions/slide_route.dart';

class SignInOptionsPage extends StatefulWidget {
  const SignInOptionsPage({
    Key? key,
    required this.serviceLocator,
  }) : super(key: key);
  final ISignInServiceLocator serviceLocator;

  static Widget create({
    BuildContext? context,
    ISignInServiceLocator? serviceLocator,
  }) {
    Logger.widget('SignInOptionsPage -> create');
    final sl = serviceLocator ?? getIt<ISignInServiceLocator>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl.get<SignInOptionsBloc>(),
        ),
        // BlocProvider(
        //   create: (_) => sl.get<NavigationCubit>(),
        // ),
      ],
      child: SignInOptionsPage(serviceLocator: sl),
    );
  }

  @override
  State<SignInOptionsPage> createState() => _SignInOptionsPageState();
}

class _SignInOptionsPageState extends State<SignInOptionsPage> {
  Stream<SignInPageGoTo>? _previousStream;
  StreamSubscription? _streamSubscription;
  void _listenGoTo(Stream<SignInPageGoTo> received) {
    if (received != _previousStream) {
      _streamSubscription?.cancel();
      _previousStream = received;
      _streamSubscription = _previousStream!.listen(_goTo);
    }
  }

  ISignInServiceLocator get serviceLocator => widget.serviceLocator;

  @override
  void initState() {
    Logger.widget('SignInOptionsPage -> initState');
    serviceLocator.init();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _listenGoTo(serviceLocator.get<NavigationCubit>().stream);
    FocusScope.of(context).unfocus();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Logger.widget('SignInOptionsPage -> dispose');
    serviceLocator.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return signInScaffold(
      context,
      child: BlocBuilder<SignInOptionsBloc, SignInOptionsState>(
          builder: (context, state) {
        FocusScope.of(context).unfocus();
        final isLoading = state == const SignInOptionsState.loading();
        return FormColumn(
          children: [
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            SignInLoader(
              key: const Key(SignInPageKeys.signInLoader),
              size: SizeConfig.screenHeight * 0.25,
              loading: isLoading,
            ),
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            SignInButton(
              key: const Key(SignInPageKeys.signInWithGoogleButton),
              assetName: 'assets/images/google-logo.png',
              text: Texts.signInWithGoogle,
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: () => BlocProvider.of<SignInOptionsBloc>(context)
                  .add(const SignInOptionsEvent.signInWithGoogleEvent()),
            ),
            SizedBox(height: SizeConfig.defaultEdgeSpace),
            SignInButton(
              key: const Key(SignInPageKeys.signInWithCredential),
              assetName: 'assets/images/mail-logo.png',
              text: Texts.signInWithCredential,
              textColor: Colors.white,
              color: Colors.teal[700],
              onPressed: isLoading
                  ? () => {}
                  : () => serviceLocator.get<NavigationCubit>().goTo(
                        SignInPageGoTo.credentialPage(
                            from: SignInPageRoutes.signInOptions),
                      ),
            ),
          ],
        );
      }),
      leading: false,
    );
  }

  void _goTo(SignInPageGoTo page) {
    FocusScope.of(context).unfocus();
    Logger.widget('SignInPage -> NavigationCubit -> $page');
    switch (page.to) {
      case SignInPageRoutes.secretEntry:
        Navigator.pushReplacement(
          context,
          SlideLeftRoute<void>(
            page: SignInSecretPage.create(serviceLocator: serviceLocator),
          ),
        );
        break;
      case SignInPageRoutes.registerCredentialSignIn:
        Navigator.pushReplacement(
            context,
            SlideLeftRoute<void>(
                page: SignInRegisterPage.create(
                    serviceLocator: serviceLocator,
                    credential: page.parameters as Credential?)));
        break;
      case SignInPageRoutes.credentialEntry:
        final credentialPage =
            SignInCredentialPage.create(serviceLocator: serviceLocator);
        // return showModalBottomSheet<void>(
        //   context: context,
        //   builder: (_) => credentialPage,
        // );
        page.from == SignInPageRoutes.signInOptions
            ? Navigator.push(
                context, SlideLeftRoute<void>(page: credentialPage))
            : Navigator.pushReplacement(
                context, SlideRightRoute<void>(page: credentialPage));
        break;
      default:
        break;
    }
  }
}
