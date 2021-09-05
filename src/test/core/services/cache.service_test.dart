import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive/src/hive_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/services/storage/cache.service.dart';
import 'package:vethx_beta/core/services/storage/i_local_storage.service.dart';
import 'package:vethx_beta/core/services/storage/pii.service.dart';

import 'cache.service_test.mocks.dart';

// class MockHiveInterface extends Mock implements HiveInterface {}

// class MockHiveBox<T> extends Mock implements Box<T> {}

@GenerateMocks([
  PII,
], customMocks: [
  MockSpec<Box>(returnNullOnMissingStub: true),
  MockSpec<HiveImpl>(returnNullOnMissingStub: true),
])
void main() {
  late CacheService _cacheService;
  late MockHiveImpl _mockStorage;
  late MockBox<String> _mockHiveBox;
  late MockPII _mockPII;

  void _setupHive() {
    _mockHiveBox = MockBox<String>();
    _mockStorage = MockHiveImpl();
    _mockPII = MockPII();

    when(_mockStorage.box<String>(any)).thenAnswer((_) => _mockHiveBox);

    when(_mockStorage.openBox<String>(any))
        .thenAnswer((_) async => _mockHiveBox);

    when(_mockStorage.isBoxOpen(any)).thenAnswer((_) => true);
  }

  setUp(() {
    _setupHive();
    _cacheService = CacheService(
      _mockStorage,
      _mockPII,
    );
  });

  test('should get all key values', () {
    // arrange && act && assert
    for (final key in SensitiveDataKeys.values) {
      final keyValue = _cacheService.getKey(key);
      expect(keyValue.isRight(), true, reason: '$keyValue');
    }
  });

  group('when get cached value', () {
    test('should return object not found', () async {
      // arrange

      when(_mockHiveBox.get(any)).thenReturn(null);

      // act

      final result =
          await _cacheService.get(key: SensitiveDataKeys.apiEndPointXYZ);

      // assert

      expect(result,
          left(CacheService.objectNotFound(SensitiveDataKeys.apiEndPointXYZ)));
    });

    test('should return the object', () async {
      // arrange

      const keyValue = '{data: data}';

      when(_mockHiveBox.get(any)).thenReturn(keyValue);

      // act

      final result =
          await _cacheService.get(key: SensitiveDataKeys.apiEndPointXYZ);

      // assert

      expect(result, right(keyValue));
    });
  });

  group('when remove cached object', () {
    test('should throw an exception', () async {
      // arrange

      when(_mockHiveBox.delete(any)).thenThrow(PlatformException(code: ''));

      // act

      final result =
          await _cacheService.remove(key: SensitiveDataKeys.apiEndPointXYZ);

      // assert

      expect(result, left(CacheService.unavailableService()));
    });

    test('should remove with success', () async {
      // arrange

      when(_mockHiveBox.delete(any)).thenAnswer((_) => Future.value());

      // act

      final result =
          await _cacheService.remove(key: SensitiveDataKeys.apiEndPointXYZ);

      // assert

      expect(result, right(unit));
    });
  });

  group('when write an object', () {
    test('should throw an exception', () async {
      // arrange

      when(_mockHiveBox.put(any, any)).thenThrow(PlatformException(code: ''));

      // act

      final result = await _cacheService.write(
        key: SensitiveDataKeys.apiEndPointXYZ,
        obj: 'data',
      );

      // assert

      expect(result, left(CacheService.unavailableService()));
    });

    test('should write with success', () async {
      // arrange

      when(_mockHiveBox.put(any, any)).thenAnswer((_) => Future.value());

      // act

      final result = await _cacheService.write(
        key: SensitiveDataKeys.apiEndPointXYZ,
        obj: 'data',
      );

      // assert

      expect(result, right(unit));
    });
  });
}
