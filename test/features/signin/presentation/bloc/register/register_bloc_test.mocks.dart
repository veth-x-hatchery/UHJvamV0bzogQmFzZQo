// Mocks generated by Mockito 5.0.14 from annotations
// in vethx_beta/test/features/signin/presentation/bloc/register/register_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart'
    as _i5;
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_register_credential_and_password.dart'
    as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [SignInRegisterCredentialAndPassword].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignInRegisterCredentialAndPassword extends _i1.Mock
    implements _i3.SignInRegisterCredentialAndPassword {
  MockSignInRegisterCredentialAndPassword() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.FailureDetails, _i2.Unit>> call(
          _i3.Params? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue: Future<_i2.Either<_i5.FailureDetails, _i2.Unit>>.value(
              _FakeEither_0<_i5.FailureDetails, _i2.Unit>())) as _i4
          .Future<_i2.Either<_i5.FailureDetails, _i2.Unit>>);
  @override
  String toString() => super.toString();
}
