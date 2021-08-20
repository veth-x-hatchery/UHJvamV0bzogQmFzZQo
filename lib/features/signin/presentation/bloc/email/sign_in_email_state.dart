part of 'sign_in_email_bloc.dart';

@freezed
class SignInEmailState with _$SignInEmailState {
  const factory SignInEmailState({
    required EmailAddress email,
    required bool isLoading,
    required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
  }) = _EmailState;
  factory SignInEmailState.initial() => SignInEmailState(
        email: EmailAddress(''),
        isLoading: false,
        authFailureOrSuccessOption: none(),
      );
}
