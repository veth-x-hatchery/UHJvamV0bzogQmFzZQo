import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart'
    as domain;
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

class FirebaseAuthFacadeMock implements IAuthFacade {
  domain.User? user;
  final bool isCredentialAlreadyInUse;

  FirebaseAuthFacadeMock({
    required this.isCredentialAlreadyInUse,
  }) {
    Logger.tests(
        '******************** FirebaseAuthFacadeMock constructor ***********************');
  }

  void _loggedUser({Credential? credential}) {
    credential ??= Credential('tester@test.com');
    user = domain.User(credential: credential, name: 'Tester');
    Logger.tests('AuthFacadeMock -> _loggedUser: $user');
  }

  void _removeUser() {
    Logger.tests('AuthFacadeMock -> _removeUser: $user');
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
            'FirebaseAuthFacadeMock.registerWithCredentialAndSecret -> ${e.code}');
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
            'FirebaseAuthFacadeMock.signInWithCredentialAndSecret -> ${e.code}');
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
      Logger.infrastructure('IAuthFacade', exception: ex, stackTrace: stack);
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
            'FirebaseAuthFacadeMock.credentialIsAlreadyInUse -> ${e.code}');
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
    await Future.delayed(const Duration(seconds: 3));
    Logger.tests('AuthFacadeMock -> getSignedInUser -> $user');
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
        Logger.infrastructure(
            'FirebaseAuthFacadeMock.resetPassword -> ${e.code}',
            exception: e,
            stackTrace: s);
        return left(const AuthFailure.serverError());
      }
    }
  }
}
