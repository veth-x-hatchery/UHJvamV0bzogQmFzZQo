part of 'sign_in_register_bloc.dart';

@freezed
class SignInRegisterEvent with _$SignInRegisterEvent {
  const factory SignInRegisterEvent.credentialChanged(String credentialStr) =
      CredentialChanged;
  const factory SignInRegisterEvent.secretChanged(String secretStr) =
      PasswordChanged;
  const factory SignInRegisterEvent.registerWithCredentialAndPasswordPressed() =
      RegisterWithCredentialAndPasswordPressed;
}
