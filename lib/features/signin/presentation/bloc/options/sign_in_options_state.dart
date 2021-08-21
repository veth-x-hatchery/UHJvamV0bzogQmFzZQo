part of 'sign_in_options_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = _SignInLoading;
  const factory SignInState.signInAllowed() = _SignInAllowed;
  const factory SignInState.signInDenied() = _SignInDenied;
  const factory SignInState.signInCancelled() = _SignInCancelled;
  const factory SignInState.signInNotification({required String message}) =
      _SignInNotification;
  const factory SignInState.credentialAlreadyRegistered() =
      _CredentialAlreadyRegistered;
  const factory SignInState.credentialNotFound() = _CredentialNotFound;
}
