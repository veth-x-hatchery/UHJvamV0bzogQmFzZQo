import 'package:dartz/dartz.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_login/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_login/features/signin/domain/repositories/sign_in_repository.dart';

class SignInWithEmailAndPassword {
  final ISignInRepository _signInRepository;

  SignInWithEmailAndPassword(this._signInRepository);

  Future<Either<Failure, User>> execute({required Credentials credentials}) {
    return _signInRepository.signInWithEmailAndPassword(credentials);
  }
}
