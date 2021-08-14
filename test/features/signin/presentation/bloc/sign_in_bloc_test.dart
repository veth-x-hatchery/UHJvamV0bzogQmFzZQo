import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_check_email.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:vethx_login/features/signin/domain/usecases/sign_in_with_google.dart';
import 'package:vethx_login/features/signin/presentation/bloc/sign_in_bloc.dart';

import 'sign_in_bloc_test.mocks.dart';

@GenerateMocks([
  SignInCheckIfEmailIsInUse,
  SignInWithEmailAndPassword,
  SignInWithGoogle,
])
void main() {
  late SignInBloc _bloc;

  late MockSignInWithEmailAndPassword _mockSignInWithEmailAndPassword;
  late MockSignInWithGoogle _mockSignInWithGoogle;
  late MockSignInCheckIfEmailIsInUse _mockSignInCheckIfEmailIsInUse;

  setUp(() {
    _mockSignInWithEmailAndPassword = MockSignInWithEmailAndPassword();
    _mockSignInWithGoogle = MockSignInWithGoogle();
    _mockSignInCheckIfEmailIsInUse = MockSignInCheckIfEmailIsInUse();
    _bloc = SignInBloc(
      signInCheckIfEmailIsInUse: _mockSignInCheckIfEmailIsInUse,
      signInWithEmailAndPassword: _mockSignInWithEmailAndPassword,
      signInWithGoogle: _mockSignInWithGoogle,
    );
  });

  test('initialState should be SignInInitial', () {
    // assert
    expect(_bloc.state, equals(SignInInitial()));
  });
}
