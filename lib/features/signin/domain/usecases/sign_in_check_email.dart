import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/core/usecases/usecase.dart';
import 'package:vethx_login/features/signin/domain/repositories/sign_in_repository.dart';

class SignInCheckIfEmailIsInUse extends UseCase<bool, Params> {
  final ISignInRepository _signInRepository;

  SignInCheckIfEmailIsInUse(this._signInRepository);

  @override
  Future<Either<Failure, bool>> call(Params params) {
    return _signInRepository.emailAlreadyRegistered(params.email);
  }
}

class Params extends Equatable {
  final String email;

  const Params({required this.email});

  @override
  List<Object?> get props => [email];
}
