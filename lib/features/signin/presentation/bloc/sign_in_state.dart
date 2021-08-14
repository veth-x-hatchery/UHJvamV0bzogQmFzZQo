part of 'sign_in_bloc.dart';

/// [SignInWithGoogleEvent]
///
/// [SignInWithFacebookEvent]
/// - [SignInAllowed]
/// - [SignInDenied]
/// - [SignInCancelled]
/// - [SignInError]
///
/// [SignInCheckEmail]
/// - [EmailNotRegistered]
/// - [EmailAlreadyRegistered]
/// - [EmailNotFound]
/// - [SignInError]
///
/// [SignInWithEmail]
///
/// [SignInAnonimously]
/// - [SignInAllowed]
/// - [SignInDenied]
/// - [SignInError]
///
/// [SignInEmailRegister]
/// - [EmailAlreadyRegistered]
/// - [SignInError]
///
/// [ForgotPasswordEvent]
/// - [SignInEmailWithResetPasswordInstructionsSent]
/// - [SignInError]
///
/// [ChangeTheGivenEmail]
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
  final String? message;
  const SignInError({this.message = UseCasesDefaultMessages.error});
  @override
  List<Object> get props => [message!];
}

class SignInEmailWithResetPasswordInstructionsSent extends SignInState {}

class SignInGivenEmailChanged extends SignInState {}

class EmailAlreadyRegistered extends SignInState {
  final bool result;
  const EmailAlreadyRegistered(this.result);
  @override
  List<Object> get props => [result];
}

class EmailNotFound extends SignInState {}

class UseCasesDefaultMessages {
  static const String error = 'Sorry';
}
