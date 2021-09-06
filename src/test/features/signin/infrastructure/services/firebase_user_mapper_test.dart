import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_user_mapper.dart';

import 'firebase_auth_facade_test.mocks.dart';

@GenerateMocks([User])
void main() {
  late FirebaseUserMapper _firebaseUserMapper;
  late MockUser _mockFirebaseUser;

  setUp(() {
    _firebaseUserMapper = FirebaseUserMapper();
    _mockFirebaseUser = MockUser();
  });

  test('should return a user with correct display name', () {
    // arrange

    when(_mockFirebaseUser.displayName).thenReturn('user display name');

    when(_mockFirebaseUser.email).thenReturn('user@domain.com');

    // act

    final mapped = _firebaseUserMapper.toDomain(_mockFirebaseUser);

    // assert

    expect(mapped?.name, _mockFirebaseUser.displayName);
  });

  test('should return a user with splitted email', () {
    // arrange

    when(_mockFirebaseUser.displayName).thenReturn(null);

    when(_mockFirebaseUser.email).thenReturn('user@domain.com');

    // act

    final mapped = _firebaseUserMapper.toDomain(_mockFirebaseUser);

    // assert

    expect(mapped?.name, _mockFirebaseUser.email!.split('@').first);
  });

  test('should return a user with splitted email', () {
    // arrange

    when(_mockFirebaseUser.displayName).thenReturn(null);

    when(_mockFirebaseUser.email).thenReturn('user@domain.com');

    // act

    final mapped = _firebaseUserMapper.toDomain(_mockFirebaseUser);

    // assert

    expect(mapped?.name, _mockFirebaseUser.email!.split('@').first);
  });

  test('should return null', () {
    // arrange
    // act
    final mapped = _firebaseUserMapper.toDomain(null);

    // assert

    expect(mapped, null);
  });

  test('should return not found display name', () {
    // arrange

    when(_mockFirebaseUser.displayName).thenReturn(null);

    when(_mockFirebaseUser.email).thenReturn(null);

    // act

    final mapped = _firebaseUserMapper.toDomain(_mockFirebaseUser);

    // assert

    expect(mapped?.name, 'Not found');
    expect(mapped!.credential.getOrCrash(), 'notfound@notfound.com');
  });
}
