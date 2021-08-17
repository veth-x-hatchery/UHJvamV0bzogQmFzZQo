part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.started() = _Started;
  const factory SignInEvent.checkEmailEvent() = SignInCheckEmailEvent;
  const factory SignInEvent.emailRegisterEvent() = SignInEmailRegisterEvent;
  const factory SignInEvent.signInWithEmailEvent() = SignInWithEmailEvent;
  const factory SignInEvent.signInWithGoogleEvent() = SignInWithGoogleEvent;
}
