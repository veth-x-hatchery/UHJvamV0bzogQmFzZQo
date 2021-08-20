import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/features/home/presentation/pages/home.page.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';

import 'alpha.page_test.mocks.dart';

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
  late GetIt sl;

  setUp(() {
    _mockAuthBloc = MockAuthBloc();
    _mockSignInBloc = MockSignInBloc();
    _mockNavigationCubit = MockNavigationCubit();
    _mockLoggingNavigationObserver = MockLoggingNavigationObserver();
    sl = GetIt.instance;
    sl.registerFactory<AuthBloc>(() => _mockAuthBloc);
    sl.registerFactory<SignInBloc>(() => _mockSignInBloc);
    sl.registerLazySingleton<NavigationCubit>(() => _mockNavigationCubit);
  });

  tearDown(() => sl.reset());

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

  Future<void> _pumpWidgetAlphaPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoutes.onGenerateRoute,
        routes: NavigationRoutes.routes(),
        // initialRoute: NavigationRoutes.alpha,
        navigatorObservers: [LoggingNavigationObserver()],
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

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.initial());

      // Act

      await _pumpWidgetAlphaPage(tester);

      // Assert

      expect(find.text(Texts.signInPageTitle), findsOneWidget);

      expect(find.byType(SignInOptionsPage), findsOneWidget);
    });

    testWidgets('shoud return authenticated redering the home page',
        (WidgetTester tester) async {
      // Arrange

      _authState(AuthState.authenticated(User(
        email: EmailAddress('test@test.com'),
        name: 'test',
      )));

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.initial());

      // Act

      await _pumpWidgetAlphaPage(tester);

      // Assert

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('shoud return a loading indicator',
        (WidgetTester tester) async {
      // Arrange

      _authState(const AuthState.initial());

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.initial());

      // Act

      await _pumpWidgetAlphaPage(tester);

      // Assert

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}