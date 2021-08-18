import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';

import 'sign_in_page_test.mocks.dart';

// class MockNavigatorObservererUNSAFE extends Mock implements NavigatorObserver {}

@GenerateMocks([
  AuthBloc,
  SignInBloc,
  NavigationCubit,
  MaterialPageRoute,
  NavigatorObserver,
])
void main() {
  late MockAuthBloc _mockAuthBloc;
  late MockSignInBloc _mockSignInBloc;
  late NavigationCubit _navigationCubit;

  late MockNavigatorObserverer _mockLoggingNavigationObserver;

  late MockMaterialPageRoute _mockMaterialPageRoute;

  late GetIt sl;

  late GlobalKey<NavigatorState> _navigatorKey;

  setUp(() {
    _navigatorKey = GlobalKey<NavigatorState>();
    _mockMaterialPageRoute = MockMaterialPageRoute();

    _mockAuthBloc = MockAuthBloc();
    _mockSignInBloc = MockSignInBloc();
    _navigationCubit = NavigationCubit();
    _mockLoggingNavigationObserver = MockNavigatorObserverer();

    sl = GetIt.instance;
    sl.registerFactory<AuthBloc>(() => _mockAuthBloc);
    sl.registerFactory<SignInBloc>(() => _mockSignInBloc);
    sl.registerLazySingleton<NavigationCubit>(() => _navigationCubit);
  });

  tearDown(() => sl.reset());

  void _authState(AuthState state) {
    when(_mockAuthBloc.state).thenReturn(state);
    when(_mockAuthBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  void _signInState(SignInState state) {
    when(_mockSignInBloc.state).thenReturn(state);
    when(_mockSignInBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  Future<void> _pumpWidgetAlphaPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoutes.onGenerateRoute,
        routes: NavigationRoutes.routes(),
        // initialRoute: NavigationRoutes.alpha,
        navigatorObservers: [_mockLoggingNavigationObserver],
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Builder(builder: (context) {
          return AlphaPage.create(context);
        }),
      ),
    );
  }

  group('when starting the app', () {
    testWidgets('shoud return unauthenticate redering the sign in page',
        (WidgetTester tester) async {
      // Arrange

      _authState(const AuthState.unauthenticated());

      _signInState(const SignInState.initial());

      // Act

      await _pumpWidgetAlphaPage(tester);

      // Assert

      expect(find.text(Texts.signInPageTitle), findsOneWidget);

      expect(find.byType(SignInOptions), findsOneWidget);
    });
  });

  group('when receiving navigation events', () {
    testWidgets('should go to the form password page',
        (WidgetTester tester) async {
      // Arrange

      _authState(const AuthState.unauthenticated());

      _signInState(const SignInState.initial());

      // Act

      await _pumpWidgetAlphaPage(tester);

      // act

      when(_mockLoggingNavigationObserver.navigator)
          .thenReturn(_navigatorKey.currentState);

      _navigationCubit.goTo(SignInPageGoTo(
        from: SignInPageRoutes.registerEmailSignIn,
        to: SignInPageRoutes.passwordEntry,
        parameters: 'teste@teste.com',
      ));

      // assert

      // verify(_mockLoggingNavigationObserver.didPush(
      //         _mockMaterialPageRoute, any))
      //     .called(1);

      await tester.pumpAndSettle();

      expect(find.byType(FormPassword), findsOneWidget);
    });
  });
}
