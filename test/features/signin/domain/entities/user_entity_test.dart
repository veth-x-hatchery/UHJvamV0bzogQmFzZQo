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
}
