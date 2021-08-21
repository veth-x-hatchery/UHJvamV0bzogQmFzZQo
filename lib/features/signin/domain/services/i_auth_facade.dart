import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';

abstract class IAuthFacade {
  Future<User?> getSignedInUser();

  Future<Either<AuthFailure, bool>> credentialIsAlreadyInUse(
      CredentialAddress credentialAddress);

  Future<Either<AuthFailure, Unit>> registerWithCredentialAndPassword({
    required CredentialAddress credentialAddress,
    required Password secret,
  });

  Future<Either<AuthFailure, Unit>> signInWithCredentialAndPassword({
    required CredentialAddress credentialAddress,
    required Password secret,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOut();
}
