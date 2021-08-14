import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_login/features/signin/presentation/utils/custom_validators.dart';

void main() {
  late CustomValidators customValidators;

  setUp(() {
    customValidators = CustomValidators();
  });

  group('custom email validators', () {
    test(
      'should return correct invalid email message when the value is empty',
      () async {
        // arrange
        // act
        final result = customValidators.emailAnalysis(null);
        // assert
        expect(
            result,
            Left(
              InvalidEmailFailure(
                  message: CustomValidatorsMessages.invalidEmptyEmail),
            ));
      },
    );

    test(
      'should return correct invalid email message when the email is not valid',
      () async {
        // arrange
        // act
        final result = customValidators.emailAnalysis('user@domain');
        // assert
        expect(
            result,
            Left(
              InvalidEmailFailure(
                  message: CustomValidatorsMessages.invalidEmail),
            ));
      },
    );
  });
}
