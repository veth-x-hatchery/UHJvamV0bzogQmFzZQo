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

        final expectedFailure = InvalidEmailFailure(
            message: CustomValidatorsMessages.invalidEmptyEmail);

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
            InvalidEmailFailure(message: CustomValidatorsMessages.invalidEmail);

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
}
