import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/core/utils/logger.dart';

import 'i_local_storage.service.dart';

class CacheService implements ILocalStorage<SensitiveDataKeys> {
  /// echo 'CacheKeys.*' | base64
  static const Map<SensitiveDataKeys, String> _cacheKeys = {
    SensitiveDataKeys.apiEndPointXYZ: 'Q2FjaGVLZXlzLmFwaUVuZFBvaW50WFlaCg',
    SensitiveDataKeys.authenticationRequest:
        'UElJS2V5cy5hdXRoZW50aWNhdGlvblJlcXVlc3QK',
  };

  static Failure objectNotFound(SensitiveDataKeys key) =>
      Failure.cacheFailure(message: 'key: $key object not found');

  static Failure unavailableService() =>
      const Failure.cacheFailure(message: 'Cache storage unavailable');

  static const String hiveBoxName =
      'SUxvY2FsU3RvcmFnZTxTZW5zaXRpdmVEYXRhS2V5cz4K';

  final HiveInterface _storage;

  CacheService(this._storage);

  Future<Box<String>> _table() async {
    return _storage.openBox<String>(
      hiveBoxName,
      // Todo(v): https://docs.hivedb.dev/#/advanced/encrypted_box
    );
  }

  @override
  Either<Failure, String> getKey(SensitiveDataKeys key) {
    final value = _cacheKeys[key];
    if (value == null) {
      throw Exception('key: $key not registered in our enum');
    }
    return right(value);
  }

  @override
  Future<Either<Failure, String>> get({required SensitiveDataKeys key}) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        final table = await _table();
        final obj = table.get(keyValue);
        if (obj == null) {
          return left(objectNotFound(key));
        }
        return right(obj);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> remove({required SensitiveDataKeys key}) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        try {
          final table = await _table();
          await table.delete(keyValue);
        } on PlatformException catch (ex, stack) {
          Logger.utils('CacheService, remove',
              exception: ex, stackTrace: stack);
          return left(unavailableService());
        }
        return right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> write({
    required SensitiveDataKeys key,
    required String obj,
  }) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        try {
          final table = await _table();
          await table.put(keyValue, obj);
        } on PlatformException catch (ex, stack) {
          Logger.utils('CacheService, write', exception: ex, stackTrace: stack);
          return left(unavailableService());
        }
        return right(unit);
      },
    );
  }
}
