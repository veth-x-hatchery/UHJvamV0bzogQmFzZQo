import 'package:dartz/dartz.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

abstract class ISignInRepository {
  Future<Either<Failure, Credential>> cachedCredential();
  Future<Either<Failure, void>> cacheCredential(Credential credential);
  Future<Either<Failure, void>> skipNextLocalAuthenticationRequest();
}
