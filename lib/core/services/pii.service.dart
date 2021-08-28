import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/core/utils/logger.dart';

import 'i_local_storage.service.dart';

class PII implements ILocalStorage<PersonallyIdentifiableInformationKeys> {
  final FlutterSecureStorage _storage;

  PII(this._storage);

  /// echo 'PIIKeys.*' | base64
  static const Map<PersonallyIdentifiableInformationKeys, String> _piiKeys = {
    PersonallyIdentifiableInformationKeys.authToken: 'UElJS2V5cy5hdXRoVG9rZW4K',
    PersonallyIdentifiableInformationKeys.userProfile:
        'UElJS2V5cy51c2VyUHJvZmlsZQo',
    PersonallyIdentifiableInformationKeys.credential:
        'UElJS2V5cy5jcmVkZW50aWFsCg',
    PersonallyIdentifiableInformationKeys.refreshToken:
        'UElJS2V5cy5yZWZyZXNoVG9rZW4K',
  };

  static Failure objectNotFound(PersonallyIdentifiableInformationKeys key) =>
      Failure.cacheFailure(message: 'key: $key object not found');

  static Failure unavailableService() =>
      const Failure.cacheFailure(message: 'Cache storage unavailable');

  @override
  Either<Failure, String> getKey(PersonallyIdentifiableInformationKeys key) {
    final value = _piiKeys[key];
    if (value == null) {
      return left(Failure.cacheFailure(
          message: 'key: $key not registered in our enum'));
    }
    return right(value);
  }

  @override
  Future<Either<Failure, String>> get(
      {required PersonallyIdentifiableInformationKeys key}) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        final obj = await _storage.read(key: keyValue);
        if (obj == null) {
          return left(objectNotFound(key));
        }
        return right(obj);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> remove(
      {required PersonallyIdentifiableInformationKeys key}) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        try {
          await _storage.delete(key: keyValue);
        } on PlatformException catch (ex, stack) {
          Logger.utils('PII, remove', exception: ex, stackTrace: stack);
          return left(unavailableService());
        }
        return right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> write(
      {required PersonallyIdentifiableInformationKeys key,
      required String obj}) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        try {
          await _storage.write(key: keyValue, value: obj);
        } on PlatformException catch (ex, stack) {
          Logger.utils('PII, write', exception: ex, stackTrace: stack);
          return left(unavailableService());
        }
        return right(unit);
      },
    );
  }
}
