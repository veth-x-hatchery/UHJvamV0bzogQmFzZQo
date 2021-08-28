import 'package:vethx_beta/core/error/exceptions.dart';

import 'i_cache.service.dart';

class PII implements ICacheService<PersonalyIdentifiableInformation> {
  /// echo 'PIIKeys.*' | base64
  static const Map<PersonalyIdentifiableInformation, String> _piiKeys = {
    PersonalyIdentifiableInformation.authToken: 'UElJS2V5cy5hdXRoVG9rZW4K',
    PersonalyIdentifiableInformation.userProfile: 'UElJS2V5cy51c2VyUHJvZmlsZQo',
    PersonalyIdentifiableInformation.credential: 'UElJS2V5cy5jcmVkZW50aWFsCg',
  };

  @override
  Future<String> get({required PersonalyIdentifiableInformation key}) async {
    // TODO: implement get
    return _piiKeys[key]!;
  }

  @override
  Future<void> remove({required PersonalyIdentifiableInformation key}) {
    // TODO: implement remove
    throw CacheException();
  }

  @override
  Future<void> write(
      {required PersonalyIdentifiableInformation key, required String obj}) {
    // TODO: implement write
    throw CacheException();
  }
}
