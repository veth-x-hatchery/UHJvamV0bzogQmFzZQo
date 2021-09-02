part of 'sign_in_options_bloc.dart';

@freezed
class SignInOptionsState with _$SignInOptionsState {
  const factory SignInOptionsState.initial() = _Initial;
  const factory SignInOptionsState.loading() = _SignInLoading;
  const factory SignInOptionsState.signInAllowed() = _SignInAllowed;
  const factory SignInOptionsState.signInDenied() = _SignInDenied;
  const factory SignInOptionsState.signInCancelled() = _SignInCancelled;
  const factory SignInOptionsState.signInNotification(
      {required dynamic message}) = _SignInNotification;
}
