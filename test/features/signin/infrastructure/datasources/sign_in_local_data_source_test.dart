import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/error/exceptions.dart';
import 'package:vethx_beta/core/services/i_local_storage.service.dart';
import 'package:vethx_beta/core/services/pii.service.dart';
import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_local_data_source.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';

import 'sign_in_local_data_source_test.mocks.dart';

@GenerateMocks([
  PII,
])
void main() {
  late SignInLocalSource dataSource;
  late MockPII mockStorageService;

  setUp(() {
    mockStorageService = MockPII();
    dataSource = SignInLocalSource(mockStorageService);
  });

  group('when dealing with cache credential', () {
    final credential = AuthFacadeMock.validTestCredential;
    const key = PersonallyIdentifiableInformationKeys.credential;

    test(
      'should return current credential from [PII] when there is one in the cache',
      () async {
        // arrange

        when(mockStorageService.get(key: key))
            .thenAnswer((_) async => right(credential.getOrCrash()));

        // act

        final result = await dataSource.cachedCredential();

        // assert

        verify(mockStorageService.get(key: key));

        expect(result, equals(credential));
      },
    );

    test(
      'should throw a CacheExeption when there is not a cached value',
      () async {
        // arrange

        when(mockStorageService.get(key: key)).thenAnswer((_) async => left(PII
            .objectNotFound(PersonallyIdentifiableInformationKeys.authToken)));

        // act

        final call = dataSource.cachedCredential;

        // assert

        expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
      },
    );

    test(
      'should call [PII] to cache the data',
      () async {
        // arrange

        when(mockStorageService.write(key: key, obj: credential.getOrCrash()))
            .thenAnswer((_) async => right(unit));

        // act

        await dataSource.cacheCredential(credential);

        // assert

        verify(
            mockStorageService.write(key: key, obj: credential.getOrCrash()));
      },
    );

    test(
      'should throw CacheExeption when call [PII] to cache the data',
      () async {
        // arrange

        when(mockStorageService.write(key: key, obj: credential.getOrCrash()))
            .thenAnswer((_) async => left(PII.unavailableService()));

        // act && assert

        expect(() => dataSource.cacheCredential(credential),
            throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });
}
