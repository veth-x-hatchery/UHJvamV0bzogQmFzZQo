part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInWithGoogleEvent extends SignInEvent {}

class SignInWithFacebookEvent extends SignInEvent {}

class SignInWithEmailEvent extends SignInEvent {
  final String email;
  const SignInWithEmailEvent({
    required this.email,
  });
  @override
  List<Object> get props => [email];
}

class SignInRegisterEvent extends SignInEvent {
  final String email;
  final String password;
  const SignInRegisterEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class ForgotPasswordEvent extends SignInEvent {
  final String email;
  const ForgotPasswordEvent({
    required this.email,
  });
  @override
  List<Object> get props => [email];
}

class ChangeTheGivenEmailEvent extends SignInEvent {}

/**
 * 1 - Sign In With Google
 * 2 - Sign In With Facebook
 * 3 - Sign In With Email
 * 4 - Sign In Anonymounsly
 * 5 - Forgot my password
 * 6 - Change the given email
 */