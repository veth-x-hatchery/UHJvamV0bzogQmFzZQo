// Mocks generated by Mockito 5.0.15 from annotations
// in hatchery/test/features/authentication/presentation/bloc/local_authentication_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:hatchery/core/shared_kernel/shared_kernel.dart' as _i5;
import 'package:hatchery/features/authentication/domain/usecases/request_authentication.usecase.dart'
    as _i3;
import 'package:hatchery/features/authentication/infrastructure/services/local_auth_failure.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [RequestLocalAuthentication].
///
/// See the documentation for Mockito's code generation for more information.
class MockRequestLocalAuthentication extends _i1.Mock
    implements _i3.RequestLocalAuthentication {
  MockRequestLocalAuthentication() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.FailureDetails<_i6.LocalAuthFailure>, bool>> call(
          _i5.NoParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue:
              Future<_i2.Either<_i5.FailureDetails<_i6.LocalAuthFailure>, bool>>.value(
                  _FakeEither_0<_i5.FailureDetails<_i6.LocalAuthFailure>,
                      bool>())) as _i4
          .Future<_i2.Either<_i5.FailureDetails<_i6.LocalAuthFailure>, bool>>);
  @override
  String toString() => super.toString();
}
