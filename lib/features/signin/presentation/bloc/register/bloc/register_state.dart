part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    required EmailAddress email,
    required Password password,
    required bool isLoading,
    required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
  }) = _RegisterState;
  factory RegisterState.initial() => RegisterState(
        email: EmailAddress(''),
        password: Password(''),
        isLoading: false,
        authFailureOrSuccessOption: none(),
      );
}
