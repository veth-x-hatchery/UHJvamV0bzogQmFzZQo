import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/entities/user_entity.dart'
    as domain;
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_user_mapper.dart';

import 'firebase_auth_facade_test.mocks.dart';

@GenerateMocks([
  FirebaseAuth,
  GoogleSignIn,
  UserCredential,
  GoogleAuthProvider,
  GoogleSignInAccount,
  GoogleSignInAuthentication,
  FirebaseUserMapper,
  User,
])
void main() {
  late MockFirebaseAuth _mockFirebaseAuth;
  late MockGoogleSignIn _mockGoogleSignIn;
  late MockUserCredential _mockUserCredential;
  late MockGoogleSignInAccount _mockGoogleSignInAccount;
  late MockGoogleSignInAuthentication _mockGoogleSignInAuthentication;
  late MockFirebaseUserMapper _mockFirebaseUserMapper;
  late MockUser _mockFirebaseUser;

  late FirebaseAuthFacade _authFacade;

  setUp(() {
    _mockUserCredential = MockUserCredential();
    _mockFirebaseAuth = MockFirebaseAuth();
    _mockGoogleSignIn = MockGoogleSignIn();
    _mockGoogleSignInAccount = MockGoogleSignInAccount();
    _mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();
    _mockFirebaseUser = MockUser();
    _mockFirebaseUserMapper = MockFirebaseUserMapper();
    _authFacade = FirebaseAuthFacade(
      _mockFirebaseAuth,
      _mockGoogleSignIn,
      _mockFirebaseUserMapper,
    );
  });

  group('when [FirebaseAuthFacade.registerWithCredentialAndPassword]', () {
    final credential = CredentialAddress('test@vethx.com');

    final password = Password('dGVzdEB2ZXRoeC5jb20K');

    Future<void> _registerWithCredentialAndPassword(
      Exception firebaseException,
      AuthFailure expectedFailure,
    ) async {
      // Arrange

      when(_mockFirebaseAuth.signInWithEmailAndPassword(
        credential: credential.getOrCrash(),
        password: password.getOrCrash(),
      )).thenThrow(firebaseException);

      // act

      final result = await _authFacade.registerWithCredentialAndPassword(
        credentialAddress: credential,
        password: password,
      );

      // assert

      expect(result, left(expectedFailure));
    }

    test(
      'should return [AuthFailure.credentialAlreadyInUse()] when firebase throw the exception code [credential-already-in-use]',
      () async {
        // arrange

        final firebaseException =
            FirebaseException(code: 'credential-already-in-use', plugin: '');

        const expectedFailure = AuthFailure.credentialAlreadyInUse();

        // act && assert

        await _registerWithCredentialAndPassword(
          firebaseException,
          expectedFailure,
        );
      },
    );

    test(
      'should return [AuthFailure.serverError()] when firebase throw whatever exception code',
      () async {
        // arrange

        final firebaseException =
            FirebaseException(code: 'invalid-credential', plugin: '');

        const expectedFailure = AuthFailure.serverError();

        // act && assert

        await _registerWithCredentialAndPassword(
          firebaseException,
          expectedFailure,
        );
      },
    );

    test('should return [rigth(Unit)] success', () async {
      // Arrange

      when(
        _mockFirebaseAuth.signInWithEmailAndPassword(
          credential: credential.getOrCrash(),
          password: password.getOrCrash(),
        ),
      ).thenAnswer(
          (_) => Future<MockUserCredential>.value(_mockUserCredential));

      // act

      final result = await _authFacade.registerWithCredentialAndPassword(
        credentialAddress: credential,
        password: password,
      );

      // assert

      expect(result, right(unit));
    });
  });

  group('when [FirebaseAuthFacade.signInWithCredentialAndPassword]', () {
    final credential = CredentialAddress('test@vethx.com');

    final password = Password('dGVzdEB2ZXRoeC5jb20K');

    Future<void> _signInWithCredentialAndPassword(
      Exception firebaseException,
      AuthFailure expectedFailure,
    ) async {
      // Arrange

      when(_mockFirebaseAuth.signInWithCredentialAndPassword(
        credential: credential.getOrCrash(),
        password: password.getOrCrash(),
      )).thenThrow(firebaseException);

      // act

      final result = await _authFacade.signInWithCredentialAndPassword(
        credentialAddress: credential,
        password: password,
      );

      // assert

      expect(result, left(expectedFailure));
    }

    test(
        'should return [AuthFailure.invalidCredentialAndPasswordCombination()] when Firebase throw [wrong-password]',
        () async {
      // arrange

      final firebaseException =
          FirebaseException(code: 'wrong-password', plugin: '');

      const expectedFailure =
          AuthFailure.invalidCredentialAndPasswordCombination();

      // act && assert

      await _signInWithCredentialAndPassword(
        firebaseException,
        expectedFailure,
      );
    });

    test(
        'should return [AuthFailure.invalidCredentialAndPasswordCombination()] when Firebase throw [user-not-found]',
        () async {
      // arrange

      final firebaseException =
          FirebaseException(code: 'user-not-found', plugin: '');

      const expectedFailure =
          AuthFailure.invalidCredentialAndPasswordCombination();

      // act && assert

      await _signInWithCredentialAndPassword(
        firebaseException,
        expectedFailure,
      );
    });

    test(
      'should return [AuthFailure.serverError()] when firebase throw whatever exception code',
      () async {
        // arrange

        final firebaseException = PlatformException(code: 'user-disabled');

        const expectedFailure = AuthFailure.serverError();

        // act && assert

        await _signInWithCredentialAndPassword(
          firebaseException,
          expectedFailure,
        );
      },
    );

    test('should return [rigth(Unit)] success', () async {
      // Arrange

      when(
        _mockFirebaseAuth.signInWithCredentialAndPassword(
          credential: credential.getOrCrash(),
          password: password.getOrCrash(),
        ),
      ).thenAnswer(
          (_) => Future<MockUserCredential>.value(_mockUserCredential));

      // act

      final result = await _authFacade.signInWithCredentialAndPassword(
        credentialAddress: credential,
        password: password,
      );

      // assert

      expect(result, right(unit));
    });
  });

  group('when [GoogleAuthProvider.credential]', () {
    void _setUpSignInWithGoogle() {
      when(_mockGoogleSignIn.signIn()).thenAnswer((_) =>
          Future<MockGoogleSignInAccount>.value(_mockGoogleSignInAccount));

      when(_mockGoogleSignInAccount.authentication).thenAnswer((_) =>
          Future<MockGoogleSignInAuthentication>.value(
              _mockGoogleSignInAuthentication));

      when(_mockGoogleSignInAuthentication.idToken).thenReturn('idToken');

      when(_mockGoogleSignInAuthentication.accessToken)
          .thenReturn('accessToken');
    }

    test('should return failure [AuthFailure.cancelledByUser]', () async {
      //arrange

      when(_mockGoogleSignIn.signIn())
          .thenAnswer((_) => Future<MockGoogleSignInAccount?>.value());

      //act

      final result = await _authFacade.signInWithGoogle();

      //assert

      expect(result, left(const AuthFailure.cancelledByUser()));
    });

    test(
        'should return failure [AuthFailure.serverError] when firebase throws any exception',
        () async {
      //arrange

      _setUpSignInWithGoogle();

      when(_mockFirebaseAuth.signInWithCredential(any))
          .thenThrow(PlatformException(code: 'wrong-password'));

      //act

      final result = await _authFacade.signInWithGoogle();

      //assert

      expect(result, left(const AuthFailure.serverError()));
    });

    test('should return [rigth(Unit)] success', () async {
      //arrange

      _setUpSignInWithGoogle();

      when(_mockFirebaseAuth.signInWithCredential(any)).thenAnswer(
          (_) => Future<MockUserCredential>.value(_mockUserCredential));

      //act

      final result = await _authFacade.signInWithGoogle();

      //assert

      expect(result, right(unit));
    });
  });

  group('when check if credential is already in use', () {
    final credential = CredentialAddress('test@vethx.com');

    Future<void> _credentialIsAlreadyInUse(Exception firebaseException) async {
      // Arrange
      when(_mockFirebaseAuth.signInWithCredentialAndPassword(
        credential: credential.getOrCrash(),
        password: _authFacade.randomPassword,
      )).thenThrow(firebaseException);
    }

    test(
        'should return [AuthFailure.serverError] when firebase throws any unrecognized exception',
        () async {
      //arrange

      final firebaseException =
          FirebaseException(code: 'user-disabled', plugin: '');

      const expectedFailure = AuthFailure.serverError();

      _credentialIsAlreadyInUse(firebaseException);

      //act

      final result = await _authFacade.credentialIsAlreadyInUse(credential);

      // assert

      expect(result, left(expectedFailure));
    });

    test('should return already in use', () async {
      //arrange

      final firebaseException =
          FirebaseException(code: 'wrong-password', plugin: '');

      _credentialIsAlreadyInUse(firebaseException);

      //act

      final result = await _authFacade.credentialIsAlreadyInUse(credential);

      // assert

      expect(result, right(true));
    });

    test('should return not in use', () async {
      //arrange

      final firebaseException =
          FirebaseException(code: 'user-not-found', plugin: '');

      _credentialIsAlreadyInUse(firebaseException);

      //act

      final result = await _authFacade.credentialIsAlreadyInUse(credential);

      // assert

      expect(result, right(false));
    });
  });

  test('when request sign out should call all listed methods', () {
    //arrange

    when(_mockGoogleSignIn.signOut())
        .thenAnswer((_) => Future<MockGoogleSignInAccount?>.value());

    when(_mockFirebaseAuth.signOut()).thenAnswer((_) => Future.value());

    //act

    _authFacade.signOut();

    //assert

    verify(_mockGoogleSignIn.signOut());

    verify(_mockFirebaseAuth.signOut());
  });

  group('when request for the signed user', () {
    test('should return null', () async {
      //arrange

      when(_mockFirebaseAuth.currentUser).thenAnswer((_) => null);

      when(_mockFirebaseUserMapper.toDomain(any)).thenAnswer((_) => null);

      //act

      final result = await _authFacade.getSignedInUser();

      //assert

      verify(_mockFirebaseAuth.currentUser);

      expect(result, null);
    });

    test('should return a user', () async {
      //arrange

      when(_mockFirebaseAuth.currentUser).thenReturn(_mockFirebaseUser);

      when(_mockFirebaseUserMapper.toDomain(_mockFirebaseUser))
          .thenAnswer((_) => domain.User(
                credential: CredentialAddress('credential@valid.com'),
                name: 'valid user',
              ));

      //act

      final result = await _authFacade.getSignedInUser();

      //assert

      verify(_mockFirebaseAuth.currentUser);

      expect(result != null, true);
    });
  });
}
