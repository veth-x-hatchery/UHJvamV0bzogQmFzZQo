import 'package:dartz/dartz.dart';

import 'package:hatchery/core/shared_kernel/shared_kernel.dart';
import 'package:hatchery/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:hatchery/features/signin/domain/services/auth_failure.dart';
import 'package:hatchery/features/signin/domain/services/i_auth.service.dart';
import 'package:hatchery/l10n/l10n.dart';

class SignInSecretReset extends UseCase<Unit, NoParams> {
  final ISignInRepository _signInRepository;
  final IAuthService _authService;

  SignInSecretReset(
    this._signInRepository,
    this._authService,
  );

  @override
  Future<Either<FailureDetails<AuthFailure>, Unit>> call(
      NoParams params) async {
    final cachedCredential = await _signInRepository.cachedCredential();
    return cachedCredential.fold(
      (l) => left(_mapFailures(const AuthFailure.invalidCachedCredential())),
      (credential) {
        return _authService.passwordReset(credential).then(
              (value) => value.fold(
                (l) => left(_mapFailures(l)),
                (r) async {
                  await _signInRepository.skipNextLocalAuthenticationRequest();
                  return right(unit);
                },
              ),
            );
      },
    );
  }

  FailureDetails<AuthFailure> _mapFailures(AuthFailure auth) {
    if (auth == const AuthFailure.invalidCachedCredential()) {
      return FailureDetails(
        failure: auth,
        message: SignInSecretResetMessages.invalidCachedCredential(),
      );
    }
    return FailureDetails(
      failure: auth,
      message: SignInSecretResetMessages.unavailable(),
    );
  }
}

// ignore: avoid_classes_with_only_static_members
class SignInSecretResetMessages {
  static MessageFromLocalizations unavailable() => (appLocalizations) =>
      appLocalizations?.signIn_usecase_secretReset_unavailable ??
      'signIn_usecase_secretReset_unavailable';
  static MessageFromLocalizations
      invalidCachedCredential() => (appLocalizations) =>
          appLocalizations
              ?.signIn_usecase_secretReset_invalidCachedCredential ??
          'signIn_usecase_secretReset_invalidCachedCredential';
  static MessageFromLocalizations success() => (appLocalizations) =>
      appLocalizations?.signIn_usecase_secretReset_success ??
      'signIn_usecase_secretReset_success';
}
