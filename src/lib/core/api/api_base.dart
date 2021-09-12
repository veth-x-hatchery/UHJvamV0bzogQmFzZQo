import 'dart:convert';

import 'package:hatchery/core/api/api.dart';
import 'package:hatchery/core/error/exceptions.dart';
import 'package:hatchery/core/network/network_info.dart';
import 'package:hatchery/core/services/storage/i_local_storage.service.dart';
import 'package:hatchery/core/utils/logger.dart';
import 'package:http/http.dart' as h;

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
  final ILocalStorage<PersonallyIdentifiableInformationKeys> _cacheService;

  Future checkInternetConnection() async {
    if (!await _networkInfo.isConnected) {
      throw ServerException();
    }
  }

  Future<String> authTokenRefresh() async {
    final authorization = await _cacheService.get(
        key: PersonallyIdentifiableInformationKeys.refreshToken);
    return authorization.fold(
      (_) {
        Logger.utils(
            'APIBase, authTokenRefresh() => authorization == null: $_');
        throw ServerException();
      },
      (authorization) {
        final auth = authorization.split(':');
        return authenticate(credential: auth[0], password: auth[1]);
      },
    );
  }

  Future resetCache() async {
    for (final key in [
      PersonallyIdentifiableInformationKeys.authToken,
      PersonallyIdentifiableInformationKeys.userProfile,
      PersonallyIdentifiableInformationKeys.refreshToken,
    ]) {
      await _cacheService.remove(key: key);
    }
  }

  Future<String> authToken() async {
    final token = await _cacheService.get(
        key: PersonallyIdentifiableInformationKeys.authToken);
    return token.fold(
      (l) => authTokenRefresh(),
      (token) => token,
    );
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
        await _cacheService.write(
            key: PersonallyIdentifiableInformationKeys.authToken,
            obj: accessToken);
        await _cacheService.write(
            key: PersonallyIdentifiableInformationKeys.refreshToken,
            obj: '$credential:$password');
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
