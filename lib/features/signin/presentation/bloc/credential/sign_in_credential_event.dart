part of 'sign_in_email_bloc.dart';

@freezed
class SignInEmailEvent with _$SignInEmailEvent {
  const factory SignInEmailEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SignInEmailEvent.analyseEmailPressed() = AnalyseEmailPressed;
}
