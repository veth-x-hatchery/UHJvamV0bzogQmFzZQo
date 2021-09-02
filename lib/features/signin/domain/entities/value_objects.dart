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

  MessageFromLocalizations _emptyCredentialMessage() => (locations) =>
      locations?.signIn_valueObject_credentialEmpty ??
      'signIn_valueObject_credentialEmpty';

  MessageFromLocalizations _invalidCredentialMessage() => (locations) =>
      locations?.signIn_valueObject_credentialInvalid ??
      'signIn_valueObject_credentialInvalid';

  MessageFromLocalizations _orElseMessage() => (locations) =>
      locations?.comum_error_troubleFriendlyMessage ??
      'comum_error_troubleFriendlyMessage';

  MessageFromLocalizations _failureReason() => value.fold(
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

  MessageFromLocalizations emptySecretMessage() =>
      (locations) => locations?.signIn_valueObject_secretEmpty;

  MessageFromLocalizations shortSecretMessage() =>
      (locations) => locations?.signIn_valueObject_secretShort;

  MessageFromLocalizations _orElseMessage() =>
      (locations) => locations?.comum_error_troubleFriendlyMessage;

  MessageFromLocalizations failureReason() => value.fold(
        (f) => f.maybeMap(
          empty: (_) => emptySecretMessage(),
          shortSecret: (_) => shortSecretMessage(),
          orElse: () => _orElseMessage(),
        ),
        (_) => (_) => null,
      );

  String? validation(AppLocalizations? _) => failureReason().call(_);
}
