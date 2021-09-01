import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
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
      message: null, //_unavailable(),
    );
  }

  //MessageFromLocations _unavailable() =>
  //    (locations) => locations?.signIn_usecase_credentialCheck_unavailable;
//
  //MessageFromLocations _credentialAlreadyRegistered() => (locations) =>
  //    locations?.signIn_usecase_credentialCheck_credentialAlreadyRegistered;
}

class CheckCredentialErrorMessages {
  static const unavailable = 'Unavailable';
  static const credentialAlreadyRegistered = 'Credential already registered';
}
