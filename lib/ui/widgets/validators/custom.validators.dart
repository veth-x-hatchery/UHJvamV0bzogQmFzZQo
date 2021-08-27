import 'package:vethx_beta/core/consts/vethx_connect_texts.dart';

abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class CredentialAndSecretValidators {
  // final StringValidator credentialValidator = NonEmptyStringValidator();
  // final StringValidator secretValidator = NonEmptyStringValidator();
  // final StringValidator confirmSecretValidator = NonEmptyStringValidator();

  final String invalidCredentialTextErrorText = Texts.invalidCredential;
  final String invalidSecretTextErrorText = Texts.invalidSecret;
}
