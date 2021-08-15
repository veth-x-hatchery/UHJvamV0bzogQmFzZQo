import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vethx_beta/core/error/failures.dart';
import 'package:vethx_beta/core/usecases/usecase.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/presentation/utils/custom_validators.dart';

class SignInCheckIfEmailIsInUse extends UseCase<bool, Params> {
  final ISignInRepository _signInRepository;
  final CustomValidators _validators;
  final IAuthFacade _authFacade;

  SignInCheckIfEmailIsInUse(
    this._validators,
    this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<Failure, bool>> call(Params params) =>
      _validators.emailAnalysis(params.email).fold(
            (failure) async => Left(failure),
            (validatedEmail) =>
                _signInRepository.emailAlreadyRegistered(validatedEmail).then(
                      (registered) => registered.fold(
                        (failure) => Left(failure),
                        (isAlreadyRegistered) => Right(isAlreadyRegistered),
                      ),
                    ),
          );
}

class Params extends Equatable {
  final String email;

  const Params({required this.email});

  @override
  List<Object?> get props => [email];
}
