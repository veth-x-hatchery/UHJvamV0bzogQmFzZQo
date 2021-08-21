part of 'sign_in_secret_bloc.dart';

@freezed
class SignInPasswordState with _$SignInPasswordState {
  const factory SignInPasswordState({
    required Password secret,
    required bool isLoading,
    required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
  }) = _PasswordState;
  factory SignInPasswordState.initial() => SignInPasswordState(
        secret: Password(''),
        isLoading: false,
        authFailureOrSuccessOption: none(),
      );
}
