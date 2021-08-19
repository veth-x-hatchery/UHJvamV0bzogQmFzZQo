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
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/alpha/alpha.page.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../helpers/widgets/pumpWidget.widget.dart';
import 'sign_in_options.page_test.mocks.dart';

@GenerateMocks([
  AuthBloc,
  SignInBloc,
  NavigationCubit,
], customMocks: [
  MockSpec<NavigatorObserver>(returnNullOnMissingStub: true)
])
void main() {
  late MockAuthBloc _mockAuthBloc;
  late MockSignInBloc _mockSignInBloc;
  late NavigationCubit _navigationCubit;

  late MockNavigatorObserver _mockNavigationObserver;

  late GetIt sl;

  setUp(() {
    _mockAuthBloc = MockAuthBloc();
    _mockSignInBloc = MockSignInBloc();
    _navigationCubit = NavigationCubit();
    _mockNavigationObserver = MockNavigatorObserver();

    sl = GetIt.instance;
    sl.registerFactory<AuthBloc>(() => _mockAuthBloc);
    sl.registerFactory<SignInBloc>(() => _mockSignInBloc);
    sl.registerLazySingleton<NavigationCubit>(() => _navigationCubit);
  });

  tearDown(() => sl.reset());

  void _navigationState(NavigationState state) {
    // _navigationCubit.emit(state);
    // when(_navigationCubit.state).thenReturn(state);
    // when(_navigationCubit.stream).thenAnswer((_) => Stream.value(state));
  }

  void _signInState(SignInState state) {
    when(_mockSignInBloc.state).thenReturn(state);
    when(_mockSignInBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  void _authState(AuthState state) {
    when(_mockAuthBloc.state).thenReturn(state);
    when(_mockAuthBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [_mockNavigationObserver],
        home: setupToPump(
          Scaffold(
            body: SignInOptionsPage.create(),
          ),
        ),
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

      await _pumpPage(tester);

      // Assert

      expect(find.text(Texts.signInPageTitle), findsOneWidget);
    });
  });

  group('when receiving navigation events', () {
    testWidgets('should go from email page to password page',
        (WidgetTester tester) async {
      // Arrange

      _authState(const AuthState.unauthenticated());

      _signInState(const SignInState.initial());

      // Act

      await _pumpPage(tester);

      // act

      _navigationCubit.goTo(SignInPageGoTo.passwordPage(
        from: SignInPageRoutes.emailEntry,
        email: 'teste@teste.com',
      ));

      // assert

      verify(_mockNavigationObserver.didPush(any, any)).called(1);

      await tester.pumpAndSettle();

      expect(find.byType(FormPassword), findsOneWidget);
    });

    testWidgets('should go from email page to register page',
        (WidgetTester tester) async {
      // Arrange

      _authState(const AuthState.unauthenticated());

      _signInState(const SignInState.initial());

      // Act

      await _pumpPage(tester);

      // act

      _navigationCubit.goTo(SignInPageGoTo.registerPage(
        from: SignInPageRoutes.emailEntry,
        email: 'test@test.com',
      ));

      // assert

      verify(_mockNavigationObserver.didPush(any, any)).called(1);

      await tester.pumpAndSettle();

      expect(find.byType(FormRegister), findsOneWidget);
    });

    testWidgets('should go from any page to email page',
        (WidgetTester tester) async {
      // Arrange

      _authState(const AuthState.unauthenticated());

      _signInState(const SignInState.initial());

      // Act

      await _pumpPage(tester);

      // act

      _navigationCubit.goTo(
        SignInPageGoTo.emailPage(from: SignInPageRoutes.signInOptions),
      );

      // assert

      verify(_mockNavigationObserver.didPush(any, any)).called(1);

      await tester.pumpAndSettle();

      expect(find.byType(FiedEmail), findsOneWidget);
    });
  });

  group('when calling methods', () {
    testWidgets('should show the loading indicator',
        (WidgetTester tester) async {
      // Arrange

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.loading());

      // Act

      await _pumpPage(tester);

      // Assert

      expect(find.byType(GenericProgressIndicator), findsOneWidget);
    });
  });

  group('when signing with google', () {
    testWidgets('should find the correct button option', (tester) async {
      // Arrange

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.initial());

      // Act

      await _pumpPage(tester);

      final googleSignInButton =
          find.byKey(const Key(SignInPageKeys.signInWithGoogleButton));

      // Assert

      expect(googleSignInButton, findsOneWidget);
    });

    testWidgets('should emit the correct event when press the button',
        (tester) async {
      // Arrange

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.loading());

      await _pumpPage(tester);

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

  group('when sign in with email', () {
    testWidgets('should find the correct button option', (tester) async {
      // Arrange

      _authState(const AuthState.unauthenticated());

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.initial());

      // Act

      await _pumpPage(tester);

      final emailSignInButton =
          find.byKey(const Key(SignInPageKeys.signInWithEmail));

      // Assert

      expect(emailSignInButton, findsOneWidget);
    });

    testWidgets('should emit the correct event when press the button',
        (tester) async {
      // Arrange

      _authState(const AuthState.unauthenticated());

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.initial());

      await _pumpPage(tester);

      final emailSignInButton =
          find.byKey(const Key(SignInPageKeys.signInWithEmail));

      // Act

      await tester.tap(emailSignInButton);

      // Assert

      _navigationCubit.stream.listen((value) {
        expect(
            value,
            NavigationState.goTo(SignInPageGoTo.emailPage(
                from: SignInPageRoutes.signInOptions)));
      });

      verify(_mockNavigationObserver.didPush(any, any)).called(1);
    });
  });
}
