part of 'sign_in_register_bloc.dart';

@freezed
class SignInRegisterEvent with _$SignInRegisterEvent {
  const factory SignInRegisterEvent.emailChanged(String emailStr) =
      EmailChanged;
  const factory SignInRegisterEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory SignInRegisterEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
}
