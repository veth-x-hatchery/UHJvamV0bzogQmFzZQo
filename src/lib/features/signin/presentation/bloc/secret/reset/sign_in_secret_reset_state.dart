part of 'sign_in_secret_reset_bloc.dart';

@freezed
class SignInSecretResetState with _$SignInSecretResetState {
  const factory SignInSecretResetState({
    required bool isLoading,
    required Option<VethxNotification> notification,
  }) = _SignInSecretResetState;
  factory SignInSecretResetState.initial() => SignInSecretResetState(
        isLoading: false,
        notification: none(),
      );
}
