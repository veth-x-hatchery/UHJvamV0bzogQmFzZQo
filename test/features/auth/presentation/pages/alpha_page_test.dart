import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';

import 'alpha_page_test.mocks.dart';

@GenerateMocks([
  AuthBloc,
  SignInBloc,
  NavigationCubit,
  LoggingNavigationObserver,
])
void main() {
  late MockAuthBloc _mockAuthBloc;
  late MockSignInBloc _mockSignInBloc;
  late MockNavigationCubit _mockNavigationCubit;
  late MockLoggingNavigationObserver _mockLoggingNavigationObserver;

  setUp(() {
    _mockAuthBloc = MockAuthBloc();
    _mockSignInBloc = MockSignInBloc();
    _mockNavigationCubit = MockNavigationCubit();
    _mockLoggingNavigationObserver = MockLoggingNavigationObserver();
  });

  void _authState(AuthState state) {
    when(_mockAuthBloc.state).thenReturn(state);
    when(_mockAuthBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  void _navigationState(NavigationState state) {
    when(_mockNavigationCubit.state).thenReturn(state);
    when(_mockNavigationCubit.stream).thenAnswer((_) => Stream.value(state));
  }

  void _signInState(SignInState state) {
    when(_mockSignInBloc.state).thenReturn(state);
    when(_mockSignInBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.

  Future<void> _pumpWidgetAlphaPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (_) => _mockAuthBloc,
          ),
          BlocProvider<SignInBloc>(
            create: (_) => _mockSignInBloc,
          ),
          BlocProvider<NavigationCubit>(
            create: (_) => _mockNavigationCubit,
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: NavigationRoutes.onGenerateRoute,
          routes: NavigationRoutes.routes(),
          // initialRoute: NavigationRoutes.alpha,
          // navigatorObservers: [LoggingNavigationObserver()],
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const AlphaPage(),
        ),
      ),
    );
  }

  testWidgets('Alpha Page unauthenticate start redering the sign in page',
      (WidgetTester tester) async {
    _authState(const AuthState.unauthenticated());

    _navigationState(const NavigationState.initial());

    _signInState(const SignInState.initial());

    // Create the widget by telling the tester to build it.
    await _pumpWidgetAlphaPage(tester);

    /// Schedules a frame and triggers a rebuild of the widget (Duration)
    // tester.pump();

    // /// Waits for all animations to complete.
    // tester.pumpAndSettle();

    // // Create the Finders.
    // final titleFinder = find.text('T');
    // final messageFinder = find.text('M');
    // // Use the `findsOneWidget` matcher provided by flutter_test to
    // // verify that the Text widgets appear exactly once in the widget tree.
    // expect(titleFinder, findsOneWidget);
    // expect(messageFinder, findsOneWidget);
  });
}
