import 'package:dartz/dartz.dart';
import 'package:hatchery/core/shared_kernel/shared_kernel.dart';

import 'package:hatchery/l10n/l10n.dart';

/// Todo(v): Remove duplicated code between [Credential] and [Secret]

class Credential extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Credential(String? input) {
    return Credential._(
      validateStringNullOrEmpty(input).flatMap(validateCredentialAddress),
    );
  }

  const Credential._(this.value);

  MessageFromLocalizations _emptyCredentialMessage() => (appLocalizations) =>
      appLocalizations?.signIn_valueObject_credentialEmpty ??
      'signIn_valueObject_credentialEmpty';

  MessageFromLocalizations _invalidCredentialMessage() => (appLocalizations) =>
      appLocalizations?.signIn_valueObject_credentialInvalid ??
      'signIn_valueObject_credentialInvalid';

  MessageFromLocalizations _orElseMessage() => (appLocalizations) =>
      appLocalizations?.comum_error_troubleFriendlyMessage ??
      'comum_error_troubleFriendlyMessage';

  MessageFromLocalizations _failureReason() => value.fold(
        (f) => f.maybeMap(
          empty: (_) => _emptyCredentialMessage(),
          invalidCredential: (_) => _invalidCredentialMessage(),
          orElse: () => _orElseMessage(),
        ),
        (_) => (_) => null,
      );

  /// When receives NULL as parameter, if there is some [ValueFailure],
  /// will returns the AppLocalizations json property name.
  /// It will be enough to unit tests.
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

  MessageFromLocalizations emptySecretMessage() => (appLocalizations) =>
      appLocalizations?.signIn_valueObject_secretEmpty ??
      'signIn_valueObject_secretEmpty';

  MessageFromLocalizations shortSecretMessage() => (appLocalizations) =>
      appLocalizations?.signIn_valueObject_secretShort ??
      'signIn_valueObject_secretShort';

  MessageFromLocalizations _orElseMessage() => (appLocalizations) =>
      appLocalizations?.comum_error_troubleFriendlyMessage ??
      'comum_error_troubleFriendlyMessage';

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
