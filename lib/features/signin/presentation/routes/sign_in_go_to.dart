enum SignInPageRoutes {
  signInOptions,
  emailEntry,
  passwordEntry,
  registerEmailSignIn,
}

class SignInPageGoTo {
  final SignInPageRoutes from;
  final SignInPageRoutes to;
  final Object? parameters;

  SignInPageGoTo._internal({
    required this.from,
    required this.to,
    this.parameters,
  });

  factory SignInPageGoTo.passwordPage({
    required SignInPageRoutes from,
    String? email,
  }) =>
      SignInPageGoTo._internal(
        to: SignInPageRoutes.passwordEntry,
        from: from,
        parameters: email,
      );

  factory SignInPageGoTo.registerPage({
    required SignInPageRoutes from,
    String? email,
  }) =>
      SignInPageGoTo._internal(
        to: SignInPageRoutes.registerEmailSignIn,
        from: from,
        parameters: email,
      );

  factory SignInPageGoTo.emailPage({required SignInPageRoutes from}) =>
      SignInPageGoTo._internal(
        from: from,
        to: SignInPageRoutes.emailEntry,
      );

  factory SignInPageGoTo.signInOptions({required SignInPageRoutes from}) =>
      SignInPageGoTo._internal(
        from: from,
        to: SignInPageRoutes.signInOptions,
      );

  @override
  String toString() =>
      'from: $from -> to: $to ${parameters != null ? 'with $parameters' : ''}';
}
