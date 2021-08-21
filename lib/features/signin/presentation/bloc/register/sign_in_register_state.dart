part of 'sign_in_register_bloc.dart';

@freezed
class SignInRegisterState with _$SignInRegisterState {
  const factory SignInRegisterState({
    required EmailAddress credential,
    required Password password,
    required bool isLoading,
    required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
  }) = _RegisterState;
  factory SignInRegisterState.initial() => SignInRegisterState(
        credential: EmailAddress(''),
        password: Password(''),
        isLoading: false,
        authFailureOrSuccessOption: none(),
      );
}
