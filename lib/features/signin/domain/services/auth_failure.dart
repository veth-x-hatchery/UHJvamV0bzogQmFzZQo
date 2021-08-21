import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

/// User "taps out" of the 3rd party sign-in flow (Google in our case)
/// There is an error on the auth server
/// User wants to register with an credential which is already in use
/// User enters an invalid combination of credential and password
@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.credentialAlreadyInUse() = CredentialAlreadyInUse;
  const factory AuthFailure.invalidCredentialAndPasswordCombination() =
      InvalidCredentialAndPasswordCombination;
}
