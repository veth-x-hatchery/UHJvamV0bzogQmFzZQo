export 'login/field_credential.widget.dart';
export 'login/field_password.widget.dart';
export 'login/sign_in_button.widget.dart';
export 'login/sign_in_scaffold.widget.dart';

class SignInPageKeys {
  //! sign in options

  static const signInWithGoogleButton = 'signInWithGoogleButton';
  static const signInWithCredential = 'signInWithCredential';

  //! sign in credential page

  static const signInCredentialPageValidateButton =
      'signInCredentialPageValidateButton';
  static const signInCredentialPageCredentialTextField =
      'signInCredentialPageCredentialTextField';

  //! sign in password page

  static const String signInPasswordPagePasswordTextField =
      'signInPasswordPagePasswordTextField';

  static const String signInPasswordPageValidateButton =
      'signInPasswordPageValidateButton';

  //! sign in register page
  static const String signInRegisterPageCredentialTextField =
      'signInRegisterPageCredentialTextField';

  static const String signInRegisterPagePasswordTextField =
      'signInRegisterPagePasswordTextField';

  static const String signInRegisterPageValidateButton =
      'signInRegisterPageValidateButton';
}
