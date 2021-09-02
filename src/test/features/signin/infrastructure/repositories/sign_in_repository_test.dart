import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/error/exceptions.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/core/network/network_info.dart';
import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_local_data_source.dart';
import 'package:vethx_beta/features/signin/infrastructure/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';

import 'sign_in_repository_test.mocks.dart';

@GenerateMocks([
  ISignInLocalSource,
  INetworkInfo,
])
void main() {
  late SignInRepository repository;
  late MockISignInLocalSource mockLocalDataSource;
  late MockINetworkInfo mockNetworkInfo;

  setUp(() {
    mockLocalDataSource = MockISignInLocalSource();
    mockNetworkInfo = MockINetworkInfo();
    repository = SignInRepository(
      mockLocalDataSource,
      mockNetworkInfo,
    );
  });

  group('when doing cache operations', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    final credential = AuthFacadeMock.validTestCredential;

    test(
      'should return last locally cached data when the cached data is present',
      () async {
        // arrange

        when(mockLocalDataSource.cachedCredential())
            .thenAnswer((_) async => credential);

        // act

        final result = await repository.cachedCredential();

        // assert

        verify(mockLocalDataSource.cachedCredential());

        expect(result, equals(Right(credential)));
      },
    );

    test(
      'should return CacheFailure when there is no cached data present',
      () async {
        // arrange

        when(mockLocalDataSource.cachedCredential())
            .thenThrow(CacheException());

        // act

        final result = await repository.cachedCredential();

        // assert

        verify(mockLocalDataSource.cachedCredential());

        expect(
          result,
          equals(const Left(Failure.cacheFailure(
              message: SignInRepository.genericErrorMessage))),
        );
      },
    );

    test(
      'should return void when cache value with success',
      () async {
        // arrange

        when(mockLocalDataSource.cacheCredential(credential))
            .thenAnswer((_) async => _);

        // act

        final result = await repository.cacheCredential(credential);

        // assert

        verify(mockLocalDataSource.cacheCredential(credential));

        expect(result, equals(const Right(null)));
      },
    );

    test(
      'should return void when cache value with success',
      () async {
        // arrange

        when(mockLocalDataSource.cacheCredential(credential))
            .thenThrow(CacheException());

        // act

        final result = await repository.cacheCredential(credential);

        // assert

        verify(mockLocalDataSource.cacheCredential(credential));

        expect(
          result,
          equals(const Left(Failure.cacheFailure(
              message: SignInRepository.genericErrorMessage))),
        );
      },
    );
  });
}
