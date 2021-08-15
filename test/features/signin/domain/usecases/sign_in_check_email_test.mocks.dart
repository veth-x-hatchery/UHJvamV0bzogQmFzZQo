// Mocks generated by Mockito 5.0.14 from annotations
// in vethx_login/test/features/signin/domain/usecases/sign_in_check_email_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:vethx_login/core/error/failures.dart' as _i5;
import 'package:vethx_login/features/signin/domain/entities/credentials_entity.dart'
    as _i7;
import 'package:vethx_login/features/signin/domain/entities/user_entity.dart'
    as _i6;
import 'package:vethx_login/features/signin/domain/repositories/sign_in_repository.dart'
    as _i3;
import 'package:vethx_login/features/signin/presentation/utils/custom_validators.dart'
    as _i8;

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
  _i4.Future<_i2.Either<_i5.Failure, _i4.Stream<_i6.User>>>
      get onAuthStateChange => (super.noSuchMethod(
              Invocation.getter(#onAuthStateChange),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i4.Stream<_i6.User>>>.value(
                      _FakeEither_0<_i5.Failure, _i4.Stream<_i6.User>>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i4.Stream<_i6.User>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> emailAlreadyRegistered(
          String? email) =>
      (super.noSuchMethod(Invocation.method(#emailAlreadyRegistered, [email]),
              returnValue: Future<_i2.Either<_i5.Failure, bool>>.value(
                  _FakeEither_0<_i5.Failure, bool>()))
          as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.User>> currentUser() =>
      (super.noSuchMethod(Invocation.method(#currentUser, []),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.User>>.value(
                  _FakeEither_0<_i5.Failure, _i6.User>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.User>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.User>> signInAnonymously() =>
      (super.noSuchMethod(Invocation.method(#signInAnonymously, []),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.User>>.value(
                  _FakeEither_0<_i5.Failure, _i6.User>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.User>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.User>> signInWithEmailAndPassword(
          _i7.Credentials? credentials) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmailAndPassword, [credentials]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.User>>.value(
                  _FakeEither_0<_i5.Failure, _i6.User>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.User>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.User>> createUserWithEmailAndPassword(
          _i7.Credentials? credentials) =>
      (super.noSuchMethod(
              Invocation.method(#createUserWithEmailAndPassword, [credentials]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.User>>.value(
                  _FakeEither_0<_i5.Failure, _i6.User>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.User>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.User>> signInWithGoogle() =>
      (super.noSuchMethod(Invocation.method(#signInWithGoogle, []),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.User>>.value(
                  _FakeEither_0<_i5.Failure, _i6.User>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.User>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.User>> signInWithFacebook() =>
      (super.noSuchMethod(Invocation.method(#signInWithFacebook, []),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.User>>.value(
                  _FakeEither_0<_i5.Failure, _i6.User>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.User>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
              returnValue: Future<_i2.Either<_i5.Failure, void>>.value(
                  _FakeEither_0<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> passwordReset(
          _i7.Credentials? credentials) =>
      (super.noSuchMethod(Invocation.method(#passwordReset, [credentials]),
              returnValue: Future<_i2.Either<_i5.Failure, void>>.value(
                  _FakeEither_0<_i5.Failure, void>()))
          as _i4.Future<_i2.Either<_i5.Failure, void>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [CustomValidators].
///
/// See the documentation for Mockito's code generation for more information.
class MockCustomValidators extends _i1.Mock implements _i8.CustomValidators {
  MockCustomValidators() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Either<_i8.InvalidEmailFailure, String> emailAnalysis(String? value) =>
      (super.noSuchMethod(Invocation.method(#emailAnalysis, [value]),
              returnValue: _FakeEither_0<_i8.InvalidEmailFailure, String>())
          as _i2.Either<_i8.InvalidEmailFailure, String>);
  @override
  _i2.Either<_i5.Failure, String> passwordAnalysis(String? value) =>
      (super.noSuchMethod(Invocation.method(#passwordAnalysis, [value]),
              returnValue: _FakeEither_0<_i5.Failure, String>())
          as _i2.Either<_i5.Failure, String>);
  @override
  String toString() => super.toString();
}
