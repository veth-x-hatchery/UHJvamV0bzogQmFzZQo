import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/l10n/l10n.dart';

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
            .credentialAlreadyInUse(),
      );
    }
    if (auth == const AuthFailure.invalidCredentialAndSecretCombination()) {
      return FailureDetails(
        failure: auth,
        message: SignInRegisterCredentialAndSecretErrorMessages
            .credentialAlreadyInUse(),
      );
    }
    return FailureDetails(
      failure: auth,
      message: SignInRegisterCredentialAndSecretErrorMessages.unavailable(),
    );
  }
}

// ignore: avoid_classes_with_only_static_members
class SignInRegisterCredentialAndSecretErrorMessages {
  static MessageFromLocations unavailable() => (locations) =>
      locations?.signIn_usecase_registerCredentialAndSecret_unavailable;

  static MessageFromLocations credentialAlreadyInUse() =>
      (locations) => locations
          ?.signIn_usecase_registerCredentialAndSecret_credentialAlreadyInUse;
}
