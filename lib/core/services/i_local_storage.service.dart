import 'package:dartz/dartz.dart';
import 'package:vethx_beta/core/error/failures.dart';

/// Improve performance using AES-256 encryption
enum SensitiveData {
  apiEndPointXYZ,
}

/// Uses Keystore for Android and Keychains for iOS
enum PersonallyIdentifiableInformation {
  refreshToken,
  authToken,
  userProfile,
  credential,
}

abstract class ILocalStorage<Key extends Enum> {
  /// throws [CacheException] when there's no value;
  Future<Either<Failure, String>> get({required Key key});

  /// throws [CacheException] when something goes wrong;
  Future<Either<Failure, Unit>> write({required Key key, required String obj});

  /// throws [CacheException] when something goes wrong;
  Future<Either<Failure, Unit>> remove({required Key key});
}
