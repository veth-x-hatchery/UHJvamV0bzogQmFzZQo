import 'package:dartz/dartz.dart';
import 'package:vethx_beta/core/error/failures.dart';

class InvalidEmailFailure extends Failure {
  static const String invalidEmptyEmail = 'Please, fill the email field';
  static const String invalidEmail = 'Invalid email';

  const InvalidEmailFailure({required String message})
      : super(message: message);
}

class InvalidPasswordFailure extends Failure {
  static const String invalidPasswordEmpty = 'Please, fill the password field';
  static const String invalidPassword = 'Invalid password';
  static const String invalidPasswordLenght = 'Invalid password lenght';

  const InvalidPasswordFailure({required String message})
      : super(message: message);
}

class CustomValidators {
  static const String _emailRegex =
      r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";

  Either<InvalidEmailFailure, String> emailAnalysis(String? value) {
    if (value == null || value.trim().isEmpty) {
      return const Left(
          InvalidEmailFailure(message: InvalidEmailFailure.invalidEmptyEmail));
    }
    if (!RegExp(_emailRegex).hasMatch(value)) {
      return const Left(
          InvalidEmailFailure(message: InvalidEmailFailure.invalidEmail));
    }
    return Right(value.trim());
  }

  Either<Failure, String> passwordAnalysis(String? value) {
    if (value == null || value.trim().isEmpty) {
      return const Left(InvalidPasswordFailure(
          message: InvalidPasswordFailure.invalidPasswordEmpty));
    }
    if (value.length < 8) {
      return const Left(InvalidPasswordFailure(
        message: InvalidPasswordFailure.invalidPasswordLenght,
      ));
    }
    return Right(value);
  }
}
