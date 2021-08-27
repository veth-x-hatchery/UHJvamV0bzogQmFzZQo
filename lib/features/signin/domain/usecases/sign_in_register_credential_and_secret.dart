import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

class SignInRegisterCredentialAndSecret extends UseCase<Unit, Credentials> {
  // final ISignInRepository _signInRepository;
  final IAuthFacade _authFacade;

  SignInRegisterCredentialAndSecret(
    // this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<FailureDetails, Unit>> call(Credentials credentials) {
    return _authFacade
        .registerWithCredentialAndSecret(
          credentialAddress: credentials.user,
          secret: credentials.secret,
        )
        .then((value) => value.fold(
              (l) => left(_mapFailures(l)),
              (r) => right(unit),
            ));
  }

  FailureDetails _mapFailures(AuthFailure auth) {
    if (auth == const AuthFailure.credentialAlreadyInUse()) {
      return FailureDetails(
        failure: auth,
        message: SignInRegisterCredentialAndSecretErrorMessages
            .credentialAlreadyInUse,
      );
    }
    if (auth == const AuthFailure.invalidCredentialAndSecretCombination()) {
      return FailureDetails(
        failure: auth,
        message: SignInRegisterCredentialAndSecretErrorMessages
            .credentialAlreadyInUse,
      );
    }
    return FailureDetails(
      failure: auth,
      message: SignInRegisterCredentialAndSecretErrorMessages.unavailable,
    );
  }
}

class SignInRegisterCredentialAndSecretErrorMessages {
  static const unavailable = 'Unavailable';
  static const credentialAlreadyInUse = 'This credential is already in use';
  static const invalidCredentialAndSecretCombination =
      'Invalid credential and secret combination';
}
