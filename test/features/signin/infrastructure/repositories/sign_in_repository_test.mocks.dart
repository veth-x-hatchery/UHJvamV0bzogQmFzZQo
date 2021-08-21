// Mocks generated by Mockito 5.0.14 from annotations
// in vethx_beta/test/features/signin/infrastructure/repositories/sign_in_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:vethx_beta/core/network/network_info.dart' as _i5;
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart'
    as _i2;
import 'package:vethx_beta/features/signin/infrastructure/datasources/sign_in_local_data_source.dart'
    as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeCredential_0 extends _i1.Fake implements _i2.Credential {}

/// A class which mocks [ISignInLocalSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockISignInLocalSource extends _i1.Mock
    implements _i3.ISignInLocalSource {
  MockISignInLocalSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<void> cacheCredential(_i2.Credential? credential) =>
      (super.noSuchMethod(Invocation.method(#cacheCredential, [credential]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<_i2.Credential> cachedCredential() =>
      (super.noSuchMethod(Invocation.method(#cachedCredential, []),
              returnValue: Future<_i2.Credential>.value(_FakeCredential_0()))
          as _i4.Future<_i2.Credential>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [INetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockINetworkInfo extends _i1.Mock implements _i5.INetworkInfo {
  MockINetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  String toString() => super.toString();
}
