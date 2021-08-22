import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

class SignInResetPassword extends UseCase<Unit, NoParams> {
  final ISignInRepository _signInRepository;
  final IAuthFacade _authFacade;

  SignInResetPassword(
    this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<FailureDetails, Unit>> call(NoParams params) async {
    final cachedCredential = await _signInRepository.cachedCredential();
    return cachedCredential.fold(
      (l) => left(_mapFailures(const AuthFailure.invalidCachedCredential())),
      (credential) {
        return _authFacade.resetPassword(credential).then((value) => value.fold(
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
        message: SignInResetPasswordErrorMessages.invalidCachedCredential,
      );
    }
    return FailureDetails(
      failure: auth,
      message: SignInResetPasswordErrorMessages.unavailable,
    );
  }
}

class SignInResetPasswordErrorMessages {
  static const unavailable = 'Unavailable';
  static const invalidCachedCredential = 'Please confirm your email';
}
