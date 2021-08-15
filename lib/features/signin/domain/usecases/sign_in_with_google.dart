import 'package:dartz/dartz.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/core/usecases/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

class SignInWithGoogle extends UseCase<User, NoParams> {
  final ISignInRepository _signInRepository;
  final IAuthFacade _authFacade;

  SignInWithGoogle(
    this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return _signInRepository.signInWithGoogle();
  }
}
