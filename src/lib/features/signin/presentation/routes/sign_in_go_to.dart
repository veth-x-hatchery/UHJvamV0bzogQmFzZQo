import 'package:flutter/material.dart';
import 'package:hatchery/features/signin/domain/entities/value_objects.dart';

enum SignInPageRoutes {
  alpha,
  signInOptions,
  credentialEntry,
  secretEntry,
  registerCredentialSignIn,
}

@immutable
class SignInPageGoTo {
  final SignInPageRoutes from;
  final SignInPageRoutes to;
  final Object? parameters;

  const SignInPageGoTo._internal({
    required this.from,
    required this.to,
    this.parameters,
  });

  factory SignInPageGoTo.optionsPage() => const SignInPageGoTo._internal(
        to: SignInPageRoutes.signInOptions,
        from: SignInPageRoutes.signInOptions,
      );

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
    Credential? credential,
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
