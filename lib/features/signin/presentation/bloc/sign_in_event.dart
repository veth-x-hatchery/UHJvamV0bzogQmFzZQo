part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInWithGoogleEvent extends SignInEvent {}

class SignInWithFacebookEvent extends SignInEvent {}

class SignInAnonimously extends SignInEvent {}

class SignInCheckEmailEvent extends SignInEvent {
  final EmailAddress email;
  final SignInPageRoutes fromPage;

  const SignInCheckEmailEvent({
    required this.fromPage,
    required this.email,
  });
  @override
  List<Object> get props => [email];
}

class SignInWithEmailEvent extends SignInEvent {
  final EmailAddress email;
  final Password password;
  const SignInWithEmailEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

class SignInEmailRegisterEvent extends SignInEvent {
  final EmailAddress email;
  final Password password;
  const SignInEmailRegisterEvent({
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
