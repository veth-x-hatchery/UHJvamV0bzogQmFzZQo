import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vethx_beta/features/signin/domain/entities/value_objects.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/infrastructure/services/firebase_auth_facade.dart';

import 'firebase_auth_facade_test.mocks.dart';

@GenerateMocks([
  FirebaseAuth,
  GoogleSignIn,
  UserCredential,
  GoogleAuthProvider,
  GoogleSignInAccount,
  GoogleSignInAuthentication,
])
void main() {
  late MockFirebaseAuth _mockFirebaseAuth;
  late MockGoogleSignIn _mockGoogleSignIn;
  late MockUserCredential _mockUserCredential;
  late MockGoogleSignInAccount _mockGoogleSignInAccount;
  late MockGoogleSignInAuthentication _mockGoogleSignInAuthentication;

  late FirebaseAuthFacade _authFacade;

  setUp(() {
    _mockUserCredential = MockUserCredential();
    _mockFirebaseAuth = MockFirebaseAuth();
    _mockGoogleSignIn = MockGoogleSignIn();
    _mockGoogleSignInAccount = MockGoogleSignInAccount();
    _mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();
    _authFacade = FirebaseAuthFacade(
      _mockFirebaseAuth,
      _mockGoogleSignIn,
    );
  });

  group('when [FirebaseAuthFacade.registerWithEmailAndPassword]', () {
    final email = EmailAddress('test@vethx.com');

    final password = Password('dGVzdEB2ZXRoeC5jb20K');

    Future<void> _registerWithEmailAndPassword(
      PlatformException firebaseException,
      AuthFailure expectedFailure,
    ) async {
      // Arrange

      when(_mockFirebaseAuth.createUserWithEmailAndPassword(
        email: email.getOrCrash(),
        password: password.getOrCrash(),
      )).thenThrow(firebaseException);

      // act

      final result = await _authFacade.registerWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );

      // assert

      expect(result, left(expectedFailure));
    }

    test(
      'should return [AuthFailure.emailAlreadyInUse()] when firebase throw the exception code [email-already-in-use]',
      () async {
        // arrange

        final firebaseException =
            PlatformException(code: 'email-already-in-use');

        const expectedFailure = AuthFailure.emailAlreadyInUse();

        // act && assert

        await _registerWithEmailAndPassword(
          firebaseException,
          expectedFailure,
        );
      },
    );

    test(
      'should return [AuthFailure.serverError()] when firebase throw whatever exception code',
      () async {
        // arrange

        final firebaseException = PlatformException(code: 'invalid-email');

        const expectedFailure = AuthFailure.serverError();

        // act && assert

        await _registerWithEmailAndPassword(
          firebaseException,
          expectedFailure,
        );
      },
    );

    test('should return [rigth(Unit)] success', () async {
      // Arrange

      when(
        _mockFirebaseAuth.createUserWithEmailAndPassword(
          email: email.getOrCrash(),
          password: password.getOrCrash(),
        ),
      ).thenAnswer(
          (_) => Future<MockUserCredential>.value(_mockUserCredential));

      // act

      final result = await _authFacade.registerWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );

      // assert

      expect(result, right(unit));
    });
  });

  group('when [FirebaseAuthFacade.signInWithEmailAndPassword]', () {
    final email = EmailAddress('test@vethx.com');

    final password = Password('dGVzdEB2ZXRoeC5jb20K');

    Future<void> _signInWithEmailAndPassword(
      PlatformException firebaseException,
      AuthFailure expectedFailure,
    ) async {
      // Arrange

      when(_mockFirebaseAuth.signInWithEmailAndPassword(
        email: email.getOrCrash(),
        password: password.getOrCrash(),
      )).thenThrow(firebaseException);

      // act

      final result = await _authFacade.signInWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );

      // assert

      expect(result, left(expectedFailure));
    }

    test(
        'should return [AuthFailure.invalidEmailAndPasswordCombination()] when Firebase throw [wrong-password]',
        () async {
      // arrange

      final firebaseException = PlatformException(code: 'wrong-password');

      const expectedFailure = AuthFailure.invalidEmailAndPasswordCombination();

      // act && assert

      await _signInWithEmailAndPassword(
        firebaseException,
        expectedFailure,
      );
    });

    test(
        'should return [AuthFailure.invalidEmailAndPasswordCombination()] when Firebase throw [user-not-found]',
        () async {
      // arrange

      final firebaseException = PlatformException(code: 'user-not-found');

      const expectedFailure = AuthFailure.invalidEmailAndPasswordCombination();

      // act && assert

      await _signInWithEmailAndPassword(
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

        await _signInWithEmailAndPassword(
          firebaseException,
          expectedFailure,
        );
      },
    );

    test('should return [rigth(Unit)] success', () async {
      // Arrange

      when(
        _mockFirebaseAuth.signInWithEmailAndPassword(
          email: email.getOrCrash(),
          password: password.getOrCrash(),
        ),
      ).thenAnswer(
          (_) => Future<MockUserCredential>.value(_mockUserCredential));

      // act

      final result = await _authFacade.signInWithEmailAndPassword(
        emailAddress: email,
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

  group('when check if email is already in use', () {
    final email = EmailAddress('test@vethx.com');

    Future<void> _emailIsAlreadyInUse(
        PlatformException firebaseException) async {
      // Arrange
      when(_mockFirebaseAuth.signInWithEmailAndPassword(
        email: email.getOrCrash(),
        password: _authFacade.randomPassword,
      )).thenThrow(firebaseException);
    }

    test(
        'should return [AuthFailure.serverError] when firebase throws any unrecognized exception',
        () async {
      //arrange

      final firebaseException = PlatformException(code: 'user-disabled');

      const expectedFailure = AuthFailure.serverError();

      _emailIsAlreadyInUse(firebaseException);

      //act

      final result = await _authFacade.emailIsAlreadyInUse(email);

      // assert

      expect(result, left(expectedFailure));
    });

    test('should return already in use', () async {
      //arrange

      final firebaseException = PlatformException(code: 'wrong-password');

      _emailIsAlreadyInUse(firebaseException);

      //act

      final result = await _authFacade.emailIsAlreadyInUse(email);

      // assert

      expect(result, right(true));
    });

    test('should return not in use', () async {
      //arrange

      final firebaseException = PlatformException(code: 'user-not-found');

      _emailIsAlreadyInUse(firebaseException);

      //act

      final result = await _authFacade.emailIsAlreadyInUse(email);

      // assert

      expect(result, right(false));
    });
  });
}
