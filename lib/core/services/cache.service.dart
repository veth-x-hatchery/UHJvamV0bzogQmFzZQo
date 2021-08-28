import 'package:vethx_beta/core/error/exceptions.dart';

import 'i_local_storage.service.dart';

class CacheService implements ILocalStorage<SensitiveData> {
  /// echo 'CacheKeys.*' | base64
  static const Map<SensitiveData, String> _cacheKeys = {
    SensitiveData.apiEndPointXYZ: 'Q2FjaGVLZXlzLmFwaUVuZFBvaW50WFlaCg',
  };

  @override
  Future<String> get({
    required SensitiveData key,
  }) async {
    // TODO: implement get
    return _cacheKeys[key]!;
  }

  @override
  Future<void> remove({
    required SensitiveData key,
  }) async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // return sharedPreferences.remove(_cacheKeys[key]);
    throw CacheException();
  }

  @override
  Future<void> write({required SensitiveData key, required String obj}) {
    throw CacheException();
  }
}
