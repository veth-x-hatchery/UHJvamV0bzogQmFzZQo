part of 'sign_in_options_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.started() = _Started;

  const factory SignInEvent.signInWithCredentialEvent({
    required CredentialAddress credential,
    required Secret secret,
  }) = SignInWithCredentialEvent;

  const factory SignInEvent.signInWithGoogleEvent() = SignInWithGoogleEvent;
}
