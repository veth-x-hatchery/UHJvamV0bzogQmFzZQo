import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/core/usecases/usecase.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_google.dart';

import 'sign_in_with_email_and_password_test.mocks.dart';

void main() {
  late SignInWithGoogle _signInUseCase;
  late MockISignInRepository _mockSignInRepository;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _signInUseCase = SignInWithGoogle(_mockSignInRepository);
  });

  const emailTester = 'test@vethx.com';
  final user = User(email: emailTester);
  group('sign in process', () {
    test('should get user from the repository with google sign in', () async {
      // arrange

      when(_mockSignInRepository.signInWithGoogle())
          .thenAnswer((_) async => Right(user));

      // act

      final result = await _signInUseCase.call(NoParams());

      // assert

      expect(result, Right(user));

      verify(_mockSignInRepository.signInWithGoogle());

      verifyNoMoreInteractions(_mockSignInRepository);
    });
  });
}
