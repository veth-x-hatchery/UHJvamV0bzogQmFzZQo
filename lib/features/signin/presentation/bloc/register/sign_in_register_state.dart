part of 'sign_in_register_bloc.dart';

@freezed
class SignInRegisterState with _$SignInRegisterState {
  const factory SignInRegisterState({
    required Credential credential,
    required Secret secret,
    required bool isLoading,
    required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
  }) = _RegisterState;
  factory SignInRegisterState.initial() => SignInRegisterState(
        credential: Credential(''),
        secret: Secret(''),
        isLoading: false,
        authFailureOrSuccessOption: none(),
      );
}
