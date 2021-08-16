import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/features/signin/domain/core/failures.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';

void main() {
  test('should return [ValueFailure.invalidEmail]', () {
    // arrange
    const String email = '@asdf';
    // act
    final emailAddress = EmailAddress(email);
    // assert
    expect(emailAddress.value,
        left(const ValueFailure.invalidEmail(failedValue: email)));
  });

  test('should validate email with success', () {
    // arrange
    const String email = 'teste@vethx.com';
    // act
    final emailAddress = EmailAddress(email);
    // assert
    expect(emailAddress.value, right(email));
  });
}
