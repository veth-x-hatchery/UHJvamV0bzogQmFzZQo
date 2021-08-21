part of 'sign_in_credential_bloc.dart';

@freezed
class SignInCredentialState with _$SignInCredentialState {
  const factory SignInCredentialState({
    required CredentialAddress credential,
    required bool isLoading,
    required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
  }) = _CredentialState;
  factory SignInCredentialState.initial() => SignInCredentialState(
        credential: CredentialAddress(''),
        isLoading: false,
        authFailureOrSuccessOption: none(),
      );
}
