part of 'sign_in_secret_reset_bloc.dart';

@freezed
class SignInPasswordResetState with _$SignInPasswordResetState {
  const factory SignInPasswordResetState({
    required Option<VethxNotification> notification,
  }) = _SignInPasswordResetState;
  factory SignInPasswordResetState.initial() =>
      SignInPasswordResetState(notification: none());
}
