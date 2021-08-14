import 'package:dartz/dartz.dart';
import 'package:vethx_login/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw FormatException();
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}

// class CustomValidators {
//   static const String _emailRegex =
//       r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";

//   Either<Failure, bool> isValidEmail(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return Right(false);
//     }
//     return Right(RegExp(_emailRegex).hasMatch(value));
//   }

//   static bool validatePassword(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return false;
//     }
//     return true;
//   }
// }
