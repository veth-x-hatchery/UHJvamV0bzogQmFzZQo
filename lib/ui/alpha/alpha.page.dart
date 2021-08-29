import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/home/presentation/pages/home.page.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/service_locator.dart';
import 'package:vethx_beta/ui/splash/splash.page.dart';

class AlphaPage extends StatelessWidget {
  const AlphaPage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (_) => ServiceLocatorConfig.getIt<AuthBloc>()
        ..add(const AuthEvent.authCheckRequested()),
      child: const AlphaPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        Logger.widget('AlphaPage -> AuthBloc: $state');
      },
      builder: (context, state) {
        Logger.widget('AlphaPage -> $state');
        return state.map(
          initial: (_) => Splash(),
          authenticating: (_) => _PageLoading(),
          authenticated: (_) => const HomePage(),
          unauthenticated: (_) => SignInOptionsPage.create(),
        );
      },
      // child: _PageWidget(),
    );
  }
}

class _PageLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
