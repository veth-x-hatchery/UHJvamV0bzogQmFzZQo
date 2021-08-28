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
  Future<String> get({required Key key});

  /// throws [CacheException] when something goes wrong;
  Future<void> write({required Key key, required String obj});

  /// throws [CacheException] when something goes wrong;
  Future<void> remove({required Key key});
}
