part of 'sign_in_bloc.dart';

/// [SignInWithGoogleEvent]
///
/// [SignInWithFacebookEvent]
/// - [SignInAllowed]
/// - [SignInDenied]
/// - [SignInCancelled]
/// - [SignInNotification]
///
/// [SignInCheckEmailEvent]
/// - [EmailAlreadyRegistered]
/// - [EmailNotFound]
/// - [SignInNotification]
///
/// [SignInWithEmailEvent]
///
/// [SignInAnonimously]
/// - [SignInAllowed]
/// - [SignInDenied]
/// - [SignInNotification]
///
/// [SignInEmailRegisterEvent]
/// - [EmailAlreadyRegistered]
/// - [SignInNotification]
///
/// [ForgotPasswordEvent]
/// - [SignInEmailWithResetPasswordInstructionsSent]
/// - [SignInNotification]
///
/// [ChangeTheGivenEmailEvent]
/// - [SignInGivenEmailChanged]
/// - [SignInNotification]

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

class SignInNotification extends SignInState {
  final String message;
  const SignInNotification({this.message = UseCasesDefaultMessages.error});
  @override
  List<Object> get props => [message];
}

class SignInEmailWithResetPasswordInstructionsSent extends SignInState {}

class SignInGivenEmailChanged extends SignInState {}

class EmailAlreadyRegistered extends SignInState {}

class EmailNotFound extends SignInState {}

class UseCasesDefaultMessages {
  static const String error = 'Sorry';
}
