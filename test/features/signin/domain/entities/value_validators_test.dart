import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/value_validators.dart';

void main() {
  group('when validate is not empty', () {
    test('should return [ValueFailure.empty] when value is null', () {
      // arrange
      const String input = '';
      // act
      final validation = validateStringNotEmpty(null);
      // assert
      expect(validation, left(const ValueFailure.empty(failedValue: input)));
    });

    test('should return [ValueFailure.empty]', () {
      // arrange
      const String input = '';
      // act
      final validation = validateStringNotEmpty(input);
      // assert
      expect(validation, left(const ValueFailure.empty(failedValue: input)));
    });

    test('should return the inputed value', () {
      // arrange
      const String input = 'input';
      // act
      final validation = validateStringNotEmpty(input);
      // assert
      expect(validation, right(input));
    });
  });

  group('when validate email address', () {
    test('should return [ValueFailure.invalidEmail]', () {
      // arrange
      const String email = '@asdf';
      // act
      final emailAddress = validateEmailAddress(email);
      // assert
      expect(emailAddress,
          left(const ValueFailure.invalidEmail(failedValue: email)));
    });

    test('should validate email with success', () {
      // arrange
      const String email = 'teste@vethx.com';
      // act
      final emailAddress = validateEmailAddress(email);
      // assert
      expect(emailAddress, right(email));
    });
  });

  group('when validate password', () {
    test('should return [ValueFailure.shortPassword]', () {
      // arrange
      const String password = '12345';
      // act
      final validation = validatePassword(password);
      // assert
      expect(validation,
          left(const ValueFailure.shortPassword(failedValue: password)));
    });

    test('should validate password with success', () {
      // arrange
      const String password = '123456';
      // act
      final validation = validatePassword(password);
      // assert
      expect(validation, right(password));
    });
  });
}
