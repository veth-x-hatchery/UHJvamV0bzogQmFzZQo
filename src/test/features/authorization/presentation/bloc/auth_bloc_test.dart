import 'package:flutter_test/flutter_test.dart';
import 'package:hatchery/features/authorization/presentation/bloc/auth_bloc.dart';
import 'package:hatchery/features/signin/domain/entities/user_entity.dart';
import 'package:hatchery/features/signin/domain/services/i_auth.service.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_auth.service.mock.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([
  IAuthService,
])
void main() {
  late AuthBloc _bloc;
  late MockIAuthService _mockIAuthService;

  setUp(() {
    _mockIAuthService = MockIAuthService();
    _bloc = AuthBloc(
      _mockIAuthService,
    );
  });

  // tearDown(() {
  //   _bloc.close();
  // });

  group('when check logged user request', () {
    test('should return that there is no user logged in', () async {
      // arrange

      when(_mockIAuthService.getSignedInUser())
          .thenAnswer((_) async => Future.value());

      final expected = [
        const AuthState.inProcess(),
        const AuthState.unauthenticated(),
      ];

      // act

      _bloc.add(const AuthCheckRequested());

      // assert

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });

    test('should return the authenticated user', () async {
      // arrange
      final credential = AuthServiceMock.validTestCredential;
      final user = User(credential: credential, name: 'Vethx Test');

      when(_mockIAuthService.getSignedInUser())
          .thenAnswer((_) => Future.value(user));

      final expected = [
        const AuthState.inProcess(),
        AuthState.authenticated(user),
      ];

      // act

      _bloc.add(const AuthCheckRequested());

      // assert

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });
  });

  test('when event logout request should return unauthenticated state',
      () async {
    // arrange

    when(_mockIAuthService.signOut()).thenAnswer((_) async => _);

    final expected = [
      const AuthState.inProcess(),
      const AuthState.unauthenticated(),
    ];

    // act

    _bloc.add(const SignedOut());

    // assert

    await expectLater(_bloc.stream, emitsInOrder(expected));
  });
}
