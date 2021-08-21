part of 'sign_in_secret_bloc.dart';

@freezed
class SignInPasswordEvent with _$SignInPasswordEvent {
  const factory SignInPasswordEvent.secretChanged(String secretStr) =
      PasswordChanged;
  const factory SignInPasswordEvent.analysePasswordPressed() =
      AnalysePasswordPressed;
}
