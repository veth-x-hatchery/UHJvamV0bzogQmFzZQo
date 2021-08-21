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

      const String credential = '';

      // act

      final credentialAddress = EmailAddress(credential);

      // assert

      expect(credentialAddress.value,
          left(const ValueFailure.empty(failedValue: credential)));

      expect(credentialAddress.validation, EmailAddressMessageErrors.empty);
    });

    test('should return [ValueFailure.invalidEmail]', () {
      // arrange

      // act

      final credentialAddress = EmailAddress(inValidEmail);

      // assert

      expect(credentialAddress.value,
          left(const ValueFailure.invalidEmail(failedValue: inValidEmail)));

      expect(
          credentialAddress.validation, EmailAddressMessageErrors.invalidEmail);
    });

    test('should validate credential with success', () {
      // arrange

      // act

      final credentialAddress = EmailAddress(validEmail);

      // assert

      expect(credentialAddress.value, right(validEmail));

      expect(credentialAddress.validation, null);
    });

    test(
        'should throw [UnexpectedValueError] when the value object was not validated',
        () {
      // arrange

      // act

      final credentialAddress = EmailAddress('invalid-credential');

      // assert

      expect(credentialAddress.getOrCrash,
          throwsA(const TypeMatcher<UnexpectedValueError>()));

      // expect(credentialAddress.validation, null);
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

    test('should validate credential with success', () {
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
