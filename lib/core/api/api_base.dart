import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vethx_beta/core/api/api.dart';
import 'package:vethx_beta/core/error/exceptions.dart';
import 'package:vethx_beta/core/network/network_info.dart';
import 'package:vethx_beta/core/services/data_cache_service.dart';
import 'package:vethx_beta/core/utils/logger.dart';

class APIBase {
  APIBase(
    this.api,
    this.client,
    this.networkInfo,
    this.servicoDeCache,
  );

  final API api;
  final http.Client client;
  final INetworkInfo networkInfo;
  final CacheService servicoDeCache;

  Future verificarConexaoComInternet() async {
    if (!await networkInfo.isConnected) {
      throw ServerException();
    }
  }

  Future<String> tokenRefresh() async {
    final authorizacao = await servicoDeCache.get(key: CacheKeys.authorizacao);
    if (authorizacao == null) {
      Logger.i(
        'APIBase, tokenRefresh() => authorizacao == null',
        layer: ArchitectureLayer.infrastructure,
      );
      throw Exception('Falha na autenticacao');
    }
    final auth = authorizacao.split(':');
    return realizarAutenticacao(email: auth[0], senha: auth[1]);
  }

  Future limparCache() async {
    await servicoDeCache.remove(key: CacheKeys.token);
    await servicoDeCache.remove(key: CacheKeys.usuario);
    await servicoDeCache.remove(key: CacheKeys.authorizacao);
  }

  Future<String> obterToken() async {
    final token = await servicoDeCache.get(
        key: CacheKeys
            .token); // Todo(v): Realizar validacao do Token antes de retornar
    if (token != null) {
      return token;
    }
    return tokenRefresh();
  }

  Future<String> realizarAutenticacao(
      {required String email, required String senha}) async {
    await verificarConexaoComInternet();

    final data = <String, dynamic>{};

    data['grant_type'] = 'password';
    data['tipo'] = 'cliente';
    data['username'] = email;
    data['password'] = senha;

    final response = await client.post(
      api.tokenUri(),
      body: data,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;

      final accessToken = data['access_token'] as String?;

      if (accessToken != null) {
        await servicoDeCache.write(key: CacheKeys.token, obj: accessToken);
        await servicoDeCache.write(
            key: CacheKeys.authorizacao,
            obj:
                '$email:$senha'); // Todo(v): Criptografar Encrypter(AES(key, mode: AESMode.cbc));
        return accessToken;
      }
    }

    if (response.statusCode == 400) {
      throw Exception('response.statusCode == 400');
    }

    Logger.i(
        'class APIBase, autenticar => Request ${api.tokenUri()} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');

    throw response;
  }
}
