// Mocks generated by Mockito 5.0.14 from annotations
// in vethx_beta/test/features/signin/infrastructure/services/firebase_auth_facade_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart'
    as _i3;
import 'package:firebase_core/firebase_core.dart' as _i2;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart'
    as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeFirebaseApp_0 extends _i1.Fake implements _i2.FirebaseApp {}

class _FakeActionCodeInfo_1 extends _i1.Fake implements _i3.ActionCodeInfo {}

class _FakeUserCredential_2 extends _i1.Fake implements _i4.UserCredential {}

class _FakeConfirmationResult_3 extends _i1.Fake
    implements _i4.ConfirmationResult {}

class _FakeGoogleAuthProvider_4 extends _i1.Fake
    implements _i3.GoogleAuthProvider {}

class _FakeGoogleSignInAuthentication_5 extends _i1.Fake
    implements _i5.GoogleSignInAuthentication {}

/// A class which mocks [FirebaseAuth].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseAuth extends _i1.Mock implements _i4.FirebaseAuth {
  MockFirebaseAuth() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseApp get app => (super.noSuchMethod(Invocation.getter(#app),
      returnValue: _FakeFirebaseApp_0()) as _i2.FirebaseApp);
  @override
  set app(_i2.FirebaseApp? _app) =>
      super.noSuchMethod(Invocation.setter(#app, _app),
          returnValueForMissingStub: null);
  @override
  set tenantId(String? tenantId) =>
      super.noSuchMethod(Invocation.setter(#tenantId, tenantId),
          returnValueForMissingStub: null);
  @override
  Map<dynamic, dynamic> get pluginConstants =>
      (super.noSuchMethod(Invocation.getter(#pluginConstants),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  _i6.Future<void> useEmulator(String? origin) =>
      (super.noSuchMethod(Invocation.method(#useEmulator, [origin]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> useAuthEmulator(String? host, int? port) =>
      (super.noSuchMethod(Invocation.method(#useAuthEmulator, [host, port]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> applyActionCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#applyActionCode, [code]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i3.ActionCodeInfo> checkActionCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#checkActionCode, [code]),
              returnValue:
                  Future<_i3.ActionCodeInfo>.value(_FakeActionCodeInfo_1()))
          as _i6.Future<_i3.ActionCodeInfo>);
  @override
  _i6.Future<void> confirmPasswordReset({String? code, String? newPassword}) =>
      (super.noSuchMethod(
          Invocation.method(#confirmPasswordReset, [],
              {#code: code, #newPassword: newPassword}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i4.UserCredential> createUserWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#createUserWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<List<String>> fetchSignInMethodsForEmail(String? email) => (super
          .noSuchMethod(Invocation.method(#fetchSignInMethodsForEmail, [email]),
              returnValue: Future<List<String>>.value(<String>[]))
      as _i6.Future<List<String>>);
  @override
  _i6.Future<_i4.UserCredential> getRedirectResult() =>
      (super.noSuchMethod(Invocation.method(#getRedirectResult, []),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  bool isSignInWithEmailLink(String? emailLink) => (super.noSuchMethod(
      Invocation.method(#isSignInWithEmailLink, [emailLink]),
      returnValue: false) as bool);
  @override
  _i6.Stream<_i4.User?> authStateChanges() =>
      (super.noSuchMethod(Invocation.method(#authStateChanges, []),
          returnValue: Stream<_i4.User?>.empty()) as _i6.Stream<_i4.User?>);
  @override
  _i6.Stream<_i4.User?> idTokenChanges() =>
      (super.noSuchMethod(Invocation.method(#idTokenChanges, []),
          returnValue: Stream<_i4.User?>.empty()) as _i6.Stream<_i4.User?>);
  @override
  _i6.Stream<_i4.User?> userChanges() =>
      (super.noSuchMethod(Invocation.method(#userChanges, []),
          returnValue: Stream<_i4.User?>.empty()) as _i6.Stream<_i4.User?>);
  @override
  _i6.Future<void> sendPasswordResetEmail(
          {String? email, _i3.ActionCodeSettings? actionCodeSettings}) =>
      (super.noSuchMethod(
          Invocation.method(#sendPasswordResetEmail, [],
              {#email: email, #actionCodeSettings: actionCodeSettings}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> sendSignInLinkToEmail(
          {String? email, _i3.ActionCodeSettings? actionCodeSettings}) =>
      (super.noSuchMethod(
          Invocation.method(#sendSignInLinkToEmail, [],
              {#email: email, #actionCodeSettings: actionCodeSettings}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> setLanguageCode(String? languageCode) =>
      (super.noSuchMethod(Invocation.method(#setLanguageCode, [languageCode]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> setSettings(
          {bool? appVerificationDisabledForTesting,
          String? userAccessGroup,
          String? phoneNumber,
          String? smsCode,
          bool? forceRecaptchaFlow}) =>
      (super.noSuchMethod(
          Invocation.method(#setSettings, [], {
            #appVerificationDisabledForTesting:
                appVerificationDisabledForTesting,
            #userAccessGroup: userAccessGroup,
            #phoneNumber: phoneNumber,
            #smsCode: smsCode,
            #forceRecaptchaFlow: forceRecaptchaFlow
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> setPersistence(_i3.Persistence? persistence) =>
      (super.noSuchMethod(Invocation.method(#setPersistence, [persistence]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<_i4.UserCredential> signInAnonymously() =>
      (super.noSuchMethod(Invocation.method(#signInAnonymously, []),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.UserCredential> signInWithCredential(
          _i3.AuthCredential? credential) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithCredential, [credential]),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.UserCredential> signInWithCustomToken(String? token) =>
      (super.noSuchMethod(Invocation.method(#signInWithCustomToken, [token]),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.UserCredential> signInWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.UserCredential> signInWithEmailLink(
          {String? email, String? emailLink}) =>
      (super.noSuchMethod(
          Invocation.method(
              #signInWithEmailLink, [], {#email: email, #emailLink: emailLink}),
          returnValue:
              Future<_i4.UserCredential>.value(_FakeUserCredential_2())) as _i6
          .Future<_i4.UserCredential>);
  @override
  _i6.Future<_i4.ConfirmationResult> signInWithPhoneNumber(String? phoneNumber,
          [_i4.RecaptchaVerifier? verifier]) =>
      (super.noSuchMethod(
          Invocation.method(#signInWithPhoneNumber, [phoneNumber, verifier]),
          returnValue: Future<_i4.ConfirmationResult>.value(
              _FakeConfirmationResult_3())) as _i6
          .Future<_i4.ConfirmationResult>);
  @override
  _i6.Future<_i4.UserCredential> signInWithPopup(_i3.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#signInWithPopup, [provider]),
              returnValue:
                  Future<_i4.UserCredential>.value(_FakeUserCredential_2()))
          as _i6.Future<_i4.UserCredential>);
  @override
  _i6.Future<void> signInWithRedirect(_i3.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#signInWithRedirect, [provider]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<String> verifyPasswordResetCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#verifyPasswordResetCode, [code]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<void> verifyPhoneNumber(
          {String? phoneNumber,
          _i3.PhoneVerificationCompleted? verificationCompleted,
          _i3.PhoneVerificationFailed? verificationFailed,
          _i3.PhoneCodeSent? codeSent,
          _i3.PhoneCodeAutoRetrievalTimeout? codeAutoRetrievalTimeout,
          String? autoRetrievedSmsCodeForTesting,
          Duration? timeout = const Duration(seconds: 30),
          int? forceResendingToken}) =>
      (super.noSuchMethod(
          Invocation.method(#verifyPhoneNumber, [], {
            #phoneNumber: phoneNumber,
            #verificationCompleted: verificationCompleted,
            #verificationFailed: verificationFailed,
            #codeSent: codeSent,
            #codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
            #autoRetrievedSmsCodeForTesting: autoRetrievedSmsCodeForTesting,
            #timeout: timeout,
            #forceResendingToken: forceResendingToken
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GoogleSignIn].
///
/// See the documentation for Mockito's code generation for more information.
class MockGoogleSignIn extends _i1.Mock implements _i5.GoogleSignIn {
  MockGoogleSignIn() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.SignInOption get signInOption =>
      (super.noSuchMethod(Invocation.getter(#signInOption),
          returnValue: _i7.SignInOption.standard) as _i7.SignInOption);
  @override
  List<String> get scopes =>
      (super.noSuchMethod(Invocation.getter(#scopes), returnValue: <String>[])
          as List<String>);
  @override
  _i6.Stream<_i5.GoogleSignInAccount?> get onCurrentUserChanged =>
      (super.noSuchMethod(Invocation.getter(#onCurrentUserChanged),
              returnValue: Stream<_i5.GoogleSignInAccount?>.empty())
          as _i6.Stream<_i5.GoogleSignInAccount?>);
  @override
  _i6.Future<_i5.GoogleSignInAccount?> signInSilently(
          {bool? suppressErrors = true}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #signInSilently, [], {#suppressErrors: suppressErrors}),
              returnValue: Future<_i5.GoogleSignInAccount?>.value())
          as _i6.Future<_i5.GoogleSignInAccount?>);
  @override
  _i6.Future<bool> isSignedIn() =>
      (super.noSuchMethod(Invocation.method(#isSignedIn, []),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i5.GoogleSignInAccount?> signIn() =>
      (super.noSuchMethod(Invocation.method(#signIn, []),
              returnValue: Future<_i5.GoogleSignInAccount?>.value())
          as _i6.Future<_i5.GoogleSignInAccount?>);
  @override
  _i6.Future<_i5.GoogleSignInAccount?> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
              returnValue: Future<_i5.GoogleSignInAccount?>.value())
          as _i6.Future<_i5.GoogleSignInAccount?>);
  @override
  _i6.Future<_i5.GoogleSignInAccount?> disconnect() =>
      (super.noSuchMethod(Invocation.method(#disconnect, []),
              returnValue: Future<_i5.GoogleSignInAccount?>.value())
          as _i6.Future<_i5.GoogleSignInAccount?>);
  @override
  _i6.Future<bool> requestScopes(List<String>? scopes) =>
      (super.noSuchMethod(Invocation.method(#requestScopes, [scopes]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [UserCredential].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserCredential extends _i1.Mock implements _i4.UserCredential {
  MockUserCredential() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String toString() => super.toString();
}

/// A class which mocks [OAuthCredential].
///
/// See the documentation for Mockito's code generation for more information.
class MockOAuthCredential extends _i1.Mock implements _i3.OAuthCredential {
  MockOAuthCredential() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get providerId =>
      (super.noSuchMethod(Invocation.getter(#providerId), returnValue: '')
          as String);
  @override
  String get signInMethod =>
      (super.noSuchMethod(Invocation.getter(#signInMethod), returnValue: '')
          as String);
  @override
  Map<String, String?> asMap() =>
      (super.noSuchMethod(Invocation.method(#asMap, []),
          returnValue: <String, String?>{}) as Map<String, String?>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GoogleAuthProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockGoogleAuthProvider extends _i1.Mock
    implements _i3.GoogleAuthProvider {
  MockGoogleAuthProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<String> get scopes =>
      (super.noSuchMethod(Invocation.getter(#scopes), returnValue: <String>[])
          as List<String>);
  @override
  Map<dynamic, dynamic> get parameters =>
      (super.noSuchMethod(Invocation.getter(#parameters),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  String get providerId =>
      (super.noSuchMethod(Invocation.getter(#providerId), returnValue: '')
          as String);
  @override
  _i3.GoogleAuthProvider addScope(String? scope) =>
      (super.noSuchMethod(Invocation.method(#addScope, [scope]),
          returnValue: _FakeGoogleAuthProvider_4()) as _i3.GoogleAuthProvider);
  @override
  _i3.GoogleAuthProvider setCustomParameters(
          Map<dynamic, dynamic>? customOAuthParameters) =>
      (super.noSuchMethod(
          Invocation.method(#setCustomParameters, [customOAuthParameters]),
          returnValue: _FakeGoogleAuthProvider_4()) as _i3.GoogleAuthProvider);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GoogleSignInAccount].
///
/// See the documentation for Mockito's code generation for more information.
class MockGoogleSignInAccount extends _i1.Mock
    implements _i5.GoogleSignInAccount {
  MockGoogleSignInAccount() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get email =>
      (super.noSuchMethod(Invocation.getter(#email), returnValue: '')
          as String);
  @override
  String get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);
  @override
  _i6.Future<_i5.GoogleSignInAuthentication> get authentication =>
      (super.noSuchMethod(Invocation.getter(#authentication),
              returnValue: Future<_i5.GoogleSignInAuthentication>.value(
                  _FakeGoogleSignInAuthentication_5()))
          as _i6.Future<_i5.GoogleSignInAuthentication>);
  @override
  _i6.Future<Map<String, String>> get authHeaders => (super.noSuchMethod(
          Invocation.getter(#authHeaders),
          returnValue: Future<Map<String, String>>.value(<String, String>{}))
      as _i6.Future<Map<String, String>>);
  @override
  _i6.Future<void> clearAuthCache() =>
      (super.noSuchMethod(Invocation.method(#clearAuthCache, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GoogleSignInAuthentication].
///
/// See the documentation for Mockito's code generation for more information.
class MockGoogleSignInAuthentication extends _i1.Mock
    implements _i5.GoogleSignInAuthentication {
  MockGoogleSignInAuthentication() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String toString() => super.toString();
}
