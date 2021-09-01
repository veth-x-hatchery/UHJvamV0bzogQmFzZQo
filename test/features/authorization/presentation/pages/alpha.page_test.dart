import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/l10n/l10n.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/features/authentication/presentation/bloc/local_authentication_bloc.dart';
import 'package:vethx_beta/features/authentication/presentation/pages/local_authentication.page.dart';
import 'package:vethx_beta/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:vethx_beta/features/authorization/presentation/pages/alpha.page.dart';
import 'package:vethx_beta/features/home/presentation/pages/home.page.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/options/sign_in_options_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/sign_in_service_locator.dart';
import 'package:vethx_beta/ui/splash/splash.page.dart';

import '../../../../helpers/features/signin/sign_in_service_locator.mock.dart';
import 'alpha.page_test.mocks.dart';

@GenerateMocks([
  AuthBloc,
  LocalAuthenticationBloc,
], customMocks: [
  MockSpec<NavigatorObserver>(returnNullOnMissingStub: true),
])
void main() {
  late GetIt _getIt;
  late MockAuthBloc _mockAuthBloc;
  late MockISignInServiceLocator _sl;
  late MockNavigatorObserver _mockNavigationObserver;
  late MockLocalAuthenticationBloc _mockLocalAuthenticationBloc;

  setUp(() {
    _getIt = GetIt.instance;

    _sl = MockISignInServiceLocator(getIt: _getIt);

    _mockAuthBloc = MockAuthBloc();

    _mockLocalAuthenticationBloc = MockLocalAuthenticationBloc();

    _mockNavigationObserver = MockNavigatorObserver();

    // BLoC

    _getIt.registerLazySingleton<AuthBloc>(
      () => _mockAuthBloc,
    );

    _getIt.registerLazySingleton<LocalAuthenticationBloc>(
      () => _mockLocalAuthenticationBloc,
    );

    // Features Service Locators

    _getIt.registerLazySingleton<ISignInServiceLocator>(
      () => _sl,
    );
  });

  tearDown(() => _getIt.reset());

  void _localAuthorizationState(LocalAuthenticationState state) {
    when(_mockLocalAuthenticationBloc.state).thenReturn(state);
    when(_mockLocalAuthenticationBloc.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  void _authState(AuthState state) {
    when(_mockAuthBloc.state).thenReturn(state);
    when(_mockAuthBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  void _navigationState(SignInPageGoTo state) {
    when(_sl.mockNavigationManager.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  void _signInState(SignInOptionsState state) {
    when(_sl.mockSignInBloc.state).thenReturn(state);
    when(_sl.mockSignInBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  void _initialState() {
    _localAuthorizationState(const LocalAuthenticationState.authorized());
    _authState(const AuthState.unauthenticated());
    _navigationState(SignInPageGoTo.optionsPage());
    _signInState(const SignInOptionsState.initial());
  }

  Future<void> _pumpWidgetAlphaPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoutes.onGenerateRoute,
        routes: NavigationRoutes.routes(),
        // initialRoute: NavigationRoutes.alpha,
        navigatorObservers: [_mockNavigationObserver],
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

      _initialState();

      // Act

      await _pumpWidgetAlphaPage(tester);

      // Assert

      expect(find.text(context.l10n.signin_signInPageTitle), findsOneWidget);

      expect(find.byType(SignInOptionsPage), findsOneWidget);
    });

    testWidgets('shoud return authenticated redering the home page',
        (WidgetTester tester) async {
      // Arrange

      _initialState();

      _authState(AuthState.authenticated(User(
        credential: AuthFacadeMock.validTestCredential,
        name: 'test',
      )));

      // Act

      await _pumpWidgetAlphaPage(tester);

      // Assert

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('shoud return a loading indicator',
        (WidgetTester tester) async {
      // Arrange

      _initialState();

      _authState(
        const AuthState.inProcess(),
      );

      // Act

      await _pumpWidgetAlphaPage(tester);

      // Assert

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shoud return a splash page with a image asset png',
        (WidgetTester tester) async {
      // Arrange

      _initialState();

      _authState(
        const AuthState.initial(),
      );

      // Act

      await _pumpWidgetAlphaPage(tester);

      // Assert

      expect(find.byType(Image), findsOneWidget);
    });
  });

  group('when requesting local authorization', () {
    testWidgets('when receive loading should show corret page',
        (WidgetTester tester) async {
      // arrange

      _initialState();

      _authState(AuthState.authenticated(User(
        credential: AuthFacadeMock.validTestCredential,
        name: 'test',
      )));

      _localAuthorizationState(const LocalAuthenticationState.loading());

      // act

      await _pumpWidgetAlphaPage(tester);

      // assert

      expect(find.byType(Splash), findsOneWidget);
    });

    testWidgets('when receive unauthorized should show corret page',
        (WidgetTester tester) async {
      // arrange

      _initialState();

      _authState(AuthState.authenticated(User(
        credential: AuthFacadeMock.validTestCredential,
        name: 'test',
      )));

      _localAuthorizationState(const LocalAuthenticationState.unauthorized());

      // act

      await _pumpWidgetAlphaPage(tester);

      // assert

      expect(find.byType(LocalAuthenticationPage), findsOneWidget);
    });

    testWidgets('when receive authorized should show corret page',
        (WidgetTester tester) async {
      // arrange

      _initialState();

      _authState(AuthState.authenticated(User(
        credential: AuthFacadeMock.validTestCredential,
        name: 'test',
      )));

      _localAuthorizationState(const LocalAuthenticationState.authorized());

      // act

      await _pumpWidgetAlphaPage(tester);

      // assert

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
