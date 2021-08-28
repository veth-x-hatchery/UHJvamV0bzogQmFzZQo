import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/core/utils/logger.dart';

import 'i_local_storage.service.dart';

class PII implements ILocalStorage<PersonallyIdentifiableInformation> {
  late FlutterSecureStorage _storage;

  PII._() {
    _storage = const FlutterSecureStorage();
  }

  static final instance = PII._();

  /// echo 'PIIKeys.*' | base64
  static const Map<PersonallyIdentifiableInformation, String> _piiKeys = {
    PersonallyIdentifiableInformation.authToken: 'UElJS2V5cy5hdXRoVG9rZW4K',
    PersonallyIdentifiableInformation.userProfile:
        'UElJS2V5cy51c2VyUHJvZmlsZQo',
    PersonallyIdentifiableInformation.credential: 'UElJS2V5cy5jcmVkZW50aWFsCg',
  };

  @override
  Either<Failure, String> getKey(PersonallyIdentifiableInformation key) {
    final value = _piiKeys[key];
    if (value == null) {
      return left(Failure.cacheFailure(
          message: 'key: $key not registered in our enum'));
    }
    return right(value);
  }

  @override
  Future<Either<Failure, String>> get(
      {required PersonallyIdentifiableInformation key}) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        final obj = await _storage.read(key: keyValue);
        if (obj == null) {
          return left(
              Failure.cacheFailure(message: 'key: $key object not found'));
        }
        return right(obj);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> remove(
      {required PersonallyIdentifiableInformation key}) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        try {
          await _storage.delete(key: keyValue);
        } on PlatformException catch (ex, stack) {
          Logger.utils('PII, remove', exception: ex, stackTrace: stack);
          return left(const Failure.cacheFailure(
              message: 'Secure storage unavailable'));
        }
        return right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> write(
      {required PersonallyIdentifiableInformation key,
      required String obj}) async {
    return getKey(key).fold(
      (_) => left(_),
      (keyValue) async {
        try {
          await _storage.write(key: keyValue, value: obj);
        } on PlatformException catch (ex, stack) {
          Logger.utils('PII, write', exception: ex, stackTrace: stack);
          return left(const Failure.cacheFailure(
              message: 'Secure storage unavailable'));
        }
        return right(unit);
      },
    );
  }
}
