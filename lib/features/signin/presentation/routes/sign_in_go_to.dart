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

  SignInPageGoTo({
    required this.from,
    required this.to,
    this.parameters,
  });

  @override
  String toString() =>
      'from: $from -> to: $to ${parameters != null ? 'with $parameters' : ''}';
}
