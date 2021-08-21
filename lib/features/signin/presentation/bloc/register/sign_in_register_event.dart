part of 'sign_in_register_bloc.dart';

@freezed
class SignInRegisterEvent with _$SignInRegisterEvent {
  const factory SignInRegisterEvent.credentialChanged(String credentialStr) =
      EmailChanged;
  const factory SignInRegisterEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory SignInRegisterEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
}
