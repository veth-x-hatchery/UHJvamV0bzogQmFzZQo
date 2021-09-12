import 'package:dartz/dartz.dart';
import 'package:hatchery/core/error/failures.dart';

/// Improve performance using AES-256 encryption
enum SensitiveDataKeys {
  apiEndPointXYZ,
  authenticationRequest,
  // Todo(v): Create a new object that contains all needed properties to LocalAuth config
  localAuthenticationSkipNextRequest,
}

/// Uses Keystore for Android and Keychains for iOS
enum PersonallyIdentifiableInformationKeys {
  refreshToken,
  authToken,
  userProfile,
  credential,
  cacheConfig,
}

//ILocalStorage<Key extends Enum>
abstract class ILocalStorage<Key> {
  Future<Either<Failure, String>> get({required Key key});

  Future<Either<Failure, Unit>> write({required Key key, required String obj});

  Future<Either<Failure, Unit>> remove({required Key key});

  Either<Failure, String> getKey(Key key);
}
