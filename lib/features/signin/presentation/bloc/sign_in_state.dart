part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();
  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInAllowed extends SignInState {}

class SignInDenied extends SignInState {}

class SignInCancelled extends SignInState {}

class SignInError extends SignInState {
  final String message;
  const SignInError({required this.message});
  @override
  List<Object> get props => [message];
}

class SignInEmailWithResetPasswordInstructionsSent extends SignInState {}

class SignInGivenEmailChanged extends SignInState {}

/**
 * Event -> Sign In With Google
 * Event -> Sign In With Facebook
 *       State -> Allowed
 *       State -> Denied
 *       State -> Cancelled
 *       State -> Error

 * Event -> Sign In With Email
 * Event -> Sign In Anonymounsly
 *       State -> Allowed
 *       State -> Denied
 *       State -> Error

 * Event -> Forgot my password
 *       State -> EmailWithResetPasswordInstructionsSent
 *       State -> Error
 * Event -> Change the given email
 *       State -> GivenEmailChanged
 *       State -> Error
 */