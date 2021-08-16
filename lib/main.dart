import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vethx_beta/core/blocs/app_state.dart';
import 'package:vethx_beta/core/blocs/core_business_logic.dart';
import 'package:vethx_beta/core/blocs/core_services.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:vethx_beta/injection_container.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationService = NavigationService();
    return AppStateContainer(
      serviceProvider: ServiceProvider(
        navigationService: navigationService,
      ),
      blocProvider: RootBLoCProvider(
        signInNavigation: SignInNavigationBloc(),
      ),
      child: BlocProvider(
        create: (_) => sl<SignInBloc>(),
        child: MaterialApp(
          navigatorKey: navigationService.navigatorKey,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: NavigationRoutes.onGenerateRoute,
          routes: NavigationRoutes.routes(),
          // initialRoute: NavigationRoutes.alpha,
          navigatorObservers: [LoggingNavigationObserver()],
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const AlphaPage(),
        ),
      ),
    );
  }
}
