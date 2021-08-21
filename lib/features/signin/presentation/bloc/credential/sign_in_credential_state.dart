part of 'sign_in_credential_bloc.dart';

@freezed
class SignInEmailState with _$SignInEmailState {
  const factory SignInEmailState({
    required EmailAddress credential,
    required bool isLoading,
    required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
  }) = _EmailState;
  factory SignInEmailState.initial() => SignInEmailState(
        credential: EmailAddress(''),
        isLoading: false,
        authFailureOrSuccessOption: none(),
      );
}
