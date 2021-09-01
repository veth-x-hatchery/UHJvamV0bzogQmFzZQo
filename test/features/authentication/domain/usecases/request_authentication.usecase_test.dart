import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/authentication/domain/core/failures_details.dart';
import 'package:vethx_beta/features/authentication/domain/core/usecase.dart';
import 'package:vethx_beta/features/authentication/domain/services/i_local_auth.service.dart';
import 'package:vethx_beta/features/authentication/domain/usecases/request_authentication.usecase.dart';
import 'package:vethx_beta/features/authentication/infrastructure/services/local_auth_failure.dart';

import 'request_authentication.usecase_test.mocks.dart';

@GenerateMocks([
  ILocalAuth,
])
void main() {
  late RequestLocalAuthentication _useCase;
  late MockILocalAuth _mockILocalAuth;

  setUp(() {
    _mockILocalAuth = MockILocalAuth();
    _useCase = RequestLocalAuthentication(_mockILocalAuth);
  });

  test('when request local auth then should return correct failure details',
      () async {
    for (final failure in [
      const LocalAuthFailure.genericError(),
      const LocalAuthFailure.notAvailable()
    ]) {
      // arrange

      when(_mockILocalAuth.request()).thenAnswer((_) async => left(failure));

      // act

      final result = await _useCase(const NoParams());

      // assert

      expect(
        result,
        left(FailureDetails(
          message: 'MAP_ERROR_MESSAGE',
          failure: failure,
        )),
      );
    }
  });

  test('when request local auth then should return success', () async {
    // arrange

    when(_mockILocalAuth.request()).thenAnswer((_) async => right(true));

    // act

    final result = await _useCase(const NoParams());

    // assert

    expect(
      result,
      right(true),
    );
  });
}
