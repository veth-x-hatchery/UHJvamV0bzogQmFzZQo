import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vethx_beta/core/error/exceptions.dart';
import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_local_data_source.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';

import 'sign_in_local_data_source_test.mocks.dart';

@GenerateMocks([
  SharedPreferences,
])
void main() {
  late SignInLocalSource dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = SignInLocalSource(mockSharedPreferences);
  });

  group('when dealing with cache credential', () {
    final credential = AuthFacadeMock.validTestCredential;

    test(
      'should return current credential from SharedPreferences when there is one in the cache',
      () async {
        // arrange

        when(mockSharedPreferences.getString(any))
            .thenReturn(credential.getOrCrash());

        // act

        final result = await dataSource.cachedCredential();

        // assert

        verify(mockSharedPreferences
            .getString(SignInLocalSource.cached_credential_key));

        expect(result, equals(credential));
      },
    );

    test(
      'should throw a CacheExeption when there is not a cached value',
      () async {
        // arrange

        when(mockSharedPreferences.getString(any)).thenReturn(null);

        // act

        final call = dataSource.cachedCredential;

        // assert

        expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
      },
    );

    test(
      'should call SharedPreferences to cache the data',
      () async {
        // arrange

        when(mockSharedPreferences.setString(any, any))
            .thenAnswer((_) async => true);

        // act

        await dataSource.cacheCredential(credential);

        // assert

        verify(mockSharedPreferences.setString(
          SignInLocalSource.cached_credential_key,
          credential.getOrCrash(),
        ));
      },
    );

    test(
      'should throw CacheExeption when call SharedPreferences to cache the data',
      () async {
        // arrange

        when(mockSharedPreferences.setString(any, any))
            .thenAnswer((_) async => false);

        // act && assert

        expect(() => dataSource.cacheCredential(credential),
            throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });
}
