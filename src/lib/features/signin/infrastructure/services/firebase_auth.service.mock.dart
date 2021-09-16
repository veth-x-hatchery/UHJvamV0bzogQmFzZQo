import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hatchery/core/utils/logger.dart';
import 'package:hatchery/features/signin/domain/entities/user_entity.dart'
    as domain;
import 'package:hatchery/features/signin/domain/entities/value_objects.dart';
import 'package:hatchery/features/signin/domain/services/auth_failure.dart';
import 'package:hatchery/features/signin/domain/services/i_auth.service.dart';

class AuthServiceMock implements IAuthService {
  //! Variables

  domain.User? user;

  bool isCredentialAlreadyInUse = false;

  /// Each integration test will have a specific scenario
  /// [integration_test/features/signin/sign_in_email_test.dart]
  /// This can be useful in other .mocks.dart
  void setupSignInEmailIntegrationTest() {
    Logger.tests(
        '****** AuthServiceMock setupSignInEmailIntegrationTest **********');
    isCredentialAlreadyInUse = true;
  }

  /// [integration_test/features/signin/sign_in_register_test.dart]
  void setupSignInRegisterIntegrationTest() {
    Logger.tests(
        '****** AuthServiceMock setupSignInEmailIntegrationTest **********');
    isCredentialAlreadyInUse = false;
  }

  void setupHomeAlreadyLoggedIntegrationTest() {
    Logger.tests(
        '****** AuthServiceMock setupHomeAlreadyLoggedIntegrationTest **********');
    isCredentialAlreadyInUse = false;
    user = defaultUserTester;
  }

  //! Test helpers

  static const loadingDuration = Duration(seconds: 1);

  static Credential validTestCredential = Credential('domenico@tester.com');
  static Secret validTestSecret = Secret('ZG9tZW5pY29AdmV0aHguY29tCg');
  static Credential invalidCredential = Credential('invalid.email.com');
  static Secret invalidSecret = Secret('1234');

  static domain.User defaultUserTester = domain.User(
    credential: validTestCredential,
    name: 'Tester',
  );

  AuthServiceMock() {
    Logger.tests(
        '******************** AuthServiceMock constructor ***********************');
  }

  void _loggedUser({Credential? credential}) {
    credential ??= validTestCredential;
    user = domain.User(credential: credential, name: 'Tester');
    Logger.tests('AuthServiceMock -> _loggedUser: $user');
  }

  void _removeUser() {
    Logger.tests('AuthServiceMock -> _removeUser: $user');
    user = null;
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithCredentialAndSecret({
    required Credential credentialAddress,
    required Secret secret,
  }) async {
    try {
      _loggedUser(credential: credentialAddress);
      await Future.delayed(const Duration(seconds: 1));
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'credential-already-in-use') {
        return left(const AuthFailure.credentialAlreadyInUse());
      } else {
        Logger.infrastructure(
            'AuthServiceMock.registerWithCredentialAndSecret -> ${e.code}');
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithCredentialAndSecret({
    required Credential credentialAddress,
    required Secret secret,
  }) async {
    try {
      _loggedUser(credential: credentialAddress);
      await Future.delayed(const Duration(seconds: 1));
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'wrong-secret' || e.code == 'user-not-found') {
        return left(const AuthFailure.invalidCredentialAndSecretCombination());
      } else {
        Logger.infrastructure(
            'AuthServiceMock.signInWithCredentialAndSecret -> ${e.code}');
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      _loggedUser();
      await Future.delayed(const Duration(seconds: 1));
      return right(unit);
    } on Exception catch (ex, stack) {
      Logger.infrastructure('IAuthService', exception: ex, stackTrace: stack);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, bool>> credentialIsAlreadyInUse(
      Credential credentialAddress) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(isCredentialAlreadyInUse);
    } on FirebaseException catch (e) {
      if (e.code == 'wrong-password') {
        return right(true);
      } else if (e.code == 'user-not-found') {
        return right(false);
      } else {
        Logger.infrastructure(
            'AuthServiceMock.credentialIsAlreadyInUse -> ${e.code}');
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<void> signOut() async {
    _removeUser();
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<domain.User?> getSignedInUser() async {
    // await Future.delayed(const Duration(seconds: 3));
    Logger.tests('AuthServiceMock -> getSignedInUser -> $user');
    return user;
  }

  @override
  Future<Either<AuthFailure, Unit>> passwordReset(Credential credential) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return right(unit);
    } on FirebaseException catch (e, s) {
      if (e.code.contains('invalid-email') ||
          e.code.contains('user-not-found')) {
        return left(const AuthFailure.invalidCachedCredential());
      } else {
        Logger.infrastructure('AuthServiceMock.resetPassword -> ${e.code}',
            exception: e, stackTrace: s);
        return left(const AuthFailure.serverError());
      }
    }
  }
}
