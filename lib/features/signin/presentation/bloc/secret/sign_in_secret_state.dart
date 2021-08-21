part of 'sign_in_password_bloc.dart';

@freezed
class SignInPasswordState with _$SignInPasswordState {
  const factory SignInPasswordState({
    required Password password,
    required bool isLoading,
    required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
  }) = _PasswordState;
  factory SignInPasswordState.initial() => SignInPasswordState(
        password: Password(''),
        isLoading: false,
        authFailureOrSuccessOption: none(),
      );
}
