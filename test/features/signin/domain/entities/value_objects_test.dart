import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/domain/core/errors.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

void main() {
  const String validCredential = 'teste@vethx.com';
  const String inValidCredential = '@com';

  group('when validate CredentialAddress', () {
    test(
        'should return [ValueFailure.empty] with righ message error [CredentialAddressMessageErrors.empty]',
        () {
      // arrange

      const String credential = '';

      // act

      final credentialAddress = Credential(credential);

      // assert

      expect(credentialAddress.value,
          left(const ValueFailure.empty(failedValue: credential)));

      expect(
          credentialAddress.validation, CredentialAddressMessageErrors.empty);
    });

    test('should return [ValueFailure.invalidCredential]', () {
      // arrange

      // act

      final credentialAddress = Credential(inValidCredential);

      // assert

      expect(
          credentialAddress.value,
          left(const ValueFailure.invalidCredential(
              failedValue: inValidCredential)));

      expect(credentialAddress.validation,
          CredentialAddressMessageErrors.invalidCredential);
    });

    test('should validate credential with success', () {
      // arrange

      // act

      final credentialAddress = Credential(validCredential);

      // assert

      expect(credentialAddress.value, right(validCredential));

      expect(credentialAddress.validation, null);
    });

    test(
        'should throw [UnexpectedValueError] when the value object was not validated',
        () {
      // arrange

      // act

      final credentialAddress = Credential('invalid-credential');

      // assert

      expect(credentialAddress.getOrCrash,
          throwsA(const TypeMatcher<UnexpectedValueError>()));

      // expect(credentialAddress.validation, null);
    });
  });

  group('when validate Secret', () {
    test('should return [ValueFailure.empty]', () {
      // arrange

      const String secret = '';

      // act

      final result = Secret(secret);

      // assert

      expect(result.value, left(const ValueFailure.empty(failedValue: secret)));

      expect(result.validation, SecretMessageErrors.empty);
    });

    test('should return [ValueFailure.shortSecret]', () {
      // arrange

      const String secret = '1234';

      // act

      final result = Secret(secret);

      // assert

      expect(result.value,
          left(const ValueFailure.shortSecret(failedValue: secret)));

      expect(result.validation, SecretMessageErrors.shortSecret);
    });

    test('should validate credential with success', () {
      // arrange

      const String secret = 'dmFsdWVfdmFsaWRhdG9yc190ZXN0LmRhcnQK';

      // act

      final result = Secret(secret);

      // assert

      expect(result.value, right(secret));

      expect(result.validation, null);
    });

    test(
        'should throw [UnexpectedValueError] when the value object was not validated',
        () {
      // arrange

      // act

      final result = Secret('0');

      // assert

      expect(result.getOrCrash,
          throwsA(const TypeMatcher<UnexpectedValueError>()));

      // expect(result.validation, null);
    });
  });
}
