import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

class SignInCheckIfEmailIsInUse extends UseCase<bool, Params> {
  final ISignInRepository _signInRepository;

  final IAuthFacade _authFacade;

  SignInCheckIfEmailIsInUse(
    this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<AuthFailure, bool>> call(Params params) =>
      _authFacade.emailIsAlreadyInUse(params.email);
}

class Params extends Equatable {
  final EmailAddress email;

  const Params({required this.email});

  @override
  List<Object?> get props => [email];
}
