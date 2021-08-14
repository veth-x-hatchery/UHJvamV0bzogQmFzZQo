part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInWithGoogle extends SignInEvent {}

class SignInWithFacebook extends SignInEvent {}

class SignInWithEmail extends SignInEvent {
  final String email;
  const SignInWithEmail({
    required this.email,
  });
  @override
  List<Object> get props => [email];
}

class SignInRegister extends SignInEvent {
  final String email;
  final String password;
  const SignInRegister({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class ForgotPassword extends SignInEvent {
  final String email;
  const ForgotPassword({
    required this.email,
  });
  @override
  List<Object> get props => [email];
}

class ChangeTheGivenEmail extends SignInEvent {}

/**
 * 1 - Sign In With Google
 * 2 - Sign In With Facebook
 * 3 - Sign In With Email
 * 4 - Sign In Anonymounsly
 * 5 - Forgot my password
 * 6 - Change the given email
 */