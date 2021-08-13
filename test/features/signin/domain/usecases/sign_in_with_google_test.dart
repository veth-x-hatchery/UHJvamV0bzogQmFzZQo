import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_login/core/usecases/usecase.dart';
import 'package:vethx_login/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_google.dart';

import 'sign_in_with_email_and_password_test.mocks.dart';

void main() {
  late SignInWithGoogle signInUseCase;
  late MockISignInRepository mockSignInRepository;

  setUp(() {
    mockSignInRepository = MockISignInRepository();
    signInUseCase = SignInWithGoogle(mockSignInRepository);
  });

  const emailTester = 'test@vethx.com';
  final user = User(email: emailTester);

  test('should get user from the repository with google sign in', () async {
    // arrange
    when(mockSignInRepository.signInWithGoogle())
        .thenAnswer((_) async => Right(user));
    // act
    final result = await signInUseCase.call(NoParams());
    // assert
    expect(result, Right(user));
    verify(mockSignInRepository.signInWithGoogle());
    verifyNoMoreInteractions(mockSignInRepository);
  });
}
