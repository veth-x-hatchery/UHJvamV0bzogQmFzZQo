import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

part 'sign_in_register_email_and_password.freezed.dart';

class SignInRegisterEmailAndPassword extends UseCase<Unit, Params> {
  // final ISignInRepository _signInRepository;
  final IAuthFacade _authFacade;

  SignInRegisterEmailAndPassword(
    // this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<FailureDetails, Unit>> call(Params params) {
    return _authFacade
        .registerWithEmailAndPassword(
          emailAddress: params.credentials.user,
          password: params.credentials.password,
        )
        .then((value) => value.fold(
              (l) => left(_mapFailures(l)),
              (r) => right(unit),
            ));
  }

  FailureDetails _mapFailures(AuthFailure auth) {
    if (auth == const AuthFailure.emailAlreadyInUse()) {
      return FailureDetails(
        failure: auth,
        message: SignInRegisterEmailAndPasswordErrorMessages.emailAlreadyInUse,
      );
    }
    return FailureDetails(
      failure: auth,
      message: SignInRegisterEmailAndPasswordErrorMessages.unavailable,
    );
  }
}

class SignInRegisterEmailAndPasswordErrorMessages {
  static const unavailable = 'Unavailable';
  static const emailAlreadyInUse = 'This email is already in use';
}

@freezed
class Params with _$Params {
  const factory Params({
    required Credentials credentials,
  }) = _Params;
}
