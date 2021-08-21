import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';

abstract class IAuthFacade {
  Future<User?> getSignedInUser();

  Future<Either<AuthFailure, bool>> credentialIsAlreadyInUse(
      EmailAddress credentialAddress);

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress credentialAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress credentialAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOut();
}
