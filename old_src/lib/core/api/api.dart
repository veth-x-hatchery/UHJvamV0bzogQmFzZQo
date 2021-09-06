import 'package:vethx_beta/core/api/api_setup.dart';

enum Endpoint {
  //! SignIn
  signInCurrentUser,
  checkCredential,
}

class API {
  API(this.api);

  final IApiSetup api;

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: api.host,
        port: api.port > 0 ? api.port : null,
        path: 'token',
      );

  Uri endpointUri(Endpoint endpoint, {Map<String, String>? queryParameters}) =>
      Uri(
        scheme: 'https',
        host: api.host,
        port: api.port > 0 ? api.port : null,
        path: '${api.basePath}/${_paths[endpoint]}',
        queryParameters: queryParameters,
      );

  static final Map<Endpoint, String> _paths = {
    //! SignIn
    Endpoint.signInCurrentUser: 'signin/currentuser',
    Endpoint.checkCredential: 'signin/checkCredential',
  };
}
