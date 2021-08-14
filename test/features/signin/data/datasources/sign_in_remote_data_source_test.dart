import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_login/core/api/api.dart';
import 'package:vethx_login/core/api/api_setup.dart';
import 'package:vethx_login/core/error/exceptions.dart';
import 'package:vethx_login/features/signin/data/datasources/sign_in_remote_data_source.dart';
import 'package:vethx_login/features/signin/data/models/user_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'sign_in_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late SignInRemoteSource _dataSource;
  late MockClient _mockHttpClient;
  late API _api;

  setUp(() {
    _api = API(ApiSetupDevelopment());
    _mockHttpClient = MockClient();
    _dataSource = SignInRemoteSource(_mockHttpClient, _api);
  });

  void _setUpMockHttpClientSuccess200({Uri? uri}) {
    when(_mockHttpClient.get(uri ?? any, headers: anyNamed('headers')))
        .thenAnswer(
      (_) async => http.Response(fixture('sign_in_user_google.json'), 200),
    );
  }

  void _setUpMockHttpClientFailure404({Uri? uri}) {
    when(_mockHttpClient.get(uri ?? any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('get current user', () {
    final user = UserModel(authType: 'google', email: 'test@vethx.com');

    test(
      'should preform a GET request on a URL being the endpoint and with application/json header',
      () {
        //arrange
        final uri = _api.endpointUri(Endpoint.signInCurrentUser);
        _setUpMockHttpClientSuccess200(uri: uri);
        // act
        _dataSource.currentUser();
        // assert
        verify(_mockHttpClient.get(
          uri,
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        _setUpMockHttpClientSuccess200();
        // act
        final result = await _dataSource.currentUser();
        // assert
        expect(result, equals(user));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        _setUpMockHttpClientFailure404();
        // act
        final call = _dataSource.currentUser;
        // assert
        expect(() => call(), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}
