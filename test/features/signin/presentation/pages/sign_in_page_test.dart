import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import 'sign_in_page_test.mocks.dart';

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

      expect(find.byType(SignInOptions), findsOneWidget);
    });
  });

  group('when calling methods', () {
    testWidgets('should show the loading indicator',
        (WidgetTester tester) async {
      // Arrange

      _authState(const AuthState.unauthenticated());

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.loading());

      // Act

      await _pumpWidgetAlphaPage(tester);

      // Assert

      expect(find.byType(GenericProgressIndicator), findsOneWidget);
    });
  });

  group('when signing with google', () {
    testWidgets('should find the correct button option', (tester) async {
      // Arrange

      _authState(const AuthState.unauthenticated());

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.initial());

      // Act

      await _pumpWidgetAlphaPage(tester);

      final googleSignInButton =
          find.byKey(const Key(SignInPageKeys.signInWithGoogleButton));

      // Assert

      expect(googleSignInButton, findsOneWidget);
    });

    testWidgets('should emit the correct event when press the button',
        (tester) async {
      // Arrange

      _authState(const AuthState.unauthenticated());

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.loading());

      await _pumpWidgetAlphaPage(tester);

      final googleSignInButton =
          find.byKey(const Key(SignInPageKeys.signInWithGoogleButton));

      // Act

      await tester.tap(googleSignInButton);

      // Assert

      verify(_mockSignInBloc.add(const SignInEvent.signInWithGoogleEvent()))
          .called(1);

      // Assert

      await expectLater(
          _mockSignInBloc.stream, emitsInOrder([const SignInState.loading()]));
    });
  });
}
