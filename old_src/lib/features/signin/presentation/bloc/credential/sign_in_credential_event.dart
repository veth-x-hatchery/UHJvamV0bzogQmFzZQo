part of 'sign_in_credential_bloc.dart';

@freezed
class SignInCredentialEvent with _$SignInCredentialEvent {
  const factory SignInCredentialEvent.credentialChanged(String credentialStr) =
      CredentialChanged;
  const factory SignInCredentialEvent.analyseCredentialPressed() =
      AnalyseCredentialPressed;
}
