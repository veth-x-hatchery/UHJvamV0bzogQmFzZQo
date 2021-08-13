import 'package:dartz/dartz.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/core/usecases/usecase.dart';
import 'package:vethx_login/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_login/features/signin/domain/repositories/sign_in_repository.dart';

class SignInWithGoogle extends UseCase<User, NoParams> {
  final ISignInRepository _signInRepository;

  SignInWithGoogle(this._signInRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return _signInRepository.signInWithGoogle();
  }
}
