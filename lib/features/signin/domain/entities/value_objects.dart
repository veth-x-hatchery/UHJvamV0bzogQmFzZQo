import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/core/value_validators.dart';

class PasswordMessageErrors {
  static const empty = 'Informe your password';
  static const shortPassword = 'Your password must be more than 6 chars';
}

class EmailAddressMessageErrors {
  static const empty = 'Informe your password';
  static const invalidEmail = 'Your password must be more than 6 chars';
}

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String? input) {
    return EmailAddress._(
      validateStringNullOrEmpty(input).flatMap(validateEmailAddress),
    );
  }

  String? get validation => value.fold(
        (f) => f.maybeMap(
          empty: (_) => EmailAddressMessageErrors.empty,
          invalidEmail: (_) => EmailAddressMessageErrors.invalidEmail,
          orElse: () => null,
        ),
        (_) => null,
      );

  const EmailAddress._(this.value);
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
