import 'package:dartz/dartz.dart';
import 'package:hatchery/features/signin/domain/entities/user_entity.dart';
import 'package:hatchery/features/signin/domain/entities/value_objects.dart';
import 'package:hatchery/features/signin/domain/services/auth_failure.dart';

abstract class IAuthService {
  Future<User?> getSignedInUser();

  Future<Either<AuthFailure, bool>> credentialIsAlreadyInUse(
      Credential credentialAddress);

  Future<Either<AuthFailure, Unit>> registerWithCredentialAndSecret({
    required Credential credentialAddress,
    required Secret secret,
  });

  Future<Either<AuthFailure, Unit>> signInWithCredentialAndSecret({
    required Credential credentialAddress,
    required Secret secret,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOut();

  Future<Either<AuthFailure, Unit>> passwordReset(Credential credential);
}
