part of 'sign_in_secret_bloc.dart';

@freezed
class SignInSecretState with _$SignInSecretState {
  const factory SignInSecretState({
    required Secret secret,
    required bool isLoading,
    required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
  }) = _SecretState;
  factory SignInSecretState.initial() => SignInSecretState(
        secret: Secret(''),
        isLoading: false,
        authFailureOrSuccessOption: none(),
      );
}
