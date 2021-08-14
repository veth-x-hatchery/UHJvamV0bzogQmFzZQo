import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_login/core/error/failures.dart';
import 'package:vethx_login/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_check_email.dart';

import 'sign_in_with_email_and_password_test.mocks.dart';

@GenerateMocks([ISignInRepository])
void main() {
  late SignInCheckIfEmailIsInUse _signInUseCase;
  late MockISignInRepository _mockSignInRepository;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _signInUseCase = SignInCheckIfEmailIsInUse(_mockSignInRepository);
  });

  group('sign in check if user is already registered', () {
    const emailTester = 'test@vethx.com';
    test('should return that the user is registered', () async {
      // arrange
      when(_mockSignInRepository.emailAlreadyRegistered(emailTester))
          .thenAnswer((_) async => Right(true));
      // act
      final result = await _signInUseCase.call(Params(email: emailTester));
      // assert
      expect(result, Right(true));
      verify(_mockSignInRepository.emailAlreadyRegistered(emailTester));
      verifyNoMoreInteractions(_mockSignInRepository);
    });

    test('should return a server failure', () async {
      // arrange
      when(_mockSignInRepository.emailAlreadyRegistered(emailTester))
          .thenAnswer((_) async => Left(ServerFailure()));
      // act
      final result = await _signInUseCase.call(Params(email: emailTester));
      // assert
      expect(result, Left(ServerFailure()));
      verify(_mockSignInRepository.emailAlreadyRegistered(emailTester));
      verifyNoMoreInteractions(_mockSignInRepository);
    });
  });
}
