export 'login/field_email.widget.dart';
export 'login/field_password.widget.dart';
export 'login/sign_in_button.widget.dart';
export 'login/sign_in_scaffold.widget.dart';

class SignInPageKeys {
  //! sign in options

  static const signInWithGoogleButton = 'signInWithGoogleButton';
  static const signInWithEmail = 'signInWithEmail';

  //! sign in email page

  static const signInEmailPageValidateButton = 'signInEmailPageValidateButton';
  static const signInEmailPageEmailTextField = 'signInEmailPageEmailTextField';

  //! sign in password page

  static const String signInPasswordPagePasswordTextField =
      'signInPasswordPagePasswordTextField';

  static const String signInPasswordPageValidateButton =
      'signInPasswordPageValidateButton';

  //! sign in register page
  static const String signInRegisterPageEmailTextField =
      'signInRegisterPageEmailTextField';

  static const String signInRegisterPagePasswordTextField =
      'signInRegisterPagePasswordTextField';

  static const String signInRegisterPageValidateButton =
      'signInRegisterPageValidateButton';
}
