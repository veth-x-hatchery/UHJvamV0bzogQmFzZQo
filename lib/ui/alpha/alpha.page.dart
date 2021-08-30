import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/consts/size_config.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/home/presentation/pages/home.page.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/service_locator.dart';
import 'package:vethx_beta/ui/splash/splash.page.dart';
import 'package:vethx_beta/ui/widgets/default/lifecycle_manager.widget.dart';
import 'package:vethx_beta/ui/widgets/default/loading_page.widget.dart';

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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        Logger.widget('AlphaPage -> AuthBloc: $state');
      },
      builder: (context, state) {
        Logger.widget('AlphaPage -> $state');
        return state.map(
          initial: (_) => _Root(home: Splash()),
          inProcess: (_) => _Root(home: LoadingPage()),
          authenticated: (_) => const _Root(home: HomePage()),
          unauthenticated: (_) => _Root(
            home: SignInOptionsPage.create(),
          ),
        );
      },
      // child: _PageWidget(),
    );
  }
}

class _Root extends StatelessWidget {
  final Widget home;
  const _Root({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
      onLifecycleStateChange: (s) {
        Logger.widget('AppLifecycleState: $s');
        if (s == AppLifecycleState.resumed) {
          ServiceLocatorConfig.getIt<AuthBloc>()
              .add(const AuthEvent.localAuthCheckRequested());
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoutes.onGenerateRoute,
        routes: NavigationRoutes.routes(),
        // initialRoute: NavigationRoutes.alpha,
        navigatorObservers: [LoggingNavigationObserver()],
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Builder(
          builder: (context) {
            SizeConfig().init(context);
            return home;
          },
        ),
      ),
    );
  }
}
