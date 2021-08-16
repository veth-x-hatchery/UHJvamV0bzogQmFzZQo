part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInWithGoogleEvent extends SignInEvent {}

class SignInWithFacebookEvent extends SignInEvent {}

class SignInAnonimously extends SignInEvent {}

class SignInCheckEmail extends SignInEvent {
  final EmailAddress email;
  final SignInPageRoutes fromPage;

  const SignInCheckEmail({
    required this.fromPage,
    required this.email,
  });
  @override
  List<Object> get props => [email];
}

class SignInWithEmail extends SignInEvent {
  final EmailAddress email;
  final Password password;
  const SignInWithEmail({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

class SignInEmailRegister extends SignInEvent {
  final EmailAddress email;
  final Password password;
  const SignInEmailRegister({
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

class ChangeTheGivenEmail extends SignInEvent {}
