import 'package:dartz/dartz.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';

abstract class ISignInRepository {
  Future<Either<Failure, User>> currentUser();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, Stream<User>>> get onAuthStateChange;
}
