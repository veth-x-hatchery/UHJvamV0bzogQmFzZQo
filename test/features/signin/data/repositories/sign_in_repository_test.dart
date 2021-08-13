import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_login/core/network/network_info.dart';
import 'package:vethx_login/features/signin/data/datasources/sign_in_local_data_source.dart';
import 'package:vethx_login/features/signin/data/datasources/sign_in_remote_data_source.dart';
import 'package:vethx_login/features/signin/data/repositories/sign_in_repository.dart';

import 'sign_in_repository_test.mocks.dart';

@GenerateMocks([
  ISignInLocalSource,
  ISignInRemoteSource,
  NetworkInfo,
])
void main() {
  late SignInRepository repository;
  late MockISignInRemoteSource mockRemoteDataSource;
  late MockISignInLocalSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockISignInRemoteSource();
    mockLocalDataSource = MockISignInLocalSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = SignInRepository(
      mockRemoteDataSource,
      mockLocalDataSource,
      mockNetworkInfo,
    );
  });

  group('sign in with user and email', () {
    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        await repository.currentUser();
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );
  });
}
