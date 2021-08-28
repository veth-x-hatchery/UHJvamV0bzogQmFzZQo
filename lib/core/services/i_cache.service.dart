enum ComumInformation {
  apiEndPointXYZ,
}

enum PersonalyIdentifiableInformation {
  refreshToken,
  authToken,
  userProfile,
  credential,
}

abstract class ICacheService<Key extends Enum> {
  /// throws [CacheException] when there's no value;
  Future<String> get({required Key key});

  /// throws [CacheException] when something goes wrong;
  Future<void> write({required Key key, required String obj});

  /// throws [CacheException] when something goes wrong;
  Future<void> remove({required Key key});
}
