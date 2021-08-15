import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/auth/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/auth/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/core/errors.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/ui/widgets/shared/platform_exeption_alert_dialog.widget.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

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
      /**
     * invalid-email:
     * Thrown if the email address is not valid.
     * user-disabled:
     * Thrown if the user corresponding to the given email has been disabled.
     * user-not-found:
     * Thrown if there is no user corresponding to the given email.
     * wrong-password:
     * Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.
     */
      if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        // Todo(v): implement analytics
        Logger.e(e.message ?? 'signInWithEmailAndPassword',
            ex: e, stacktrace: stacktrace);
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(AuthFailure.cancelledByUser());
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
      Logger.e(e.message ?? 'signInWithGoogle', ex: e, stacktrace: stacktrace);
      return left(const AuthFailure.serverError());
    }

    /**

 account-exists-with-different-credential:
Thrown if there already exists an account with the email address asserted by the credential. Resolve this by calling [fetchSignInMethodsForEmail] and then asking the user to sign in using one of the returned providers. Once the user is signed in, the original credential can be linked to the user with [linkWithCredential].
invalid-credential:
Thrown if the credential is malformed or has expired.
operation-not-allowed:
Thrown if the type of account corresponding to the credential is not enabled. Enable the account type in the Firebase Console, under the Auth tab.
user-disabled:
Thrown if the user corresponding to the given credential has been disabled.
user-not-found:
Thrown if signing in with a credential from [EmailAuthProvider.credential] and there is no user corresponding to the given email.
wrong-password:
Thrown if signing in with a credential from [EmailAuthProvider.credential] and the password is invalid for the given email, or if the account corresponding to the email does not have a password set.
invalid-verification-code:
Thrown if the credential is a [PhoneAuthProvider.credential] and the verification code of the credential is not valid.
invalid-verification-id:
Thrown if the credential is a [PhoneAuthProvider.credential] and the verification ID of the credential is not valid.id.
         */
  }
}
