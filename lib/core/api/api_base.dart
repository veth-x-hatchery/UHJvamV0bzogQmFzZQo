import 'dart:convert';

import 'package:http/http.dart' as h;
import 'package:vethx_beta/core/api/api.dart';
import 'package:vethx_beta/core/error/exceptions.dart';
import 'package:vethx_beta/core/network/network_info.dart';
import 'package:vethx_beta/core/services/cache.service.dart';
import 'package:vethx_beta/core/utils/logger.dart';

class APIBase {
  APIBase(
    this._api,
    this._http,
    this._networkInfo,
    this._cacheService,
  );

  final API _api;
  final h.Client _http;
  final INetworkInfo _networkInfo;
  final CacheService _cacheService;

  Future checkInternetConnection() async {
    if (!await _networkInfo.isConnected) {
      throw ServerException();
    }
  }

  Future<String> authTokenRefresh() async {
    final authorization = await _cacheService.get(key: CacheKeys.basicAuth);
    if (authorization == null) {
      Logger.utils('APIBase, authTokenRefresh() => authorization == null');
      throw ServerException();
    }
    final auth = authorization.split(':');
    return authenticate(credential: auth[0], password: auth[1]);
  }

  Future resetCache() async {
    await _cacheService.remove(key: CacheKeys.authToken);
    await _cacheService.remove(key: CacheKeys.user);
    await _cacheService.remove(key: CacheKeys.basicAuth);
  }

  Future<String> authToken() async {
    final token = await _cacheService.get(
        key: CacheKeys
            .authToken); // Todo(v): Realizar validacao do Token antes de retornar
    if (token != null) {
      return token;
    }
    return authTokenRefresh();
  }

  Future<String> authenticate({
    required String credential,
    required String password,
  }) async {
    await checkInternetConnection();

    final data = <String, dynamic>{};

    data['grant_type'] = 'password';
    data['tipo'] = 'cliente';
    data['username'] = credential;
    data['password'] = password;

    final response = await _http.post(
      _api.tokenUri(),
      body: data,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;

      final accessToken = data['access_token'] as String?;

      if (accessToken != null) {
        await _cacheService.write(key: CacheKeys.authToken, obj: accessToken);
        await _cacheService.write(
            key: CacheKeys.basicAuth,
            obj:
                '$credential:$password'); // Todo(v): Criptografar Encrypter(AES(key, mode: AESMode.cbc));
        return accessToken;
      }
    }

    Logger.utils('''
        APIBase, authenticate => Request ${_api.tokenUri()} failed\n
        Response: ${response.statusCode} ${response.reasonPhrase}''');

    if (response.statusCode == 400) {
      throw ServerException();
    }

    throw response;
  }
}
