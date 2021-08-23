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
import 'package:vethx_beta/features/signin/presentation/bloc/options/sign_in_options_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/features/signin/sign_in_service_locator.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';

import '../../../../helpers/features/signin/sign_in_service_locator.mock.dart';
import '../../../../helpers/features/signin/sign_in_service_locator.mock.mocks.dart';
import '../../../../helpers/widgets/pumpWidget.widget.dart';

import 'alpha.page_test.mocks.dart';

@GenerateMocks([
  AuthBloc,
], customMocks: [
  MockSpec<NavigatorObserver>(returnNullOnMissingStub: true),
])
void main() {
  late GetIt getIt;
  late MockAuthBloc _mockAuthBloc;
  late MockISignInServiceLocator _sl;
  late MockNavigatorObserver _mockNavigationObserver;

  setUp(() {
    getIt = GetIt.instance;

    _sl = MockISignInServiceLocator(getIt: getIt);

    _mockAuthBloc = MockAuthBloc();

    _mockNavigationObserver = MockNavigatorObserver();

    // BLoC

    getIt.registerLazySingleton<AuthBloc>(
      () => _mockAuthBloc,
    );

    // Features Service Locators

    getIt.registerLazySingleton<ISignInServiceLocator>(
      () => _sl,
    );
  });

  tearDown(() => getIt.reset());

  void _authState(AuthState state) {
    when(_mockAuthBloc.state).thenReturn(state);
    when(_mockAuthBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  void _navigationState(NavigationState state) {
    when(_sl.mockNavigationCubit.state).thenReturn(state);
    when(_sl.mockNavigationCubit.stream).thenAnswer((_) => Stream.value(state));
  }

  void _signInState(SignInOptionsState state) {
    when(_sl.mockSignInBloc.state).thenReturn(state);
    when(_sl.mockSignInBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  void _initialState() {
    _authState(const AuthState.unauthenticated());
    _navigationState(const NavigationState.initial());
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

      expect(find.text(Texts.signInPageTitle), findsOneWidget);

      expect(find.byType(SignInOptionsPage), findsOneWidget);
    });

    testWidgets('shoud return authenticated redering the home page',
        (WidgetTester tester) async {
      // Arrange

      _initialState();

      _authState(AuthState.authenticated(User(
        credential: Credential('test@test.com'),
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

      _authState(const AuthState.initial());

      // Act

      await _pumpWidgetAlphaPage(tester);

      // Assert

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
