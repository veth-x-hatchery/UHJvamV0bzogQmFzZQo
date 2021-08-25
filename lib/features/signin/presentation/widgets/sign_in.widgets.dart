export 'login/field_credential.widget.dart';
export 'login/field_secret.widget.dart';
export 'login/sign_in_button.widget.dart';
export 'login/sign_in_scaffold.widget.dart';

class SignInPageKeys {
  //! shared
  static const signInBackPageButton = 'signInBackPageButton';

  //! sign in options

  static const signInLoader = 'signInLoader';
  static const signInWithGoogleButton = 'signInWithGoogleButton';
  static const signInWithCredential = 'signInWithCredential';

  //! sign in credential page

  static const signInCredentialPageValidateButton =
      'signInCredentialPageValidateButton';
  static const signInCredentialPageCredentialTextField =
      'signInCredentialPageCredentialTextField';

  //! sign in secret page

  static const String signInSecretPageFormColumn = 'signInSecretPageFormColumn';

  static const String signInSecretPageSecretTextField =
      'signInSecretPageSecretTextField';

  static const String signInSecretPageValidateButton =
      'signInSecretPageValidateButton';

  static const String signInChangeCredentialButton =
      'signInChangeCredentialButton';

  static const String signInsecretResetButton = 'signInsecretResetButton';

  //! sign in register page
  static const String signInRegisterPageCredentialTextField =
      'signInRegisterPageCredentialTextField';

  static const String signInRegisterPageSecretTextField =
      'signInRegisterPageSecretTextField';

  static const String signInRegisterPageValidateButton =
      'signInRegisterPageValidateButton';
}
