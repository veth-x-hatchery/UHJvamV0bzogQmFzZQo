import 'package:dartz/dartz.dart';
import 'package:vethx_beta/core/error/failures.dart';

/// Improve performance using AES-256 encryption
enum SensitiveDataKeys {
  apiEndPointXYZ,
}

/// Uses Keystore for Android and Keychains for iOS
enum PersonallyIdentifiableInformationKeys {
  refreshToken,
  authToken,
  userProfile,
  credential,
}

abstract class ILocalStorage<Key extends Enum> {
  Future<Either<Failure, String>> get({required Key key});

  Future<Either<Failure, Unit>> write({required Key key, required String obj});

  Future<Either<Failure, Unit>> remove({required Key key});

  Either<Failure, String> getKey(Key key);
}
