import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/entities/credentials_entity.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart';
import 'package:vethx_beta/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:vethx_beta/features/signin/domain/services/i_auth_facade.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_with_email_and_password.dart';

import 'sign_in_check_email_test.mocks.dart';

@GenerateMocks([
  ISignInRepository,
  IAuthFacade,
])
void main() {
  late SignInWithEmailAndPassword signInUseCase;
  late MockISignInRepository _mockSignInRepository;
  late MockIAuthFacade _mockAuthFacade;

  setUp(() {
    _mockSignInRepository = MockISignInRepository();
    _mockAuthFacade = MockIAuthFacade();
    signInUseCase = SignInWithEmailAndPassword(
      _mockSignInRepository,
      _mockAuthFacade,
    );
  });

  const emailTester = 'test@vethx.com';
  final credentials =
      Credentials(user: emailTester, password: 'dGVzdEB2ZXRoeC5jb20K');
  const user = User(email: emailTester);
  group('sign in process', () {
    test('should get user from the repository with the given credentials',
        () async {
      // arrange

      when(_mockSignInRepository.signInWithEmailAndPassword(credentials))
          .thenAnswer((_) async => const Right(user));

      // act

      final result = await signInUseCase.call(Params(credentials: credentials));

      // assert

      expect(result, const Right(user));

      verify(_mockSignInRepository.signInWithEmailAndPassword(credentials));

      verifyNoMoreInteractions(_mockSignInRepository);
    });
  });
}
