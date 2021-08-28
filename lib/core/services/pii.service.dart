import 'package:vethx_beta/core/error/exceptions.dart';

import 'i_local_storage.service.dart';

class PII implements ILocalStorage<PersonallyIdentifiableInformation> {
  /// echo 'PIIKeys.*' | base64
  static const Map<PersonallyIdentifiableInformation, String> _piiKeys = {
    PersonallyIdentifiableInformation.authToken: 'UElJS2V5cy5hdXRoVG9rZW4K',
    PersonallyIdentifiableInformation.userProfile:
        'UElJS2V5cy51c2VyUHJvZmlsZQo',
    PersonallyIdentifiableInformation.credential: 'UElJS2V5cy5jcmVkZW50aWFsCg',
  };

  @override
  Future<String> get({required PersonallyIdentifiableInformation key}) async {
    // TODO: implement get
    return _piiKeys[key]!;
  }

  @override
  Future<void> remove({required PersonallyIdentifiableInformation key}) {
    // TODO: implement remove
    throw CacheException();
  }

  @override
  Future<void> write(
      {required PersonallyIdentifiableInformation key, required String obj}) {
    // TODO: implement write
    throw CacheException();
  }
}
