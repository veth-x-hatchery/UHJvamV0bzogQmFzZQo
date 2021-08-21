part of 'sign_in_options_bloc.dart';

@freezed
class SignInOptionsEvent with _$SignInOptionsEvent {
  const factory SignInOptionsEvent.signInWithCredentialEvent() =
      SignInWithCredentialEvent;
  const factory SignInOptionsEvent.signInWithGoogleEvent() =
      SignInWithGoogleEvent;
}
