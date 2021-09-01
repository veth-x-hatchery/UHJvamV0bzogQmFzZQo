import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/l10n/l10n.dart';

class SignInSecretReset extends UseCase<Unit, NoParams> {
  final ISignInRepository _signInRepository;
  final IAuthFacade _authFacade;

  SignInSecretReset(
    this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<FailureDetails, Unit>> call(NoParams params) async {
    final cachedCredential = await _signInRepository.cachedCredential();
    return cachedCredential.fold(
      (l) => left(_mapFailures(const AuthFailure.invalidCachedCredential())),
      (credential) {
        return _authFacade.passwordReset(credential).then((value) => value.fold(
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
        message: SignInSecretResetMessages.invalidCachedCredential()
            .translate(null)!,
      );
    }
    return FailureDetails(
      failure: auth,
      message: SignInSecretResetMessages.unavailable().translate(null)!,
    );
  }
}

// ignore: avoid_classes_with_only_static_members
class SignInSecretResetMessages {
  static MessageFromLocations unavailable() =>
      (locations) => locations?.signIn_usecase_secretReset_unavailable;
  static MessageFromLocations invalidCachedCredential() => (locations) =>
      locations?.signIn_usecase_secretReset_invalidCachedCredential;
  static MessageFromLocations success() =>
      (locations) => locations?.signIn_usecase_secretReset_success;
}
