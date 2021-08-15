import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:vethx_login/features/signin/domain/core/failures.dart';

@immutable
class EmailAddress {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);

  // toString, equals, hashCode...
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

/*
void f() {
  try {
  final email = EmailAddress('pazzwrd');
  } on InvalidEmailException catch (e) {
    // Do some exception handling here
  }
  // If you have multiple validators, remember to catch their exceptions too
} 
*/