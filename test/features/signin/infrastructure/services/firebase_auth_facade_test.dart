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
])
void main() {
  late MockFirebaseAuth _mockFirebaseAuth;
  late MockGoogleSignIn _mockGoogleSignIn;

  late FirebaseAuthFacade _authFacade;

  setUp(() {
    _mockFirebaseAuth = MockFirebaseAuth();
    _mockGoogleSignIn = MockGoogleSignIn();
    _authFacade = FirebaseAuthFacade(
      _mockFirebaseAuth,
      _mockGoogleSignIn,
    );
  });

  group('when [FirebaseAuthFacade.registerWithEmailAndPassword]', () {
    Future<void> _registerWithEmailAndPassword(
      EmailAddress email,
      Password password,
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

    final email = EmailAddress('test@vethx.com');

    final password = Password('dGVzdEB2ZXRoeC5jb20K');

    test(
      'should return [AuthFailure.emailAlreadyInUse()] when firebase throw the exception code [email-already-in-use]',
      () async {
        // arrange

        final firebaseException =
            PlatformException(code: 'email-already-in-use');

        const expectedFailure = AuthFailure.emailAlreadyInUse();

        // act && assert

        await _registerWithEmailAndPassword(
          email,
          password,
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
          email,
          password,
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
        // ignore: null_argument_to_non_null_type
      ).thenAnswer((_) => Future.value(any));

      // act

      final result = await _authFacade.registerWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );

      // assert

      expect(result, right(unit));
    });
  });
}
