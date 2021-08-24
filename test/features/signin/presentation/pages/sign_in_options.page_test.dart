import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';
import 'package:vethx_beta/core/routes/navigation.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/credential/sign_in_credential_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/options/sign_in_options_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/register/sign_in_register_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/secret/sign_in_secret_bloc.dart';
import 'package:vethx_beta/features/signin/presentation/cubit/navigation_cubit.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_credential.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_options.page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_register_page.dart';
import 'package:vethx_beta/features/signin/presentation/pages/sign_in_secret.page.dart';
import 'package:vethx_beta/features/signin/presentation/routes/sign_in_go_to.dart';
import 'package:vethx_beta/features/signin/presentation/widgets/sign_in.widgets.dart';
import 'package:vethx_beta/ui/widgets/shared/progress-indicator.widget.dart';

import '../../../../helpers/features/signin/sign_in_service_locator.mock.dart';
import '../../../../helpers/widgets/pumpWidget.widget.dart';

import 'sign_in_options.page_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigatorObserver>(returnNullOnMissingStub: true),
])
void main() {
  late GetIt getIt;
  late MockNavigatorObserver _mockNavigationObserver;
  late MockISignInServiceLocator _sl;

  setUp(() {
    getIt = GetIt.instance;

    _sl = MockISignInServiceLocator(
      getIt: getIt,
      useNavigationMock: false,
    );

    _mockNavigationObserver = MockNavigatorObserver();
  });

  tearDown(() {
    getIt.reset();
  });

  void _signInState(SignInOptionsState state) {
    when(_sl.mockSignInBloc.state).thenReturn(state);
    when(_sl.mockSignInBloc.stream).thenAnswer((_) => Stream.value(state));
  }

  void _signInCredentialState(SignInCredentialState state) {
    when(_sl.mockSignInCredentialBloc.state).thenReturn(state);
    when(_sl.mockSignInCredentialBloc.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  void _signInRegisterState(SignInRegisterState state) {
    when(_sl.mockSignInRegisterBloc.state).thenReturn(state);
    when(_sl.mockSignInRegisterBloc.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  void _signInSecretState(SignInSecretState state) {
    when(_sl.mockSignInSecretBloc.state).thenReturn(state);
    when(_sl.mockSignInSecretBloc.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  void _signInSecretResetState(SignInSecretResetState state) {
    when(_sl.mockSignInSecretResetBloc.state).thenReturn(state);
    when(_sl.mockSignInSecretResetBloc.stream)
        .thenAnswer((_) => Stream.value(state));
  }

  void _setInitialState() {
    _signInState(const SignInOptionsState.initial());
    _signInCredentialState(SignInCredentialState.initial());
    _signInRegisterState(SignInRegisterState.initial());
    _signInSecretState(SignInSecretState.initial());
    _signInSecretState(SignInSecretState.initial());
    _signInSecretResetState(SignInSecretResetState.initial());
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
            body: SignInOptionsPage.create(serviceLocator: _sl),
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

      // verifyNever(_sl.dispose);
    });

    tearDown(() {
      // verifyNever(_sl.dispose());
    });

    // v
  });

  group('when receiving navigation events', () {
    testWidgets('should go from credential page to secret page',
        (WidgetTester tester) async {
      // Arrange

      _setInitialState();

      // Act

      await _pumpPage(tester);

      // act

      _sl.navigationCubit.goTo(SignInPageGoTo.secretPage(
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

      _sl.navigationCubit.goTo(SignInPageGoTo.registerPage(
        from: SignInPageRoutes.credentialEntry,
        credential: Credential('test@test.com'),
      ));

      // assert

      // Todo(v): Research
      // verify(_mockNavigationObserver.didPush(any, any)).called(1);

      await tester.pumpAndSettle();

      expect(find.byType(SignInRegisterPage), findsOneWidget);
    });

    testWidgets('should go from secret page to credential page',
        (WidgetTester tester) async {
      // Arrange

      _setInitialState();

      // Act

      await _pumpPage(tester);

      // act

      _sl.navigationCubit.goTo(
        SignInPageGoTo.credentialPage(from: SignInPageRoutes.secretEntry),
      );

      // assert

      // Todo(v): Research
      // verify(_mockNavigationObserver.didPush(any, any)).called(1);

      await tester.pumpAndSettle();

      expect(find.byType(SignInCredentialPage), findsOneWidget);
    });

    testWidgets('should go from any page to credential page',
        (WidgetTester tester) async {
      // Arrange

      _setInitialState();

      // Act

      await _pumpPage(tester);

      // act

      _sl.navigationCubit.goTo(
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

      _signInState(const SignInOptionsState.loading());

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

      _signInState(const SignInOptionsState.loading());

      await _pumpPage(tester);

      final googleSignInButton =
          find.byKey(const Key(SignInPageKeys.signInWithGoogleButton));

      // Act

      await tester.tap(googleSignInButton);

      // Assert

      verify(_sl.mockSignInBloc
              .add(const SignInOptionsEvent.signInWithGoogleEvent()))
          .called(1);

      // Assert

      await expectLater(_sl.mockSignInBloc.stream,
          emitsInOrder([const SignInOptionsState.loading()]));
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

      _sl.navigationCubit.stream.listen((value) {
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
