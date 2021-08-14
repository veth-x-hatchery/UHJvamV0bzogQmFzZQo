part of 'sign_in_bloc.dart';

/// [SignInWithGoogleEvent]
///
/// [SignInWithFacebookEvent]
/// - [SignInAllowed]
/// - [SignInDenied]
/// - [SignInCancelled]
/// - [SignInError]
///
/// [SignInVerifyEmail]
/// - [EmailAlreadyRegistered]
/// - [EmailNotFound]
/// - [SignInError]
///
/// [SignInWithEmailEvent]
///
/// [SignInAnonimously]
/// - [SignInAllowed]
/// - [SignInDenied]
/// - [SignInError]
///
/// [SignInEmailRegisterEvent]
/// - [EmailAlreadyRegistered]
/// - [SignInError]
///
/// [ForgotPasswordEvent]
/// - [SignInEmailWithResetPasswordInstructionsSent]
/// - [SignInError]
///
/// [ChangeTheGivenEmailEvent]
/// - [SignInGivenEmailChanged]
/// - [SignInError]

abstract class SignInState extends Equatable {
  const SignInState();
  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

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

class EmailAlreadyRegistered extends SignInState {}

class EmailNotFound extends SignInState {}
