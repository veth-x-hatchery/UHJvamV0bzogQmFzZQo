import 'package:vethx_beta/core/error/exceptions.dart';

enum PIIKeys {
  authToken,
  userProfile,
  credential,
}

abstract class IPIIService {
  /// throws [CacheException] when there's no value;
  Future<String> get({required PIIKeys key});

  /// throws [CacheException] when something goes wrong;
  Future<void> write({required PIIKeys key, required String obj});

  /// throws [CacheException] when something goes wrong;
  Future<void> remove({required PIIKeys key});
}

class PersonalyIdentifiableInformation implements IPIIService {
  /// echo 'PIIKeys.*' | base64
  static const Map<PIIKeys, String> _piiKeys = {
    PIIKeys.authToken: 'UElJS2V5cy5hdXRoVG9rZW4K',
    PIIKeys.userProfile: 'UElJS2V5cy51c2VyUHJvZmlsZQo',
    PIIKeys.credential: 'UElJS2V5cy5jcmVkZW50aWFsCg',
  };

  @override
  Future<String> get({required PIIKeys key}) {
    // TODO: implement get
    throw CacheException();
  }

  @override
  Future<void> remove({required PIIKeys key}) {
    // TODO: implement remove
    throw CacheException();
  }

  @override
  Future<void> write({required PIIKeys key, required String obj}) {
    // TODO: implement write
    throw CacheException();
  }
}
