enum SignInPageRoutes {
  alpha,
  signInOptions,
  credentialEntry,
  secretEntry,
  registerCredentialSignIn,
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

  // factory SignInPageGoTo.alpha({required SignInPageRoutes from}) =>
  //     SignInPageGoTo._internal(
  //       to: SignInPageRoutes.alpha,
  //       from: from,
  //     );

  factory SignInPageGoTo.secretPage({
    required SignInPageRoutes from,
    String? credential,
  }) =>
      SignInPageGoTo._internal(
        to: SignInPageRoutes.secretEntry,
        from: from,
        parameters: credential,
      );

  factory SignInPageGoTo.registerPage({
    required SignInPageRoutes from,
    String? credential,
  }) =>
      SignInPageGoTo._internal(
        to: SignInPageRoutes.registerCredentialSignIn,
        from: from,
        parameters: credential,
      );

  factory SignInPageGoTo.credentialPage({required SignInPageRoutes from}) =>
      SignInPageGoTo._internal(
        from: from,
        to: SignInPageRoutes.credentialEntry,
      );

  @override
  String toString() =>
      'from: $from -> to: $to ${parameters != null ? 'with $parameters' : ''}';
}
