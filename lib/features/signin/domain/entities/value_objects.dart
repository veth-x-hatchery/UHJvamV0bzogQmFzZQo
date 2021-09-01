import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/core/value_validators.dart';
import 'package:vethx_beta/l10n/l10n.dart';

class Credential extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Credential(String? input) {
    return Credential._(
      validateStringNullOrEmpty(input).flatMap(validateCredentialAddress),
    );
  }

  const Credential._(this.value);

  MessageFromLocations _emptyCredentialMessage() =>
      (locations) => locations?.signInValueObjectCredentialEmpty;

  MessageFromLocations _invalidCredentialMessage() =>
      (locations) => locations?.signInValueObjectCredentialInvalid;

  MessageFromLocations _orElseMessage() =>
      (locations) => locations?.error_errorTroubleFriendlyMessage;

  MessageFromLocations _failureReason() => value.fold(
        (f) => f.maybeMap(
          empty: (_) => _emptyCredentialMessage(),
          invalidCredential: (_) => _invalidCredentialMessage(),
          orElse: () => _orElseMessage(),
        ),
        (_) => (_) => null,
      );

  String? validation(AppLocalizations? _) => _failureReason().call(_);
}

class Secret extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Secret(String? input) {
    return Secret._(
      validateStringNullOrEmpty(input).flatMap(validateSecret),
    );
  }

  const Secret._(this.value);

  MessageFromLocations emptySecretMessage() =>
      (locations) => locations?.signInValueObjectSecretEmpty;

  MessageFromLocations shortSecretMessage() =>
      (locations) => locations?.signInValueObjectSecretShort;

  MessageFromLocations _orElseMessage() =>
      (locations) => locations?.error_errorTroubleFriendlyMessage;

  MessageFromLocations failureReason() => value.fold(
        (f) => f.maybeMap(
          empty: (_) => emptySecretMessage(),
          shortSecret: (_) => shortSecretMessage(),
          orElse: () => _orElseMessage(),
        ),
        (_) => (_) => null,
      );

  String? validation(AppLocalizations? _) => failureReason().call(_);
}
