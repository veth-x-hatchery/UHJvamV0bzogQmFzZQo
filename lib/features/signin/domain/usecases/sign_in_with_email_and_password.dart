import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

class SignInWithEmailAndPassword extends UseCase<Unit, Params> {
  final ISignInRepository _signInRepository;
  final IAuthFacade _authFacade;

  SignInWithEmailAndPassword(
    this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<FailureDetails, Unit>> call(Params params) {
    return _authFacade
        .signInWithEmailAndPassword(
          emailAddress: params.credentials.user,
          password: params.credentials.password,
        )
        .then((value) => value.fold(
              (l) => left(_mapFailures(l)),
              (r) => right(unit),
            ));
  }

  FailureDetails _mapFailures(AuthFailure auth) {
    if (auth == const AuthFailure.invalidEmailAndPasswordCombination()) {
      return FailureDetails(
        failure: auth,
        message: SignInWithEmailAndPasswordErrorMessages
            .invalidEmailAndPasswordCombination,
      );
    }
    return FailureDetails(
      failure: auth,
      message: SignInWithEmailAndPasswordErrorMessages.unavailable,
    );
  }
}

class SignInWithEmailAndPasswordErrorMessages {
  static const unavailable = 'Unavailable';
  static const invalidEmailAndPasswordCombination =
      'Invalid email and password combination';
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
