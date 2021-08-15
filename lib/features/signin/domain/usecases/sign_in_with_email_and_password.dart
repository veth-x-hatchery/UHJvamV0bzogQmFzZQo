import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/core/usecases/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

class SignInWithEmailAndPassword extends UseCase<User, Params> {
  final ISignInRepository _signInRepository;
  final IAuthFacade _authFacade;

  SignInWithEmailAndPassword(
    this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<Failure, User>> call(Params params) {
    return _signInRepository.signInWithEmailAndPassword(params.credentials);
  }
}

class Params extends Equatable {
  final Credentials credentials;

  const Params({required this.credentials});

  @override
  List<Object?> get props => [
        credentials.user,
        credentials.password,
      ];
}
