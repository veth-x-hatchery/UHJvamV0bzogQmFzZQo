import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/domain/core/errors.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

void main() {
  const String validEmail = 'teste@vethx.com';
  const String inValidEmail = '@com';

  group('when validate EmailAddress', () {
    test('should return [ValueFailure.empty]', () {
      // arrange
      const String email = '';
      // act
      final emailAddress = EmailAddress(email);
      // assert
      expect(emailAddress.value,
          left(const ValueFailure.empty(failedValue: email)));
    });

    test('should return [ValueFailure.invalidEmail]', () {
      // arrange
      // act
      final emailAddress = EmailAddress(inValidEmail);
      // assert
      expect(emailAddress.value,
          left(const ValueFailure.invalidEmail(failedValue: inValidEmail)));
    });

    test('should validate email with success', () {
      // arrange
      // act
      final emailAddress = EmailAddress(validEmail);
      // assert
      expect(emailAddress.value, right(validEmail));
    });

    test('should validate email with success', () {
      // arrange
      // act
      final emailAddress = EmailAddress(validEmail);
      // assert
      expect(emailAddress.value, right(validEmail));
    });

    test(
        'should throw [UnexpectedValueError] when the value object was not validated',
        () {
      // arrange
      // act
      final emailAddress = EmailAddress(inValidEmail);
      // assert
      expect(emailAddress.getOrCrash,
          throwsA(const TypeMatcher<UnexpectedValueError>()));
    });
  });

  group('when validate Password', () {
    test('should return [ValueFailure.empty]', () {
      // arrange
      const String password = '';
      // act
      final validation = Password(password);
      // assert
      expect(validation.value,
          left(const ValueFailure.empty(failedValue: password)));
    });

    test('should return [ValueFailure.shortPassword]', () {
      // arrange
      const String password = '1234';
      // act
      final validation = Password(password);
      // assert
      expect(validation.value,
          left(const ValueFailure.shortPassword(failedValue: password)));
    });

    test('should validate email with success', () {
      // arrange
      const String password = 'dmFsdWVfdmFsaWRhdG9yc190ZXN0LmRhcnQK';
      // act
      final validation = Password(password);
      // assert
      expect(validation.value, right(password));
    });

    test(
        'should throw [UnexpectedValueError] when the value object was not validated',
        () {
      // arrange
      // act
      final emailAddress = Password('0');
      // assert
      expect(emailAddress.getOrCrash,
          throwsA(const TypeMatcher<UnexpectedValueError>()));
    });
  });
}
