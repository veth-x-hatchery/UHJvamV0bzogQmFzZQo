import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

void main() {
  test('should instantiate with success', () {
    // arrange && act

    final result = User(
      credential: Credential('test@test.com'),
      name: 'Tester',
    );

    // assert

    expect(result.name, 'Tester');

    expect(result.credential.getOrCrash(), 'test@test.com');
  });

  test('should compare with success', () {
    // arrange && act

    final result1 = User(
      credential: Credential('test@test.com'),
      name: 'Tester',
    );

    final result2 = User(
      credential: Credential('test@test.com'),
      name: 'Tester',
    );

    // assert

    expect(result1, result2);
  });

  test('should copy with success', () {
    // arrange && act

    final result1 = User(
      credential: Credential('test@test.com'),
      name: 'Tester',
    );

    final result2 = User(
      credential: Credential('test@test.com'),
      name: 'Tester',
    ).copyWith(name: 'Tester 2');

    // assert

    expect(result2.name, 'Tester 2');

    expect(result1.credential, result2.credential);
  });
}
