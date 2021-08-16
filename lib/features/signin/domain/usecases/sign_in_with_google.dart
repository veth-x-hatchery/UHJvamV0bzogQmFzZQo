import 'package:dartz/dartz.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

class SignInWithGoogle extends UseCase<Unit, NoParams> {
  final ISignInRepository _signInRepository;
  final IAuthFacade _authFacade;

  SignInWithGoogle(
    this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<AuthFailure, Unit>> call(NoParams params) {
    return _authFacade.signInWithGoogle();
  }
}
