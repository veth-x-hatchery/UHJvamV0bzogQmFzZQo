part of 'sign_in_secret_reset_bloc.dart';

@freezed
class SignInPasswordResetEvent with _$SignInPasswordResetEvent {
  const factory SignInPasswordResetEvent.resetPasswordRequest() =
      ResetPasswordRequest;
}
