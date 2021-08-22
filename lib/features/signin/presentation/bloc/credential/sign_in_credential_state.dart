part of 'sign_in_credential_bloc.dart';

@freezed
class SignInCredentialState with _$SignInCredentialState {
  const factory SignInCredentialState({
    required Credential credential,
    required bool isLoading,
    required Option<Either<FailureDetails, Unit>> authFailureOrSuccessOption,
    required Option<VethxNotification> notification,
  }) = _CredentialState;
  factory SignInCredentialState.initial() => SignInCredentialState(
        credential: Credential(''),
        isLoading: false,
        authFailureOrSuccessOption: none(),
        notification: none(),
      );
}
