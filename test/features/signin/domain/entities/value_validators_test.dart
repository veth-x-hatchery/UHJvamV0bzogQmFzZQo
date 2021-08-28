import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';
import 'package:vethx_beta/features/signin/domain/core/value_validators.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.mock.dart';

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
      final String credential = AuthFacadeMock.invalidCredential.inputedValue!;
      // act
      final credentialAddress = validateCredentialAddress(credential);
      // assert
      expect(credentialAddress,
          left(ValueFailure.invalidCredential(failedValue: credential)));
    });

    test('should validate credential with success', () {
      // arrange
      final credential = AuthFacadeMock.validTestCredential.inputedValue!;
      // act
      final credentialAddress = validateCredentialAddress(credential);
      // assert
      expect(credentialAddress, right(credential));
    });
  });

  group('when validate secret', () {
    test('should return [ValueFailure.shortSecret]', () {
      // arrange
      const String secret = '12345';
      // act
      final validation = validateSecret(secret);
      // assert
      expect(validation,
          left(const ValueFailure.shortSecret(failedValue: secret)));
    });

    test('should validate secret with success', () {
      // arrange
      final String secret = AuthFacadeMock.validTestSecret.inputedValue!;
      // act
      final validation = validateSecret(secret);
      // assert
      expect(validation, right(secret));
    });
  });
}
