import 'package:shared_preferences/shared_preferences.dart';
import 'package:vethx_beta/core/error/exceptions.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

abstract class ISignInLocalSource {
  /// Throws [CacheException] when transaction fail.
  Future<void> cacheCredential(Credential credential);

  /// Throws [CacheException] if no cached data is present.
  Future<Credential> cachedCredential();
}

class SignInLocalSource implements ISignInLocalSource {
  // ignore: constant_identifier_names
  static const String cached_credential_key = 'CACHED_CREDENTIAL';

  final SharedPreferences _sharedPreferences;

  SignInLocalSource(this._sharedPreferences);

  @override
  Future<void> cacheCredential(Credential credential) async {
    final result = await _sharedPreferences.setString(
        cached_credential_key, credential.getOrCrash());
    if (!result) {
      throw CacheException();
    }
  }

  @override
  Future<Credential> cachedCredential() {
    final value = _sharedPreferences.getString(cached_credential_key);
    if (value == null) {
      throw CacheException();
    }
    return Future.value(Credential(value));
  }
}
