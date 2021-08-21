part of 'sign_in_options_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.started() = _Started;

  const factory SignInEvent.signInWithEmailEvent({
    required EmailAddress credential,
    required Password password,
  }) = SignInWithEmailEvent;

  const factory SignInEvent.signInWithGoogleEvent() = SignInWithGoogleEvent;
}
