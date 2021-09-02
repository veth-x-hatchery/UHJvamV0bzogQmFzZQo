import 'package:dartz/dartz.dart';

import 'package:vethx_beta/core/shared_kernel/shared_kernel.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/l10n/l10n.dart';

class SignInCredentialCheck extends UseCase<bool, Credential> {
  final ISignInRepository _signInRepository;

  final IAuthFacade _authFacade;

  SignInCredentialCheck(
    this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<FailureDetails, bool>> call(Credential credential) =>
      _authFacade.credentialIsAlreadyInUse(credential).then(
            (value) => value.fold(
              (l) => left(_mapFailures(l)),
              (r) {
                _signInRepository.cacheCredential(credential);
                return right(r);
              },
            ),
          );

  FailureDetails _mapFailures(AuthFailure auth) {
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
