import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

part 'sign_in_with_credential_and_secret.freezed.dart';

class SignInWithCredentialAndSecret extends UseCase<Unit, Params> {
  // final ISignInRepository _signInRepository;
  final IAuthFacade _authFacade;

  SignInWithCredentialAndSecret(
    // this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<FailureDetails, Unit>> call(Params params) {
    return _authFacade
        .signInWithCredentialAndSecret(
          credentialAddress: params.credentials.user,
          secret: params.credentials.secret,
        )
        .then((value) => value.fold(
              (l) => left(_mapFailures(l)),
              (r) => right(unit),
            ));
  }

  FailureDetails _mapFailures(AuthFailure auth) {
    if (auth == const AuthFailure.invalidCredentialAndSecretCombination()) {
      return FailureDetails(
        failure: auth,
        message: SignInWithCredentialAndSecretErrorMessages
            .invalidCredentialAndSecretCombination,
      );
    }
    return FailureDetails(
      failure: auth,
      message: SignInWithCredentialAndSecretErrorMessages.unavailable,
    );
  }
}

class SignInWithCredentialAndSecretErrorMessages {
  static const unavailable = 'Unavailable';
  static const invalidCredentialAndSecretCombination =
      'Invalid credential and secret combination';
}

@freezed
class Params with _$Params {
  const factory Params({
    required Credentials credentials,
  }) = _Params;
}
