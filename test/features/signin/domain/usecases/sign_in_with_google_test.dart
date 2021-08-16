import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/core/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';

import 'sign_in_with_email_and_password_test.mocks.dart';

void main() {
  late SignInWithGoogle _signInUseCase;
  late MockISignInRepository _mockSignInRepository;
  late MockIAuthFacade _mockAuthFacade;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _mockAuthFacade = MockIAuthFacade();

    _signInUseCase = SignInWithGoogle(
      _mockSignInRepository,
      _mockAuthFacade,
    );
  });

  group('sign in process', () {
    test('should return success with google sign in', () async {
      // arrange

      when(_mockAuthFacade.signInWithGoogle())
          .thenAnswer((_) async => const Right(unit));

      // act

      final result = await _signInUseCase.call(NoParams());

      // assert

      expect(result, const Right(unit));

      verify(_mockAuthFacade.signInWithGoogle());

      verifyNoMoreInteractions(_mockSignInRepository);
    });
  });
}
