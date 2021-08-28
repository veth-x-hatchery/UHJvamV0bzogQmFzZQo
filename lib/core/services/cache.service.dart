import 'package:vethx_beta/core/error/exceptions.dart';

import 'i_cache.service.dart';

class CacheService implements ICacheService<RemoteData> {
  /// echo 'CacheKeys.*' | base64
  static const Map<RemoteData, String> _cacheKeys = {
    RemoteData.apiEndPointXYZ: 'Q2FjaGVLZXlzLmFwaUVuZFBvaW50WFlaCg',
  };

  @override
  Future<String> get({
    required RemoteData key,
  }) async {
    // TODO: implement get
    return _cacheKeys[key]!;
  }

  @override
  Future<void> remove({
    required RemoteData key,
  }) async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // return sharedPreferences.remove(_cacheKeys[key]);
    throw CacheException();
  }

  @override
  Future<void> write({required RemoteData key, required String obj}) {
    throw CacheException();
  }
}
