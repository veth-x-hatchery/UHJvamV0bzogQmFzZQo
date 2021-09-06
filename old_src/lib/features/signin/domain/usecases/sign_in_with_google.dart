import 'package:dartz/dartz.dart';

import 'package:vethx_beta/core/shared_kernel/shared_kernel.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
// import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/l10n/l10n.dart';

class SignInWithGoogle extends UseCase<Unit, NoParams> {
  final IAuthFacade _authFacade;
  final ISignInRepository _signInRepository;

  SignInWithGoogle(
    this._authFacade,
    this._signInRepository,
  );

  @override
  Future<Either<FailureDetails<AuthFailure>, Unit>> call(NoParams params) =>
      _authFacade.signInWithGoogle().then((result) => result.fold(
            (l) => left(_mapFailures(l)),
            (r) async {
              await _signInRepository.skipNextLocalAuthenticationRequest();
              return right(unit);
            },
          ));

  FailureDetails<AuthFailure> _mapFailures(AuthFailure auth) {
    if (auth == const AuthFailure.cancelledByUser()) {
      return FailureDetails(
        failure: auth,
        message: SignInWithGoogleErrorMessages.cancelledByUser(),
      );
    }
    return FailureDetails(
      failure: auth,
      message: SignInWithGoogleErrorMessages.unknowError(),
    );
  }
}

// ignore: avoid_classes_with_only_static_members
class SignInWithGoogleErrorMessages {
  static MessageFromLocalizations unknowError() => (appLocalizations) =>
      appLocalizations?.signIn_usecase_withGoogle_unknowError ??
      'signIn_usecase_withGoogle_unknowError';
  static MessageFromLocalizations cancelledByUser() => (appLocalizations) =>
      appLocalizations?.signIn_usecase_withGoogle_cancelledByUser ??
      'signIn_usecase_withGoogle_cancelledByUser';
}
