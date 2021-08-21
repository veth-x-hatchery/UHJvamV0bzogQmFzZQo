part of 'sign_in_register_bloc.dart';

@freezed
class SignInRegisterState with _$SignInRegisterState {
  const factory SignInRegisterState({
    required CredentialAddress credential,
    required Password password,
    required bool isLoading,
    required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
  }) = _RegisterState;
  factory SignInRegisterState.initial() => SignInRegisterState(
        credential: CredentialAddress(''),
        password: Password(''),
        isLoading: false,
        authFailureOrSuccessOption: none(),
      );
}
