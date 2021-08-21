import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/core/value_validators.dart';

class PasswordMessageErrors {
  static const empty = 'Informe your password';
  static const shortPassword = 'Your password must be more than 6 chars';
}

class CredentialAddressMessageErrors {
  static const empty = 'Informe your password';
  static const invalidCredential = 'Invalid Credential';
}

class CredentialAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CredentialAddress(String? input) {
    return CredentialAddress._(
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

  const CredentialAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String? input) {
    return Password._(
      validateStringNullOrEmpty(input).flatMap(validatePassword),
    );
  }

  String? get validation => value.fold(
        (f) => f.maybeMap(
          empty: (_) => PasswordMessageErrors.empty,
          shortPassword: (_) => PasswordMessageErrors.shortPassword,
          orElse: () => null,
        ),
        (_) => null,
      );

  const Password._(this.value);
}
