import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/core/value_validators.dart';
import 'package:vethx_beta/l10n/l10n.dart';

class CredentialAddressMessageErrors {
  static const empty = 'Inform your email';
  static const invalidCredential = 'Inform a valid email';
}

class Credential extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Credential(String? input) {
    return Credential._(
      validateStringNullOrEmpty(input).flatMap(validateCredentialAddress),
    );
  }

  String? get validation => value.fold(
        (f) => f.maybeMap(
          empty: (_) => CredentialAddressMessageErrors.empty,
          invalidCredential: (_) =>
              CredentialAddressMessageErrors.invalidCredential,
          orElse: () => null,
        ),
        (_) => null,
      );

  const Credential._(this.value);
}

class SecretMessageErrors {
  static const empty = 'Inform your password';
  static const shortSecret = 'Your password must be more than 6 chars';
}

typedef MessageFromLocations = String? Function(AppLocalizations? _);

class Secret extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Secret(String? input) {
    return Secret._(
      validateStringNullOrEmpty(input).flatMap(validateSecret),
    );
  }

  const Secret._(this.value);

  MessageFromLocations _emptyMessage() =>
      (locations) => locations?.signInValueObjectSecretEmpty;

  MessageFromLocations _shortSecretMessage() =>
      (locations) => locations?.signInValueObjectSecretShort;

  MessageFromLocations _orElseMessage() =>
      (locations) => locations?.error_errorTroubleFriendlyMessage;

  MessageFromLocations validation() => value.fold(
        (f) => f.maybeMap(
          empty: (_) => _emptyMessage(),
          shortSecret: (_) => _shortSecretMessage(),
          orElse: () => _orElseMessage(),
        ),
        (_) => (_) => null,
      );
}
