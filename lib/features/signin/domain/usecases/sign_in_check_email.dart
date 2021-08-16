import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
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
  Future<Either<FailureDetails, bool>> call(Params params) =>
      _authFacade.emailIsAlreadyInUse(params.email).then(
            (value) => value.fold(
              (l) => left(_mapFailures(l)),
              (r) => right(r),
            ),
          );

  FailureDetails _mapFailures(AuthFailure auth) {
    switch (auth.runtimeType) {
      case ServerError:
      default:
        return FailureDetails(
          failure: auth,
          message: CheckEmailErrorMessages.UnknowError,
        );
    }
  }
}

class Params extends Equatable {
  final EmailAddress email;

  const Params({required this.email});

  @override
  List<Object?> get props => [email];
}

class CheckEmailErrorMessages {
  static const UnknowError = 'Unavailable';
}
