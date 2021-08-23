import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/home/presentation/pages/home.page.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/injection_container.dart';

class AlphaPage extends StatelessWidget {
  const AlphaPage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
      child: const AlphaPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
      listener: (context, state) {
        Logger.presentation('AlphaPage -> AuthBloc: $state');
      },
      builder: (context, state) {
        Logger.presentation('AlphaPage -> $state');
        return state.map(
          initial: (_) => _PageWidget(),
          authenticated: (_) => const HomePage(),
          unauthenticated: (_) => SignInOptionsPage.create(),
        );
      },
      // child: _PageWidget(),
    );
  }
}

class _PageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
