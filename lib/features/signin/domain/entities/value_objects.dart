import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/core/value_validators.dart';

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

  String? get inputedValue => value.fold(
        (l) => l.failedValue,
        (r) => r,
      );

  const Credential._(this.value);
}

class SecretMessageErrors {
  static const empty = 'Inform your password';
  static const shortSecret = 'Your password must be more than 6 chars';
}

class Secret extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Secret(String? input) {
    return Secret._(
      validateStringNullOrEmpty(input).flatMap(validateSecret),
    );
  }

  String? get validation => value.fold(
        (f) => f.maybeMap(
          empty: (_) => SecretMessageErrors.empty,
          shortSecret: (_) => SecretMessageErrors.shortSecret,
          orElse: () => null,
        ),
        (_) => null,
      );

  const Secret._(this.value);
}
