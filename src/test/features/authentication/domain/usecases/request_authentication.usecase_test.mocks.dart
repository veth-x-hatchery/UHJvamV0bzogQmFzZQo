// Mocks generated by Mockito 5.0.15 from annotations
// in vethx_beta/test/features/authentication/domain/usecases/request_authentication.usecase_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
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
          {Duration? cacheTolerance}) =>
      (super.noSuchMethod(
          Invocation.method(#request, [], {#cacheTolerance: cacheTolerance}),
          returnValue: Future<_i2.Either<_i5.LocalAuthFailure, bool>>.value(
              _FakeEither_0<_i5.LocalAuthFailure, bool>())) as _i4
          .Future<_i2.Either<_i5.LocalAuthFailure, bool>>);
  @override
  String toString() => super.toString();
}
