import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/presentation/bloc/auth/auth_bloc.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([IAuthFacade])
void main() {
  late AuthBloc _bloc;
  late MockIAuthFacade _mockIAuthFacade;

  setUp(() {
    _mockIAuthFacade = MockIAuthFacade();
    _bloc = AuthBloc(_mockIAuthFacade);
  });

  // tearDown(() {
  //   _bloc.close();
  // });

  group('when check logged user request', () {
    test('should return that there is no user logged in', () async {
      // arrange

      when(_mockIAuthFacade.getSignedInUser())
          .thenAnswer((_) => Future.value());

      final expected = [
        const AuthState.unauthenticated(),
      ];

      // act

      _bloc.add(const AuthCheckRequested());

      // assert

      await expectLater(_bloc.stream, emitsInOrder(expected));
    });

    test('should return the authenticated user', () async {
      // arrange

      final user =
          User(email: EmailAddress('test@vethx.com'), name: 'Vethx Test');

      when(_mockIAuthFacade.getSignedInUser())
          .thenAnswer((_) => Future.value(user));

      final expected = [
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

    when(_mockIAuthFacade.signOut()).thenAnswer((_) => Future.value());

    final expected = [
      const AuthState.unauthenticated(),
    ];

    // act

    _bloc.add(const SignedOut());

    // assert

    await expectLater(_bloc.stream, emitsInOrder(expected));
  });
}
