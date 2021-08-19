// Mocks generated by Mockito 5.0.14 from annotations
// in vethx_beta/test/features/signin/domain/usecases/sign_in_register_email_and_password_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart'
    as _i5;
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart'
    as _i7;
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart'
    as _i6;
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart'
    as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [IAuthFacade].
///
/// See the documentation for Mockito's code generation for more information.
class MockIAuthFacade extends _i1.Mock implements _i3.IAuthFacade {
  MockIAuthFacade() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i5.User?> getSignedInUser() =>
      (super.noSuchMethod(Invocation.method(#getSignedInUser, []),
          returnValue: Future<_i5.User?>.value()) as _i4.Future<_i5.User?>);
  @override
  _i4.Future<_i2.Either<_i6.AuthFailure, bool>> emailIsAlreadyInUse(
          _i7.EmailAddress? emailAddress) =>
      (super.noSuchMethod(
              Invocation.method(#emailIsAlreadyInUse, [emailAddress]),
              returnValue: Future<_i2.Either<_i6.AuthFailure, bool>>.value(
                  _FakeEither_0<_i6.AuthFailure, bool>()))
          as _i4.Future<_i2.Either<_i6.AuthFailure, bool>>);
  @override
  _i4.Future<_i2.Either<_i6.AuthFailure, _i2.Unit>>
      registerWithEmailAndPassword(
              {_i7.EmailAddress? emailAddress, _i7.Password? password}) =>
          (super.noSuchMethod(
              Invocation.method(#registerWithEmailAndPassword, [],
                  {#emailAddress: emailAddress, #password: password}),
              returnValue: Future<_i2.Either<_i6.AuthFailure, _i2.Unit>>.value(
                  _FakeEither_0<_i6.AuthFailure, _i2.Unit>())) as _i4
              .Future<_i2.Either<_i6.AuthFailure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i6.AuthFailure, _i2.Unit>> signInWithEmailAndPassword(
          {_i7.EmailAddress? emailAddress, _i7.Password? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmailAndPassword, [],
                  {#emailAddress: emailAddress, #password: password}),
              returnValue: Future<_i2.Either<_i6.AuthFailure, _i2.Unit>>.value(
                  _FakeEither_0<_i6.AuthFailure, _i2.Unit>()))
          as _i4.Future<_i2.Either<_i6.AuthFailure, _i2.Unit>>);
  @override
  _i4.Future<_i2.Either<_i6.AuthFailure, _i2.Unit>> signInWithGoogle() =>
      (super.noSuchMethod(Invocation.method(#signInWithGoogle, []),
              returnValue: Future<_i2.Either<_i6.AuthFailure, _i2.Unit>>.value(
                  _FakeEither_0<_i6.AuthFailure, _i2.Unit>()))
          as _i4.Future<_i2.Either<_i6.AuthFailure, _i2.Unit>>);
  @override
  _i4.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  String toString() => super.toString();
}
