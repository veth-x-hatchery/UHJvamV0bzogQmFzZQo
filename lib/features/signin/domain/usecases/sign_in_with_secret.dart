import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/l10n/l10n.dart';

class SignInWithSecret extends UseCase<Unit, Secret> {
  final ISignInRepository _signInRepository;
  final IAuthFacade _authFacade;

  SignInWithSecret(
    this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<FailureDetails, Unit>> call(Secret secret) async {
    final cachedCredential = await _signInRepository.cachedCredential();
    return cachedCredential.fold(
      (l) => left(_mapFailures(const AuthFailure.invalidCachedCredential())),
      (credential) {
        return _authFacade
            .signInWithCredentialAndSecret(
              credentialAddress: credential,
              secret: secret,
            )
            .then((value) => value.fold(
                  (l) => left(_mapFailures(l)),
                  (r) => right(unit),
                ));
      },
    );
  }

  FailureDetails _mapFailures(AuthFailure auth) {
    if (auth == const AuthFailure.invalidCachedCredential()) {
      return FailureDetails(
        failure: auth,
        message: SignInWithSecretErrorMessages.invalidCachedCredential(),
      );
    }
    if (auth == const AuthFailure.invalidCredentialAndSecretCombination()) {
      return FailureDetails(
        failure: auth,
        message: SignInWithSecretErrorMessages
            .invalidCredentialAndSecretCombination(),
      );
    }
    return FailureDetails(
      failure: auth,
      message: SignInWithSecretErrorMessages.unavailable(),
    );
  }
}

// ignore: avoid_classes_with_only_static_members
class SignInWithSecretErrorMessages {
  static MessageFromLocalization unavailable() =>
      (locations) => locations?.signIn_usecase_withSecret_unavailable;
  static MessageFromLocalization invalidCredentialAndSecretCombination() =>
      (locations) => locations
          ?.signIn_usecase_withSecret_invalidCredentialAndSecretCombination;
  static MessageFromLocalization invalidCachedCredential() => (locations) =>
      locations?.signIn_usecase_withSecret_invalidCachedCredential;
}
