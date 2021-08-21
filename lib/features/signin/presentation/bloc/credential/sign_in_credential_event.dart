part of 'sign_in_credential_bloc.dart';

@freezed
class SignInEmailEvent with _$SignInEmailEvent {
  const factory SignInEmailEvent.credentialChanged(String credentialStr) =
      EmailChanged;
  const factory SignInEmailEvent.analyseEmailPressed() = AnalyseEmailPressed;
}
