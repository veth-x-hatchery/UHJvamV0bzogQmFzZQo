import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vethx_beta/core/error/exceptions.dart';
import 'package:vethx_beta/features/signin/data/datasources/sign_in_local_data_source.dart';
import 'package:vethx_beta/features/signin/data/models/user_model.dart';

import '../../../../fixtures/fixture_reader.dart';

import 'sign_in_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late SignInLocalSource dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = SignInLocalSource(mockSharedPreferences);
  });

  group('get current user', () {
    final user = UserModel.fromJson(json
        .decode(fixture('cached_user_google.json')) as Map<String, dynamic>);

    test(
      'should return current user from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixture('cached_user_google.json'));
        // act
        final result = await dataSource.currentUser();
        // assert
        verify(mockSharedPreferences.getString(CACHED_CURRENT_USER));
        expect(result, equals(user));
      },
    );

    test(
      'should throw a CacheExeption when there is not a cached value',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        final call = dataSource.currentUser;
        // assert
        expect(() => call(), throwsA(TypeMatcher<CacheException>()));
      },
    );
  });

  group('cache current user', () {
    final user = UserModel(
      email: 'test@vethx.com',
      authType: 'google',
    );

    test(
      'should call SharedPreferences to cache the data',
      () async {
        // arrange
        when(mockSharedPreferences.setString(any, any))
            .thenAnswer((_) async => true);
        // act
        await dataSource.cacheCurrentUser(user);
        // assert
        final expectedJsonString = json.encode(user.toJson());
        verify(mockSharedPreferences.setString(
          CACHED_CURRENT_USER,
          expectedJsonString,
        ));
      },
    );
  });
}
