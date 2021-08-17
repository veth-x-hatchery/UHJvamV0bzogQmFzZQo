part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.started() = _Started;

  const factory SignInEvent.checkEmailEvent({
    required EmailAddress email,
    required SignInPageRoutes fromPage,
  }) = CheckEmailEvent;

  const factory SignInEvent.emailRegisterEvent({
    required EmailAddress email,
    required Password password,
  }) = EmailRegisterEvent;

  const factory SignInEvent.signInWithEmailEvent({
    required EmailAddress email,
    required Password password,
  }) = SignInWithEmailEvent;

  const factory SignInEvent.signInWithGoogleEvent() = SignInWithGoogleEvent;
}
