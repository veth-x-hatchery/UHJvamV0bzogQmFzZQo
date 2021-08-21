// Mocks generated by Mockito 5.0.14 from annotations
// in vethx_beta/test/features/signin/domain/usecases/sign_in_with_secret_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:vethx_beta/core/error/failures.dart' as _i5;
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart'
    as _i8;
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart'
    as _i6;
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart'
    as _i3;
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart'
    as _i9;
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart'
    as _i7;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [ISignInRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockISignInRepository extends _i1.Mock implements _i3.ISignInRepository {
  MockISignInRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Credential>> cachedCredential() =>
      (super.noSuchMethod(Invocation.method(#cachedCredential, []),
          returnValue: Future<_i2.Either<_i5.Failure, _i6.Credential>>.value(
              _FakeEither_0<_i5.Failure, _i6.Credential>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i6.Credential>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> cacheCredential(
          _i6.Credential? credential) =>
      (super.noSuchMethod(Invocation.method(#cacheCredential, [credential]),
              returnValue: Future<_i2.Either<_i5.Failure, void>>.value(
                  _FakeEither_0<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [IAuthFacade].
///
/// See the documentation for Mockito's code generation for more information.
class MockIAuthFacade extends _i1.Mock implements _i7.IAuthFacade {
  MockIAuthFacade() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i8.User?> getSignedInUser() =>
      (super.noSuchMethod(Invocation.method(#getSignedInUser, []),
          returnValue: Future<_i8.User?>.value()) as _i4.Future<_i8.User?>);
  @override
  _i4.Future<_i2.Either<_i9.AuthFailure, bool>> credentialIsAlreadyInUse(
          _i6.Credential? credentialAddress) =>
      (super.noSuchMethod(
              Invocation.method(#credentialIsAlreadyInUse, [credentialAddress]),
              returnValue: Future<_i2.Either<_i9.AuthFailure, bool>>.value(
                  _FakeEither_0<_i9.AuthFailure, bool>()))
          as _i4.Future<_i2.Either<_i9.AuthFailure, bool>>);
  @override
  _i4.Future<_i2.Either<_i9.AuthFailure, _i2.Unit>>
      registerWithCredentialAndSecret(
              {_i6.Credential? credentialAddress, _i6.Secret? secret}) =>
          (super.noSuchMethod(
              Invocation.method(#registerWithCredentialAndSecret, [], {
                #credentialAddress: credentialAddress,
                #secret: secret
              }),
              returnValue: Future<_i2.Either<_i9.AuthFailure, _i2.Unit>>.value(
                  _FakeEither_0<_i9.AuthFailure, _i2.Unit>())) as _i4
              .Future<_i2.Either<_i9.AuthFailure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i9.AuthFailure, _i2.Unit>>
      signInWithCredentialAndSecret(
              {_i6.Credential? credentialAddress, _i6.Secret? secret}) =>
          (super.noSuchMethod(
              Invocation.method(#signInWithCredentialAndSecret, [],
                  {#credentialAddress: credentialAddress, #secret: secret}),
              returnValue: Future<_i2.Either<_i9.AuthFailure, _i2.Unit>>.value(
                  _FakeEither_0<_i9.AuthFailure, _i2.Unit>())) as _i4
              .Future<_i2.Either<_i9.AuthFailure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i9.AuthFailure, _i2.Unit>> signInWithGoogle() =>
      (super.noSuchMethod(Invocation.method(#signInWithGoogle, []),
              returnValue: Future<_i2.Either<_i9.AuthFailure, _i2.Unit>>.value(
                  _FakeEither_0<_i9.AuthFailure, _i2.Unit>()))
          as _i4.Future<_i2.Either<_i9.AuthFailure, _i2.Unit>>);
  @override
  _i4.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  String toString() => super.toString();
}
