import 'package:dartz/dartz.dart';
import 'package:vethx_login/core/error/failures.dart';

class CustomValidatorsMessages {
  static const String invalidEmptyEmail = 'Please, fill the email field';
  static const String invalidEmail = 'Invalid email';
}

class InvalidEmailFailure extends Failure {
  const InvalidEmailFailure({required String message})
      : super(message: message);
}

class CustomValidators {
  static const String _emailRegex =
      r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";

  Either<InvalidEmailFailure, String> emailAnalysis(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Left(InvalidEmailFailure(
          message: CustomValidatorsMessages.invalidEmptyEmail));
    }
    if (!RegExp(_emailRegex).hasMatch(value)) {
      return Left(
          InvalidEmailFailure(message: CustomValidatorsMessages.invalidEmail));
    }
    return Right(value.trim());
  }

  // Either<Failure, String> passwordAnalysis(String? value) {
  //   if (value == null || value.trim().isEmpty) {
  //     return false;
  //   }
  //   return true;
  // }
}
