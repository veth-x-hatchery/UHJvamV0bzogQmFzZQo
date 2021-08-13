import 'package:dartz/dartz.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_login/features/signin/domain/entities/user_entity.dart';

abstract class ISignInRepository {
  Future<Either<Failure, User>> currentUser();
  Future<Either<Failure, User>> signInAnonymously();
  Future<Either<Failure, User>> signInWithEmailAndPassword(
      Credentials credentials);
  Future<Either<Failure, User>> createUserWithEmailAndPassword(
      Credentials credentials);
  Future<Either<Failure, User>> signInWithGoogle();
  Future<Either<Failure, User>> signInWithFacebook();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, void>> passwordReset(Credentials credentials);
  Future<Either<Failure, Stream<User>>> get onAuthStateChange;
}
