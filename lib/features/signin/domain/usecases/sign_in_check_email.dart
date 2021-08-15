import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/core/usecases/usecase.dart';
import 'package:vethx_login/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_login/features/signin/presentation/utils/custom_validators.dart';

class SignInCheckIfEmailIsInUse extends UseCase<bool, Params> {
  final ISignInRepository _signInRepository;
  final CustomValidators _validators;

  SignInCheckIfEmailIsInUse(
    this._validators,
    this._signInRepository,
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
