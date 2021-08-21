import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/options/sign_in_options_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_register_page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_secret.page.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../helpers/widgets/pumpWidget.widget.dart';
import 'sign_in_options.page_test.mocks.dart';

@GenerateMocks([
  SignInOptionsBloc,
  SignInCredentialBloc,
  SignInRegisterBloc,
  SignInSecretBloc,
  NavigationCubit,
], customMocks: [
  MockSpec<NavigatorObserver>(returnNullOnMissingStub: true)
])
void main() {
  late MockSignInCredentialBloc _mockMockSignInCredentialBloc;
  late MockSignInRegisterBloc _mockMockSignInRegisterBloc;
  late MockSignInSecretBloc _mockMockSignInSecretBloc;
  late MockNavigatorObserver _mockNavigationObserver;

  late MockSignInOptionsBloc _mockSignInBloc;
  late NavigationCubit _navigationCubit;
  late GetIt sl;

  setUp(() {
    _mockMockSignInCredentialBloc = MockSignInCredentialBloc();
    _mockMockSignInRegisterBloc = MockSignInRegisterBloc();
    _mockMockSignInSecretBloc = MockSignInSecretBloc();

    _navigationCubit = NavigationCubit();
    _mockNavigationObserver = MockNavigatorObserver();

    _mockSignInBloc = MockSignInOptionsBloc();

    sl = GetIt.instance;

    sl.registerFactory<SignInOptionsBloc>(() => _mockSignInBloc);
    sl.registerFactory<SignInCredentialBloc>(
        () => _mockMockSignInCredentialBloc);
    sl.registerFactory<SignInRegisterBloc>(() => _mockMockSignInRegisterBloc);
    sl.registerFactory<SignInSecretBloc>(() => _mockMockSignInSecretBloc);

    sl.registerLazySingleton<NavigationCubit>(() => _navigationCubit);
  });

  tearDown(() => sl.reset());

  void _signInState(SignInState state) {
    when(_mockSignInBloc.state).thenReturn(state);
    when(_mockSignInBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  // ignore: non_constant_identifier_names
  void _SignInCredentialState(SignInCredentialState state) {
    when(_mockMockSignInCredentialBloc.state).thenReturn(state);
    when(_mockMockSignInCredentialBloc.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  // ignore: non_constant_identifier_names
  void _SignInRegisterState(SignInRegisterState state) {
    when(_mockMockSignInRegisterBloc.state).thenReturn(state);
    when(_mockMockSignInRegisterBloc.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  // ignore: non_constant_identifier_names
  void _SignInSecretState(SignInSecretState state) {
    when(_mockMockSignInSecretBloc.state).thenReturn(state);
    when(_mockMockSignInSecretBloc.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  void _setInitialState() {
    _signInState(const SignInState.initial());
    _SignInCredentialState(SignInCredentialState.initial());
    _SignInRegisterState(SignInRegisterState.initial());
    _SignInSecretState(SignInSecretState.initial());
  }

  Future<void> _pumpPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [
          _mockNavigationObserver,
          LoggingNavigationObserver()
        ],
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

      _setInitialState();

      // Act

      await _pumpPage(tester);

      // Assert

      expect(find.text(Texts.signInPageTitle), findsOneWidget);
    });
  });

  group('when receiving navigation events', () {
    testWidgets('should go from credential page to secret page',
        (WidgetTester tester) async {
      // Arrange

      _setInitialState();

      // Act

      await _pumpPage(tester);

      // act

      _navigationCubit.goTo(SignInPageGoTo.secretPage(
        from: SignInPageRoutes.credentialEntry,
        credential: 'teste@teste.com',
      ));

      // assert

      // Todo(v): Research
      // verify(_mockNavigationObserver.didPush(any, any)).called(1);

      await tester.pumpAndSettle();

      expect(find.byType(SignInSecretPage), findsOneWidget);
    });

    testWidgets('should go from credential page to register page',
        (WidgetTester tester) async {
      // Arrange

      _setInitialState();

      // Act

      await _pumpPage(tester);

      // act

      _navigationCubit.goTo(SignInPageGoTo.registerPage(
        from: SignInPageRoutes.credentialEntry,
        credential: 'test@test.com',
      ));

      // assert

      // Todo(v): Research
      // verify(_mockNavigationObserver.didPush(any, any)).called(1);

      await tester.pumpAndSettle();

      expect(find.byType(SignInRegisterPage), findsOneWidget);
    });

    testWidgets('should go from any page to credential page',
        (WidgetTester tester) async {
      // Arrange

      _setInitialState();

      // Act

      await _pumpPage(tester);

      // act

      _navigationCubit.goTo(
        SignInPageGoTo.credentialPage(from: SignInPageRoutes.signInOptions),
      );

      // assert

      // Todo(v): Research
      // verify(_mockNavigationObserver.didPush(any, any)).called(1);

      await tester.pumpAndSettle();

      expect(find.byType(SignInCredentialPage), findsOneWidget);
    });
  });

  group('when calling methods', () {
    testWidgets('should show the loading indicator',
        (WidgetTester tester) async {
      // Arrange

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

      _setInitialState();

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

  group('when sign in with credential', () {
    testWidgets('should find the correct button option', (tester) async {
      // Arrange

      _setInitialState();

      // Act

      await _pumpPage(tester);

      final credentialSignInButton =
          find.byKey(const Key(SignInPageKeys.signInWithCredential));

      // Assert

      expect(credentialSignInButton, findsOneWidget);
    });

    testWidgets('should emit the correct event when press the button',
        (tester) async {
      // Arrange

      _setInitialState();

      await _pumpPage(tester);

      final credentialSignInButton =
          find.byKey(const Key(SignInPageKeys.signInWithCredential));

      // Act

      await tester.tap(credentialSignInButton);

      // Assert

      _navigationCubit.stream.listen((value) {
        expect(
            value,
            NavigationState.goTo(SignInPageGoTo.credentialPage(
                from: SignInPageRoutes.signInOptions)));
      });

      await tester.pumpAndSettle();

      expect(find.byType(SignInCredentialPage), findsOneWidget);

      // Todo(v): Research
      // verify(_mockNavigationObserver.didPush(any, any)).called(1);
    });
  });
}
