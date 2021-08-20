part of 'sign_in_password_bloc.dart';

@freezed
class SignInPasswordEvent with _$SignInPasswordEvent {
  const factory SignInPasswordEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory SignInPasswordEvent.analysePasswordPressed() =
      AnalysePasswordPressed;
}
