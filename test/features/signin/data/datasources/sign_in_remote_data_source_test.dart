import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_login/core/api/api.dart';
import 'package:vethx_login/core/api/api_setup.dart';
import 'package:vethx_login/features/signin/data/datasources/sign_in_remote_data_source.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'sign_in_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late SignInRemoteSource dataSource;
  late MockClient mockHttpClient;
  late API api;

  setUp(() {
    api = API(ApiSetupDevelopment());
    mockHttpClient = MockClient();
    dataSource = SignInRemoteSource(mockHttpClient, api);
  });

  test(
    'should preform a GET request on a URL with number being the endpoint and with application/json header',
    () {
      //arrange
      when(mockHttpClient.get(
        any,
        headers: anyNamed('headers'),
      )).thenAnswer(
        (_) async => http.Response(fixture('sign_in_user_google.json'), 200),
      );
      // act
      dataSource.currentUser();
      // assert
      verify(mockHttpClient.get(
        api.endpointUri(Endpoint.signInCurrentUser),
        headers: {'Content-Type': 'application/json'},
      ));
    },
  );
}
