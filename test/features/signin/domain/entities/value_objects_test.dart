import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/domain/core/errors.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

void main() {
  const String validEmail = 'teste@vethx.com';
  const String inValidEmail = '@com';

  group('when validate EmailAddress', () {
    test(
        'should return [ValueFailure.empty] with righ message error [EmailAddressMessageErrors.empty]',
        () {
      // arrange

      const String email = '';

      // act

      final emailAddress = EmailAddress(email);

      // assert

      expect(emailAddress.value,
          left(const ValueFailure.empty(failedValue: email)));

      expect(emailAddress.validation, EmailAddressMessageErrors.empty);
    });

    test('should return [ValueFailure.invalidEmail]', () {
      // arrange

      // act

      final emailAddress = EmailAddress(inValidEmail);

      // assert

      expect(emailAddress.value,
          left(const ValueFailure.invalidEmail(failedValue: inValidEmail)));

      expect(emailAddress.validation, EmailAddressMessageErrors.invalidEmail);
    });

    test('should validate email with success', () {
      // arrange

      // act

      final emailAddress = EmailAddress(validEmail);

      // assert

      expect(emailAddress.value, right(validEmail));

      expect(emailAddress.validation, null);
    });

    test(
        'should throw [UnexpectedValueError] when the value object was not validated',
        () {
      // arrange

      // act

      final emailAddress = EmailAddress('invalid-email');

      // assert

      expect(emailAddress.getOrCrash,
          throwsA(const TypeMatcher<UnexpectedValueError>()));

      // expect(emailAddress.validation, null);
    });
  });

  group('when validate Password', () {
    test('should return [ValueFailure.empty]', () {
      // arrange

      const String password = '';

      // act

      final result = Password(password);

      // assert

      expect(
          result.value, left(const ValueFailure.empty(failedValue: password)));

      expect(result.validation, PasswordMessageErrors.empty);
    });

    test('should return [ValueFailure.shortPassword]', () {
      // arrange

      const String password = '1234';

      // act

      final result = Password(password);

      // assert

      expect(result.value,
          left(const ValueFailure.shortPassword(failedValue: password)));

      expect(result.validation, PasswordMessageErrors.shortPassword);
    });

    test('should validate email with success', () {
      // arrange

      const String password = 'dmFsdWVfdmFsaWRhdG9yc190ZXN0LmRhcnQK';

      // act

      final result = Password(password);

      // assert

      expect(result.value, right(password));

      expect(result.validation, null);
    });

    test(
        'should throw [UnexpectedValueError] when the value object was not validated',
        () {
      // arrange

      // act

      final result = Password('0');

      // assert

      expect(result.getOrCrash,
          throwsA(const TypeMatcher<UnexpectedValueError>()));

      // expect(result.validation, null);
    });
  });
}
