import 'package:dartz/dartz.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateCredentialAddress(String input) {
  const credentialRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(credentialRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidCredential(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateSecret(String input) {
  // You can also add some advanced secret checks (uppercase/lowercase, at least 1 number, ...)
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortSecret(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateStringNullOrEmpty(String? input) {
  if (input == null || input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input ?? ''));
  } else {
    return right(input);
  }
}
