import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:hatchery/core/services/storage/i_local_storage.service.dart';
import 'package:hatchery/core/services/storage/pii.service.dart';

import 'pii.service_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<FlutterSecureStorage>(returnNullOnMissingStub: true),
])
void main() {
  //
  late PII _pii;
  late MockFlutterSecureStorage _mockFlutterSecureStorage;

  setUp(() {
    _mockFlutterSecureStorage = MockFlutterSecureStorage();
    _pii = PII(_mockFlutterSecureStorage);
  });

  test('should get all key values', () {
    // arrange && act && assert
    for (final key in PersonallyIdentifiableInformationKeys.values) {
      final keyValue = _pii.getKey(key);
      expect(keyValue.isRight(), true, reason: '$keyValue');
    }
  });

  group('when get cached value', () {
    test('should return object not found', () async {
      // arrange

      final keyValue = _pii
          .getKey(PersonallyIdentifiableInformationKeys.authToken)
          .fold((l) => null, (r) => r);

      when(_mockFlutterSecureStorage.read(key: keyValue))
          .thenAnswer((_) async => null);

      // act

      final result =
          await _pii.get(key: PersonallyIdentifiableInformationKeys.authToken);

      // assert

      expect(
          result,
          left(PII.objectNotFound(
              PersonallyIdentifiableInformationKeys.authToken)));
    });

    test('should return the object', () async {
      // arrange

      final key = _pii
          .getKey(PersonallyIdentifiableInformationKeys.authToken)
          .fold((l) => null, (r) => r);

      const value = '{data: data}';

      when(_mockFlutterSecureStorage.read(key: key))
          .thenAnswer((_) async => value);

      // act

      final result =
          await _pii.get(key: PersonallyIdentifiableInformationKeys.authToken);

      // assert

      expect(result, right(value));
    });
  });

  group('when remove cached object', () {
    test('should throw an exception', () async {
      // arrange

      final key = _pii
          .getKey(PersonallyIdentifiableInformationKeys.authToken)
          .fold((l) => null, (r) => r);

      when(_mockFlutterSecureStorage.delete(key: key))
          .thenThrow(PlatformException(code: ''));

      // act

      final result = await _pii.remove(
          key: PersonallyIdentifiableInformationKeys.authToken);

      // assert

      expect(result, left(PII.unavailableService()));
    });

    test('should remove with success', () async {
      // arrange

      final key = _pii
          .getKey(PersonallyIdentifiableInformationKeys.authToken)
          .fold((l) => null, (r) => r);

      when(_mockFlutterSecureStorage.delete(key: key))
          .thenAnswer((_) => Future.value());

      // act

      final result = await _pii.remove(
          key: PersonallyIdentifiableInformationKeys.authToken);

      // assert

      expect(result, right(unit));
    });
  });

  group('when write an object', () {
    test('should throw an exception', () async {
      // arrange

      const key = PersonallyIdentifiableInformationKeys.authToken;

      final keyValue = _pii
          .getKey(PersonallyIdentifiableInformationKeys.authToken)
          .fold((l) => null, (r) => r);

      const value = 'data';

      when(_mockFlutterSecureStorage.write(key: keyValue, value: value))
          .thenThrow(PlatformException(code: ''));

      // act

      final result = await _pii.write(
        key: key,
        obj: value,
      );

      // assert

      expect(result, left(PII.unavailableService()));
    });

    test('should write with success', () async {
      // arrange

      when(_mockFlutterSecureStorage.write()).thenAnswer((_) => Future.value());

      // act

      final result = await _pii.write(
        key: PersonallyIdentifiableInformationKeys.authToken,
        obj: 'data',
      );

      // assert

      expect(result, right(unit));
    });
  });
}
