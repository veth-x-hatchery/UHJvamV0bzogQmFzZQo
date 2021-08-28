import 'package:vethx_beta/core/error/exceptions.dart';

enum CacheKeys {
  basicAuth,
  authToken,
  user,
  userProfile,
}

abstract class ICacheService {
  /// throws [CacheException] when there's no value;
  Future<String> get({required CacheKeys key});

  /// throws [CacheException] when something goes wrong;
  Future<void> write({required CacheKeys key, required String obj});

  /// throws [CacheException] when something goes wrong;
  Future<void> remove({required CacheKeys key});
}

class CacheService implements ICacheService {
  /// echo 'CacheKeys.*' | base64
  static const Map<CacheKeys, String> _cacheKeys = {
    CacheKeys.authToken: 'Q2FjaGVLZXlzLmF1dGhUb2tlbgo',
    CacheKeys.user: 'Q2FjaGVLZXlzLnVzZXIK',
    CacheKeys.basicAuth: 'Q2FjaGVLZXlzLmJhc2ljQXV0aAo',
    CacheKeys.userProfile: 'Q2FjaGVLZXlzLnVzZXJQcm9maWxlCg',
  };

  @override
  Future<String> get({
    required CacheKeys key,
  }) async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // return sharedPreferences.getString(_cacheKeys[key]);
    throw CacheException();
  }

  @override
  Future<void> remove({
    required CacheKeys key,
  }) async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // return sharedPreferences.remove(_cacheKeys[key]);
    throw CacheException();
  }

  @override
  Future<void> write({required CacheKeys key, required String obj}) {
    throw CacheException();
  }
}
