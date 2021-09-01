import 'package:vethx_beta/l10n/l10n.dart';

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

  final String invalidCredentialTextErrorText =
      context.l10n.signin_invalidCredential;
  final String invalidSecretTextErrorText = context.l10n.signin_invalidSecret;
}
