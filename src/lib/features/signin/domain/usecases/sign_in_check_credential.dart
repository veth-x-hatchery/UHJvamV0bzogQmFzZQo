import 'package:dartz/dartz.dart';

import 'package:hatchery/core/shared_kernel/shared_kernel.dart';
import 'package:hatchery/features/signin/domain/entities/value_objects.dart';
import 'package:hatchery/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:hatchery/features/signin/domain/services/auth_failure.dart';
import 'package:hatchery/features/signin/domain/services/i_auth.service.dart';
import 'package:hatchery/l10n/l10n.dart';

class SignInCredentialCheck extends UseCase<bool, Credential> {
  final ISignInRepository _signInRepository;

  final IAuthService _authService;

  SignInCredentialCheck(
    this._signInRepository,
    this._authService,
  );

  @override
  Future<Either<FailureDetails<AuthFailure>, bool>> call(
          Credential credential) =>
      _authService.credentialIsAlreadyInUse(credential).then(
            (value) => value.fold(
              (l) => left(_mapFailures(l)),
              (r) {
                _signInRepository.cacheCredential(credential);
                return right(r);
              },
            ),
          );

  FailureDetails<AuthFailure> _mapFailures(AuthFailure auth) {
    return FailureDetails(
      failure: auth,
      message: CheckCredentialErrorMessages.unavailable(),
    );
  }
}

// ignore: avoid_classes_with_only_static_members
class CheckCredentialErrorMessages {
  static MessageFromLocalizations unavailable() => (appLocalizations) =>
      appLocalizations?.signIn_usecase_credentialCheck_unavailable ??
      'signIn_usecase_credentialCheck_unavailable';

  static MessageFromLocalizations credentialAlreadyRegistered() =>
      (appLocalizations) =>
          appLocalizations
              ?.signIn_usecase_credentialCheck_credentialAlreadyRegistered ??
          'signIn_usecase_credentialCheck_credentialAlreadyRegistered';
}
