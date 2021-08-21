import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart'
    as domain;
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_user_mapper.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseUserMapper _firebaseUserMapper;

  //Todo(v): implement random
  String get randomPassword => 'nnI7j5i8B2#bkRZ97bPON#I6cfpyE&I';

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
    this._firebaseUserMapper,
  );

  @override
  Future<Either<AuthFailure, Unit>> registerWithCredentialAndPassword({
    required CredentialAddress credentialAddress,
    required Password password,
  }) async {
    try {
      await _firebaseAuth.createUserWithCredentialAndPassword(
        credential: credentialAddress.getOrCrash(),
        password: password.getOrCrash(),
      );
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'credential-already-in-use') {
        return left(const AuthFailure.credentialAlreadyInUse());
      } else {
        Logger.infrastructure(
            'FirebaseAuthFacade.registerWithCredentialAndPassword -> ${e.code}');
        return left(const AuthFailure.serverError());
      }
    } on Exception catch (ex, stack) {
      Logger.infrastructure('IAuthFacade', exception: ex, stackTrace: stack);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithCredentialAndPassword({
    required CredentialAddress credentialAddress,
    required Password password,
  }) async {
    try {
      await _firebaseAuth.signInWithCredentialAndPassword(
        credential: credentialAddress.getOrCrash(),
        password: password.getOrCrash(),
      );
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        return left(
            const AuthFailure.invalidCredentialAndPasswordCombination());
      } else {
        Logger.infrastructure(
            'FirebaseAuthFacade.signInWithCredentialAndPassword -> ${e.code}');
        return left(const AuthFailure.serverError());
      }
    } on Exception catch (ex, stack) {
      Logger.infrastructure('IAuthFacade', exception: ex, stackTrace: stack);
      return left(const AuthFailure.serverError());
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
      CredentialAddress credentialAddress) async {
    try {
      await _firebaseAuth.signInWithCredentialAndPassword(
        credential: credentialAddress.getOrCrash(),
        password: randomPassword,
      );
      return right(true);
      //Todo(v): Logout if works
    } on FirebaseException catch (e) {
      if (e.code == 'wrong-password') {
        return right(true);
      } else if (e.code == 'user-not-found') {
        return right(false);
      } else {
        Logger.infrastructure(
            'FirebaseAuthFacade.credentialIsAlreadyInUse -> ${e.code}');
        return left(const AuthFailure.serverError());
      }
    } on Exception catch (ex, stack) {
      Logger.infrastructure('IAuthFacade', exception: ex, stackTrace: stack);
      return left(const AuthFailure.serverError());
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
}
