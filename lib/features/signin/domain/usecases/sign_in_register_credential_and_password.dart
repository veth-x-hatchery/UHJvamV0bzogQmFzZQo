import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

part 'sign_in_register_credential_and_password.freezed.dart';

class SignInRegisterCredentialAndPassword extends UseCase<Unit, Params> {
  // final ISignInRepository _signInRepository;
  final IAuthFacade _authFacade;

  SignInRegisterCredentialAndPassword(
    // this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<FailureDetails, Unit>> call(Params params) {
    return _authFacade
        .registerWithCredentialAndPassword(
          credentialAddress: params.credentials.user,
          password: params.credentials.password,
        )
        .then((value) => value.fold(
              (l) => left(_mapFailures(l)),
              (r) => right(unit),
            ));
  }

  FailureDetails _mapFailures(AuthFailure auth) {
    if (auth == const AuthFailure.credentialAlreadyInUse()) {
      return FailureDetails(
        failure: auth,
        message: SignInRegisterCredentialAndPasswordErrorMessages
            .credentialAlreadyInUse,
      );
    }
    if (auth == const AuthFailure.invalidCredentialAndPasswordCombination()) {
      return FailureDetails(
        failure: auth,
        message: SignInRegisterCredentialAndPasswordErrorMessages
            .credentialAlreadyInUse,
      );
    }
    return FailureDetails(
      failure: auth,
      message: SignInRegisterCredentialAndPasswordErrorMessages.unavailable,
    );
  }
}

class SignInRegisterCredentialAndPasswordErrorMessages {
  static const unavailable = 'Unavailable';
  static const credentialAlreadyInUse = 'This credential is already in use';
  static const invalidCredentialAndPasswordCombination =
      'Invalid credential and password combination';
}

@freezed
class Params with _$Params {
  const factory Params({
    required Credentials credentials,
  }) = _Params;
}
