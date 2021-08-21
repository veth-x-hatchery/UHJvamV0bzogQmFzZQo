import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';

part 'sign_in_check_email.freezed.dart';

class SignInCheckIfEmailIsInUse extends UseCase<bool, Params> {
  // final ISignInRepository _signInRepository;

  final IAuthFacade _authFacade;

  SignInCheckIfEmailIsInUse(
    // this._signInRepository,
    this._authFacade,
  );

  @override
  Future<Either<FailureDetails, bool>> call(Params params) =>
      _authFacade.emailIsAlreadyInUse(params.email).then(
            (value) => value.fold(
              (l) => left(_mapFailures(l)),
              (r) => right(r),
            ),
          );

  FailureDetails _mapFailures(AuthFailure auth) {
    return FailureDetails(
      failure: auth,
      message: CheckEmailErrorMessages.unavailable,
    );
  }
}

@freezed
class Params with _$Params {
  const factory Params({
    required EmailAddress email,
  }) = _Params;
}

class CheckEmailErrorMessages {
  static const unavailable = 'Unavailable';
  static const emailAlreadyRegistered = 'Email already registered';
}
