abstract class IApiSetup {
  late String host;
  late int port;
  late String basePath;
}

class ApiSetupDevelopment implements IApiSetup {
  @override
  String host = '192.168.43.235';

  @override
  int port = 8080;

  @override
  String basePath = ''; //'api/v1'
}

class ApiSetupProduction implements IApiSetup {
  @override
  String host = 'vethx.io';

  @override
  int port = 0;

  @override
  String basePath = '';
}
