import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/core/utils/logger.dart';

import 'i_local_storage.service.dart';

class CacheService implements ILocalStorage<SensitiveData> {
  /// echo 'CacheKeys.*' | base64
  static const Map<SensitiveData, String> _cacheKeys = {
    SensitiveData.apiEndPointXYZ: 'Q2FjaGVLZXlzLmFwaUVuZFBvaW50WFlaCg',
  };

  static const String hiveBoxName = 'asdf';

  late HiveInterface _storage;

  CacheService._() {
    _storage = Hive;
    _storage.openBox(hiveBoxName);
  }

  static final instance = CacheService._();

  Future<void> _openBox() async {
    if (!_storage.isBoxOpen(hiveBoxName)) {
      await _storage.openBox(hiveBoxName);
    }
  }

  @override
  Either<Failure, String> getKey(SensitiveData key) {
    final value = _cacheKeys[key];
    if (value == null) {
      return left(Failure.cacheFailure(
          message: 'key: $key not registered in our enum'));
    }
    return right(value);
  }

  @override
  Future<Either<Failure, String>> get({required SensitiveData key}) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        await _openBox();
        final obj = _storage.box<String>(hiveBoxName).get(keyValue);
        if (obj == null) {
          return left(
              Failure.cacheFailure(message: 'key: $key object not found'));
        }
        return right(obj);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> remove({required SensitiveData key}) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        try {
          await _storage.box(hiveBoxName).delete(keyValue);
        } on PlatformException catch (ex, stack) {
          Logger.utils('CacheService, write', exception: ex, stackTrace: stack);
          return left(
              const Failure.cacheFailure(message: 'Cache storage unavailable'));
        }
        return right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> write({
    required SensitiveData key,
    required String obj,
  }) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        try {
          await _storage.box(hiveBoxName).put(keyValue, obj);
        } on PlatformException catch (ex, stack) {
          Logger.utils('CacheService, write', exception: ex, stackTrace: stack);
          return left(
              const Failure.cacheFailure(message: 'Cache storage unavailable'));
        }
        return right(unit);
      },
    );
  }
}
