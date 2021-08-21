import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/value_validators.dart';

void main() {
  group('when validate is null or empty', () {
    test('should return [ValueFailure.empty] when receives null', () {
      // arrange
      const String input = '';
      // act
      final validation = validateStringNullOrEmpty(null);
      // assert
      expect(validation, left(const ValueFailure.empty(failedValue: input)));
    });

    test('should return [ValueFailure.empty]', () {
      // arrange
      const String input = '';
      // act
      final validation = validateStringNullOrEmpty(input);
      // assert
      expect(validation, left(const ValueFailure.empty(failedValue: input)));
    });

    test('should return the inputed value', () {
      // arrange
      const String input = 'input';
      // act
      final validation = validateStringNullOrEmpty(input);
      // assert
      expect(validation, right(input));
    });
  });

  group('when validate credential address', () {
    test('should return [ValueFailure.invalidCredential]', () {
      // arrange
      const String credential = '@asdf';
      // act
      final credentialAddress = validateCredentialAddress(credential);
      // assert
      expect(credentialAddress,
          left(const ValueFailure.invalidCredential(failedValue: credential)));
    });

    test('should validate credential with success', () {
      // arrange
      const String credential = 'teste@vethx.com';
      // act
      final credentialAddress = validateCredentialAddress(credential);
      // assert
      expect(credentialAddress, right(credential));
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
      const String password = 'dmFsdWVfdmFsaWRhdG9yc190ZXN0LmRhcnQK';
      // act
      final validation = validatePassword(password);
      // assert
      expect(validation, right(password));
    });
  });
}
