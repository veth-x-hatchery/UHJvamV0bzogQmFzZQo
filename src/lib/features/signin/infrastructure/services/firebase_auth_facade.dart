import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hatchery/core/utils/logger.dart';
import 'package:hatchery/features/signin/domain/entities/user_entity.dart'
    as domain;
import 'package:hatchery/features/signin/domain/entities/value_objects.dart';
import 'package:hatchery/features/signin/domain/services/auth_failure.dart';
import 'package:hatchery/features/signin/domain/services/i_auth_facade.dart';
import 'package:hatchery/features/signin/infrastructure/services/firebase_user_mapper.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseUserMapper _firebaseUserMapper;

  //Todo(v): implement random
  String get randomSecret => 'nnI7j5i8B2#bkRZ97bPON#I6cfpyE&I';

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
    this._firebaseUserMapper,
  );

  @override
  Future<Either<AuthFailure, Unit>> registerWithCredentialAndSecret({
    required Credential credentialAddress,
    required Secret secret,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: credentialAddress.getOrCrash(),
        password: secret.getOrCrash(),
      );
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'credential-already-in-use') {
        return left(const AuthFailure.credentialAlreadyInUse());
      } else {
        Logger.infrastructure(
            'FirebaseAuthFacade.registerWithCredentialAndSecret -> ${e.code}');
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
      await _firebaseAuth.signInWithEmailAndPassword(
        email: credentialAddress.getOrCrash(),
        password: secret.getOrCrash(),
      );
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'wrong-secret' || e.code == 'user-not-found') {
        return left(const AuthFailure.invalidCredentialAndSecretCombination());
      } else {
        Logger.infrastructure(
            'FirebaseAuthFacade.signInWithCredentialAndSecret -> ${e.code}');
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final googleAuthentication = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      await _firebaseAuth.signInWithCredential(credential);

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
      final availableSignInMethods = await _firebaseAuth
          .fetchSignInMethodsForEmail(credentialAddress.getOrCrash());
      return right(availableSignInMethods.isNotEmpty);
    } on FirebaseException catch (e) {
      if (e.code == 'invalid-email') {
        return right(false);
      } else {
        Logger.infrastructure(
            'FirebaseAuthFacade.credentialIsAlreadyInUse -> ${e.code}');
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<void> signOut() async {
    Future.wait([
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
  }

  @override
  Future<domain.User?> getSignedInUser() {
    return Future.value(
        _firebaseUserMapper.toDomain(_firebaseAuth.currentUser));
  }

  @override
  Future<Either<AuthFailure, Unit>> passwordReset(Credential credential) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
          email: credential.getOrCrash());
      return right(unit);
    } on FirebaseException catch (e, s) {
      if (e.code.contains('invalid-email') ||
          e.code.contains('user-not-found')) {
        return left(const AuthFailure.invalidCachedCredential());
      } else {
        Logger.infrastructure('FirebaseAuthFacade.resetPassword -> ${e.code}',
            exception: e, stackTrace: s);
        return left(const AuthFailure.serverError());
      }
    }
  }
}
