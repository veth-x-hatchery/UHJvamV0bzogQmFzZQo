import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/signin/sign_in_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../../helpers/widgets/pumpWidget.widget.dart';
import 'sign_in_options.widget_test.mocks.dart';

@GenerateMocks([
  SignInBloc,
  NavigationCubit,
], customMocks: [
  MockSpec<NavigatorObserver>(returnNullOnMissingStub: true)
])
void main() {
  late MockSignInBloc _mockSignInBloc;
  late MockNavigationCubit _mockNavigationCubit;
  late MockNavigatorObserver _mockNavigationObserver;

  setUp(() {
    _mockSignInBloc = MockSignInBloc();
    _mockNavigationCubit = MockNavigationCubit();
    _mockNavigationObserver = MockNavigatorObserver();
  });

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
        navigatorObservers: [_mockNavigationObserver],
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<SignInBloc>(
              create: (_) => _mockSignInBloc,
            ),
            BlocProvider<NavigationCubit>(
              create: (_) => _mockNavigationCubit,
            )
          ],
          child: setupToPump(const SignInOptions()),
        ),
      ),
    );
  }

  group('when calling methods', () {
    testWidgets('should show the loading indicator',
        (WidgetTester tester) async {
      // Arrange

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

  group('when sign in with email', () {
    testWidgets('should find the correct button option', (tester) async {
      // Arrange

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.initial());

      // Act

      await _pumpWidgetAlphaPage(tester);

      final emailSignInButton =
          find.byKey(const Key(SignInPageKeys.signInWithEmail));

      // Assert

      expect(emailSignInButton, findsOneWidget);
    });

    testWidgets('should emit the correct event when press the button',
        (tester) async {
      // Arrange

      _navigationState(const NavigationState.initial());

      _signInState(const SignInState.loading());

      await _pumpWidgetAlphaPage(tester);

      final emailSignInButton =
          find.byKey(const Key(SignInPageKeys.signInWithEmail));

      // Act

      await tester.tap(emailSignInButton);

      // Assert

      verify(_mockNavigationCubit.goTo(any)).called(1);
    });
  });
}
