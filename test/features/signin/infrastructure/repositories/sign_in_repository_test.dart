import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/error/exceptions.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/core/network/network_info.dart';
import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_local_data_source.dart';
import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_remote_data_source.dart';
import 'package:vethx_beta/features/signin/infrastructure/models/user_model.dart';
import 'package:vethx_beta/features/signin/infrastructure/repositories/sign_in_repository.dart';

import 'sign_in_repository_test.mocks.dart';

@GenerateMocks([
  ISignInLocalSource,
  ISignInRemoteSource,
  INetworkInfo,
])
void main() {
  late SignInRepository repository;
  late MockISignInRemoteSource mockRemoteDataSource;
  late MockISignInLocalSource mockLocalDataSource;
  late MockINetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockISignInRemoteSource();
    mockLocalDataSource = MockISignInLocalSource();
    mockNetworkInfo = MockINetworkInfo();
    repository = SignInRepository(
      mockRemoteDataSource,
      mockLocalDataSource,
      mockNetworkInfo,
    );
  });

  group('get current logged user', () {
    test(
      'should check if the device is online',
      () async {
        // arrange

        const user = UserModel(authType: 'google', email: 'test@vethx.com');

        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

        when(mockRemoteDataSource.currentUser()).thenAnswer((_) async => user);

        // act

        await repository.currentUser();

        // assert

        verify(mockNetworkInfo.isConnected);
      },
    );

    group('when device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      const user = UserModel(authType: 'google', email: 'test@vethx.com');

      test('should return current user from remote data source', () async {
        // arrange

        when(mockRemoteDataSource.currentUser()).thenAnswer((_) async => user);

        // act

        final result = await repository.currentUser();

        // assert

        verify(mockRemoteDataSource.currentUser());

        expect(result, equals(const Right(user)));
      });

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange

          when(mockRemoteDataSource.currentUser())
              .thenAnswer((_) async => user);

          // act

          await repository.currentUser();

          // assert

          verify(mockRemoteDataSource.currentUser());

          verify(mockLocalDataSource.cacheCurrentUser(user));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange

          when(mockRemoteDataSource.currentUser()).thenThrow(ServerException());

          // act

          final result = await repository.currentUser();

          // assert

          verify(mockRemoteDataSource.currentUser());

          verifyZeroInteractions(mockLocalDataSource);

          expect(
              result,
              equals(const Left(ServerFailure(
                  message: SignInRepositoryDefaultMessages.error))));
        },
      );
    });

    group('when device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      const user = UserModel(authType: 'google', email: 'test@vethx.com');

      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // arrange
          when(mockLocalDataSource.currentUser()).thenAnswer((_) async => user);
          // act
          final result = await repository.currentUser();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.currentUser());
          expect(result, equals(const Right(user)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange

          when(mockLocalDataSource.currentUser()).thenThrow(CacheException());

          // act

          final result = await repository.currentUser();

          // assert

          verifyZeroInteractions(mockRemoteDataSource);

          verify(mockLocalDataSource.currentUser());

          expect(
              result,
              equals(const Left(CacheFailure(
                  message: SignInRepositoryDefaultMessages.error))));
        },
      );
    });
  });
}
