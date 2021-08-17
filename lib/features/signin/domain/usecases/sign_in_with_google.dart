import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

class SignInWithGoogle extends UseCase<Unit, NoParams> {
  final ISignInRepository _signInRepository;
  final IAuthFacade _authFacade;

  SignInWithGoogle(
    this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<FailureDetails, Unit>> call(NoParams params) =>
      _authFacade.signInWithGoogle().then((result) => result.fold(
            (l) => left(_mapFailures(l)),
            (r) => right(unit),
          ));

  FailureDetails _mapFailures(AuthFailure auth) {
    if (auth == const AuthFailure.cancelledByUser()) {
      return FailureDetails(
        failure: auth,
        message: SignInWithGoogleErrorMessages.cancelledByUser,
      );
    }
    return FailureDetails(
      failure: auth,
      message: SignInWithGoogleErrorMessages.unknowError,
    );
  }
}

class SignInWithGoogleErrorMessages {
  static const unknowError = 'Unavailable';
  static const cancelledByUser = 'Cancelled by user';
}
