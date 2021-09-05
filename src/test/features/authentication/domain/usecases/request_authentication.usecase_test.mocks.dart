// Mocks generated by Mockito 5.0.15 from annotations
// in vethx_beta/test/features/authentication/domain/usecases/request_authentication.usecase_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:vethx_beta/core/error/failures.dart' as _i7;
import 'package:vethx_beta/core/services/storage/cache.service.dart' as _i6;
import 'package:vethx_beta/core/services/storage/i_local_storage.service.dart'
    as _i8;
import 'package:vethx_beta/features/authentication/domain/services/i_local_auth.service.dart'
    as _i3;
import 'package:vethx_beta/features/authentication/infrastructure/services/local_auth_failure.dart'
    as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [ILocalAuth].
///
/// See the documentation for Mockito's code generation for more information.
class MockILocalAuth extends _i1.Mock implements _i3.ILocalAuth {
  MockILocalAuth() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.LocalAuthFailure, bool>> request(
          {Duration? cacheTolerance, bool? hasPendingAuthentication = false}) =>
      (super.noSuchMethod(
              Invocation.method(#request, [], {
                #cacheTolerance: cacheTolerance,
                #hasPendingAuthentication: hasPendingAuthentication
              }),
              returnValue: Future<_i2.Either<_i5.LocalAuthFailure, bool>>.value(
                  _FakeEither_0<_i5.LocalAuthFailure, bool>()))
          as _i4.Future<_i2.Either<_i5.LocalAuthFailure, bool>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [CacheService].
///
/// See the documentation for Mockito's code generation for more information.
class MockCacheService extends _i1.Mock implements _i6.CacheService {
  MockCacheService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  _i2.Either<_i7.Failure, String> getKey(_i8.SensitiveDataKeys? key) =>
      (super.noSuchMethod(Invocation.method(#getKey, [key]),
              returnValue: _FakeEither_0<_i7.Failure, String>())
          as _i2.Either<_i7.Failure, String>);
  @override
  _i4.Future<_i2.Either<_i7.Failure, String>> get(
          {_i8.SensitiveDataKeys? key}) =>
      (super.noSuchMethod(Invocation.method(#get, [], {#key: key}),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i4.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i7.Failure, _i2.Unit>> remove(
          {_i8.SensitiveDataKeys? key}) =>
      (super.noSuchMethod(Invocation.method(#remove, [], {#key: key}),
              returnValue: Future<_i2.Either<_i7.Failure, _i2.Unit>>.value(
                  _FakeEither_0<_i7.Failure, _i2.Unit>()))
          as _i4.Future<_i2.Either<_i7.Failure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i7.Failure, _i2.Unit>> write(
          {_i8.SensitiveDataKeys? key, String? obj}) =>
      (super.noSuchMethod(Invocation.method(#write, [], {#key: key, #obj: obj}),
              returnValue: Future<_i2.Either<_i7.Failure, _i2.Unit>>.value(
                  _FakeEither_0<_i7.Failure, _i2.Unit>()))
          as _i4.Future<_i2.Either<_i7.Failure, _i2.Unit>>);
  @override
  String toString() => super.toString();
}
