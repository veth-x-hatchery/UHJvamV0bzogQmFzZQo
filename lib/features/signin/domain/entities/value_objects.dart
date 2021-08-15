import 'package:meta/meta.dart';

@immutable
class EmailAddress {
  final String value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);

  // toString, equals, hashCode...
}

String validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return input;
  } else {
    throw InvalidEmailException(failedValue: input);
  }
}

class InvalidEmailException implements Exception {
  final String failedValue;

  InvalidEmailException({required this.failedValue});
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