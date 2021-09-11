// Mocks generated by Mockito 5.0.15 from annotations
// in hatchery/test/features/signin/presentation/bloc/secret/reset/sign_in_secret_reset_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:hatchery/core/shared_kernel/shared_kernel.dart' as _i7;
import 'package:hatchery/features/signin/domain/services/auth_failure.dart'
    as _i8;
import 'package:hatchery/features/signin/domain/usecases/sign_in_secret_reset.dart'
    as _i6;
import 'package:hatchery/features/signin/presentation/manager/navigation.manager.dart'
    as _i3;
import 'package:hatchery/features/signin/presentation/routes/sign_in_go_to.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [NavigationManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationManager extends _i1.Mock implements _i3.NavigationManager {
  MockNavigationManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i5.SignInPageGoTo> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i5.SignInPageGoTo>.empty())
          as _i4.Stream<_i5.SignInPageGoTo>);
  @override
  void goTo(_i5.SignInPageGoTo? parameters) =>
      super.noSuchMethod(Invocation.method(#goTo, [parameters]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [SignInSecretReset].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInSecretReset extends _i1.Mock implements _i6.SignInSecretReset {
  MockSignInSecretReset() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i7.FailureDetails<_i8.AuthFailure>, _i2.Unit>> call(
          _i7.NoParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue:
              Future<_i2.Either<_i7.FailureDetails<_i8.AuthFailure>, _i2.Unit>>.value(
                  _FakeEither_0<_i7.FailureDetails<_i8.AuthFailure>,
                      _i2.Unit>())) as _i4
          .Future<_i2.Either<_i7.FailureDetails<_i8.AuthFailure>, _i2.Unit>>);
  @override
  String toString() => super.toString();
}
