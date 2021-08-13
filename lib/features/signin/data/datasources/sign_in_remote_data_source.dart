import 'package:vethx_login/features/signin/data/models/user_model.dart';
import 'package:vethx_login/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_login/features/signin/domain/entities/user_entity.dart';

abstract class ISignInRemoteSource {
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> createUserWithEmailAndPassword(
      String email, String password);

  /// Throws a [ServerException] for all error codes.
  Future<void> passwordReset(String email);

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> signInWithEmailAndPassword(String email, String password);

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> signInWithGoogle();

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> signInWithFacebook();

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> currentUser();

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> signInAnonymously();

  /// Throws a [ServerException] for all error codes.
  Future<void> signOut();

  /// Throws a [ServerException] for all error codes.
  Future<Stream<User>> get onAuthStateChange;
}
