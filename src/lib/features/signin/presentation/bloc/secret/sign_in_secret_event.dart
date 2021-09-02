part of 'sign_in_secret_bloc.dart';

@freezed
class SignInSecretEvent with _$SignInSecretEvent {
  const factory SignInSecretEvent.secretChanged(String secretStr) =
      SecretChanged;
  const factory SignInSecretEvent.analyseSecretPressed() = AnalyseSecretPressed;
}
