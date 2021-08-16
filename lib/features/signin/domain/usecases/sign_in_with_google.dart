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
  Future<Either<FailureDetails, Unit>> call(NoParams params) {
    return _authFacade.signInWithGoogle().then((value) => value.fold(
          (l) => left(FailureDetails(failure: l, message: '')),
          (r) => right(unit),
        ));
  }
}
