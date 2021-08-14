import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_login/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_login/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_login/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_email_and_password.dart';

import 'sign_in_with_email_and_password_test.mocks.dart';

@GenerateMocks([ISignInRepository])
void main() {
  late SignInWithEmailAndPassword signInUseCase;
  late MockISignInRepository mockSignInRepository;

  setUp(() {
    mockSignInRepository = MockISignInRepository();
    signInUseCase = SignInWithEmailAndPassword(mockSignInRepository);
  });

  const emailTester = 'test@vethx.com';
  final credentials =
      Credentials(user: emailTester, password: 'dGVzdEB2ZXRoeC5jb20K');
  final user = User(email: emailTester);
  group('sign in process', () {
    test('should get user from the repository with the given credentials',
        () async {
      // arrange

      when(mockSignInRepository.signInWithEmailAndPassword(credentials))
          .thenAnswer((_) async => Right(user));

      // act

      final result = await signInUseCase.call(Params(credentials: credentials));

      // assert

      expect(result, Right(user));

      verify(mockSignInRepository.signInWithEmailAndPassword(credentials));

      verifyNoMoreInteractions(mockSignInRepository);
    });
  });
}
