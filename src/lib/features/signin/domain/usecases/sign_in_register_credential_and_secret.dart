import 'package:dartz/dartz.dart';
import 'package:hatchery/core/shared_kernel/shared_kernel.dart';
import 'package:hatchery/features/signin/domain/entities/credentials_entity.dart';
import 'package:hatchery/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:hatchery/features/signin/domain/services/auth_failure.dart';
import 'package:hatchery/features/signin/domain/services/i_auth.service.dart';
import 'package:hatchery/l10n/l10n.dart';

class SignInRegisterCredentialAndSecret extends UseCase<Unit, Credentials> {
  final ISignInRepository _signInRepository;
  final IAuthService _authService;

  SignInRegisterCredentialAndSecret(
    this._signInRepository,
    this._authService,
  );

  @override
  Future<Either<FailureDetails<AuthFailure>, Unit>> call(
      Credentials credentials) {
    return _authService
        .registerWithCredentialAndSecret(
          credentialAddress: credentials.user,
          secret: credentials.secret,
        )
        .then((value) => value.fold(
              (l) => left(_mapFailures(l)),
                (r) async {
                  await _signInRepository.skipNextLocalAuthenticationRequest();
                  return right(unit);
                },
            ));
  }

  FailureDetails<AuthFailure> _mapFailures(AuthFailure auth) {
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
  static MessageFromLocalizations unavailable() => (appLocalizations) =>
      appLocalizations
          ?.signIn_usecase_registerCredentialAndSecret_unavailable ??
      'signIn_usecase_registerCredentialAndSecret_unavailable';

  static MessageFromLocalizations credentialAlreadyInUse() => (appLocalizations) =>
      appLocalizations
          ?.signIn_usecase_registerCredentialAndSecret_credentialAlreadyInUse ??
      'signIn_usecase_registerCredentialAndSecret_credentialAlreadyInUse';
}
