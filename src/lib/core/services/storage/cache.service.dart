import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:hatchery/core/error/failures.dart';
import 'package:hatchery/core/utils/logger.dart';
import 'package:hive/hive.dart';

import 'i_local_storage.service.dart';

class CacheService implements ILocalStorage<SensitiveDataKeys> {
  // echo 'CacheKeys.*' | base64

  static const Map<SensitiveDataKeys, String> _cacheKeys = {
    SensitiveDataKeys.apiEndPointXYZ: 'Q2FjaGVLZXlzLmFwaUVuZFBvaW50WFlaCg',
    SensitiveDataKeys.authenticationRequest:
        'UElJS2V5cy5hdXRoZW50aWNhdGlvblJlcXVlc3QK',
    SensitiveDataKeys.localAuthenticationSkipNextRequest:
        'Q2FjaGVLZXlzLmxvY2FsQXV0aGVudGljYXRpb25Ta2lwTmV4dFJlcXVlc3QK',
  };

  static Failure objectNotFound(SensitiveDataKeys key) =>
      Failure.cacheFailure(message: 'key: $key object not found');

  static Failure unavailableService() =>
      const Failure.cacheFailure(message: 'Cache storage unavailable');

  static const String hiveBoxName =
      'SUxvY2FsU3RvcmFnZTxTZW5zaXRpdmVEYXRhS2V5cz4K';

  //! Dependencies

  final HiveInterface _storage;
  final ILocalStorage<PersonallyIdentifiableInformationKeys> _config;

  CacheService(
    this._storage,
    this._config,
  );

  //! Encryption Key

  Future<String> _generateEnctryptionKey() async {
    final encryptionKey = base64UrlEncode(_storage.generateSecureKey());

    final result = await _config.write(
      key: PersonallyIdentifiableInformationKeys.cacheConfig,
      obj: encryptionKey,
    );

    return result.fold(
      (_) => throw PlatformException(
          message: 'Was not possible to use LocalStorage service',
          code: 'secure_storage_unavailable'),
      (_) => encryptionKey,
    );
  }

  Future<String> _encryptionKey() async {
    final encryptionKey = await _config.get(
        key: PersonallyIdentifiableInformationKeys.cacheConfig);

    return encryptionKey.fold(
      (notFound) async => _generateEnctryptionKey(),
      (encryptionKey) => encryptionKey,
    );
  }

  static String? _secretKeyCached;
  Future<Uint8List> _key() async {
    return base64Url.decode(_secretKeyCached ??= await _encryptionKey());
  }

  void dispose() {
    Logger.service('CacheService => dispose()');
    _secretKeyCached = null;
    _storage.close();
  }

  /// Workaround: In our unit tests Mockito dont understand "HiveAesCipher(encryptionKey)"
  /// Because of this we still using the deprecated "encryptionKey" option
  /// to be possible use MockSpec<HiveImpl>
  /// Fix it in the next Narnia travel
  Future<Box<String>> _table() async {
    final encryptionKey = await _key();
    return _storage.openBox<String>(
      hiveBoxName,
      encryptionKey: encryptionKey,
      // encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  //! Methods

  @override
  Either<Failure, String> getKey(SensitiveDataKeys key) {
    final value = _cacheKeys[key];
    if (value == null) {
      throw PlatformException(
          message: 'key: $key not registered in our enum',
          code: 'key_not_registered');
    }
    return right(value);
  }

  @override
  Future<Either<Failure, String>> get({required SensitiveDataKeys key}) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        try {
          final table = await _table();
          final obj = table.get(keyValue);
          if (obj == null) {
            return left(objectNotFound(key));
          }
          return right(obj);
        } on PlatformException catch (ex, stack) {
          Logger.utils('CacheService, remove',
              exception: ex, stackTrace: stack);
          return left(unavailableService());
        }
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
