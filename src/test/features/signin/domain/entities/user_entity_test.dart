import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';

void main() {
  test('should instantiate with success', () {
    // arrange && act

    final result = User(
      credential: AuthFacadeMock.validTestCredential,
      name: 'Tester',
    );

    // assert

    expect(result.name, 'Tester');

    expect(result.credential.getOrCrash(),
        AuthFacadeMock.validTestCredential.getOrCrash());
  });

  test('should compare with success', () {
    // arrange && act

    final result1 = User(
      credential: AuthFacadeMock.validTestCredential,
      name: 'Tester',
    );

    final result2 = User(
      credential: AuthFacadeMock.validTestCredential,
      name: 'Tester',
    );

    // assert

    expect(result1, result2);
  });

  test('should copy with success', () {
    // arrange && act

    final result1 = User(
      credential: AuthFacadeMock.validTestCredential,
      name: 'Tester',
    );

    final result2 = User(
      credential: AuthFacadeMock.validTestCredential,
      name: 'Tester',
    ).copyWith(name: 'Tester 2');

    // assert

    expect(result2.name, 'Tester 2');

    expect(result1.credential, result2.credential);
  });
}
