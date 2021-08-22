part of 'sign_in_secret_reset_bloc.dart';

@freezed
class SignInSecretResetEvent with _$SignInSecretResetEvent {
  const factory SignInSecretResetEvent.resetPasswordRequest() =
      ResetPasswordRequest;
}
