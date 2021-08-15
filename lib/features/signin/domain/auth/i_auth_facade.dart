import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:vethx_beta/features/signin/domain/auth/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
