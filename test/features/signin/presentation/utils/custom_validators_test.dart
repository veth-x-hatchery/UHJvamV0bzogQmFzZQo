import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/presentation/utils/custom_validators.dart';

void main() {
  late CustomValidators customValidators;

  setUp(() {
    customValidators = CustomValidators();
  });

  group('custom validators', () {
    group('email analysis', () {
      test(
        'should return correct invalid email message when the value is empty',
        () async {
          // arrange

          final expectedFailure = InvalidEmailFailure(
            message: InvalidEmailFailure.invalidEmptyEmail,
          );

          // act

          final result = customValidators.emailAnalysis(null);

          // assert

          expect(result, Left(expectedFailure));

          result.fold(
            (l) => expect(l.message, expectedFailure.message),
            (r) => null,
          );
        },
      );
      test(
        'should return correct invalid email message when the email is not valid',
        () async {
          // arrange

          final expectedFailure =
              InvalidEmailFailure(message: InvalidEmailFailure.invalidEmail);

          // act

          final result = customValidators.emailAnalysis('user@domain');

          // assert

          expect(result, Left(expectedFailure));

          result.fold(
            (l) => expect(l.message, expectedFailure.message),
            (r) => null,
          );
        },
      );
    });

    group('password analysis', () {
      test(
        'should return correct invalid password message when the value is empty',
        () async {
          // arrange

          final expectedFailure = InvalidPasswordFailure(
            message: InvalidPasswordFailure.invalidPasswordEmpty,
          );

          // act

          final result = customValidators.passwordAnalysis(null);

          // assert

          expect(result, Left(expectedFailure));

          result.fold(
            (l) => expect(l.message, expectedFailure.message),
            (r) => null,
          );
        },
      );
      test(
        'should return correct invalid password message when the password lenght is not valid',
        () async {
          // arrange

          final expectedFailure = InvalidPasswordFailure(
              message: InvalidPasswordFailure.invalidPasswordLenght);

          // act

          final result = customValidators.passwordAnalysis('12345');

          // assert

          expect(result, Left(expectedFailure));

          result.fold(
            (l) => expect(l.message, expectedFailure.message),
            (r) => null,
          );
        },
      );
    });
  });
}
