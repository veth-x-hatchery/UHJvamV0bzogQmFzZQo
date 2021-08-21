// import 'package:shared_preferences/shared_preferences.dart';

enum CacheKeys {
  token,
  usuario,
  pushNotification,
  credentialVoucher,
  authorizacao,
  empresasUsuario,
}

class CacheService {
  static final Map<CacheKeys, String> _cacheKeys = {
    CacheKeys.token: 'key_accesstoken',
    CacheKeys.usuario: 'key_profileUser',
    CacheKeys.pushNotification: 'key_ProfilePushToken',
    CacheKeys.credentialVoucher: 'key_voucherEmail',
    CacheKeys.authorizacao: '9ada5718-2383-45c3-8185-e86993ed171d',
    CacheKeys.empresasUsuario: '788afc2a-1ab9-4429-ac7e-db80629df61d',
  };

  Future<String?> get({required CacheKeys key}) async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // return sharedPreferences.getString(_cacheKeys[key]);
    return null;
  }

  Future<bool> write({required CacheKeys key, required String obj}) async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // return sharedPreferences.setString(_cacheKeys[key], obj);
    return Future.value(true);
  }

  Future<bool> remove({required CacheKeys key}) async {
    // final sharedPreferences = await SharedPreferences.getInstance();
    // return sharedPreferences.remove(_cacheKeys[key]);
    return Future.value(true);
  }
}
