import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  //Todo(v): implement random
  String get randomPassword => 'nnI7j5i8B2#bkRZ97bPON#I6cfpyE&I';

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
  );

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    try {
      return await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: emailAddress.getOrCrash(),
            password: password.getOrCrash(),
          )
          .then((_) => right(unit));
    } on PlatformException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    try {
      return await _firebaseAuth
          .signInWithEmailAndPassword(
            email: emailAddress.getOrCrash(),
            password: password.getOrCrash(),
          )
          .then((_) => right(unit));
    } on PlatformException catch (e, stacktrace) {
      if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        // Todo(v): implement analytics
        // Logger.e(e.message ?? 'signInWithEmailAndPassword',
        //     ex: e, stacktrace: stacktrace);
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

      return _firebaseAuth
          .signInWithCredential(credential)
          .then((_) => right(unit));
    } on PlatformException catch (e, stacktrace) {
      // Todo(v): implement analytics
      // Logger.e(e.message ?? 'signInWithGoogle', ex: e, stacktrace: stacktrace);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, bool>> emailIsAlreadyInUse(
      EmailAddress emailAddress) async {
    try {
      return await _firebaseAuth
          .signInWithEmailAndPassword(
            email: emailAddress.getOrCrash(),
            password: randomPassword,
          )
          .then((_) => right(true));
      //Todo(v): Logout if works
    } on PlatformException catch (e, stacktrace) {
      if (e.code == 'wrong-password') {
        return right(true);
      } else if (e.code == 'user-not-found') {
        return right(false);
      } else {
        // Todo(v): implement analytics
        // Logger.e(e.message ?? 'signInWithEmailAndPassword',
        //     ex: e, stacktrace: stacktrace);
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
}
