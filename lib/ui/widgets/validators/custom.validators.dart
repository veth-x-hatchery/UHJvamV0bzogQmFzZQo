import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
  final StringValidator credentialValidator = NonEmptyStringValidator();
  final StringValidator secretValidator = NonEmptyStringValidator();
  final StringValidator confirmSecretValidator = NonEmptyStringValidator();

  final String invalidCredentialTextErrorText = Texts.invalidCredential;
  final String invalidSecretTextErrorText = Texts.invalidSecret;
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange > 0,
            'O valor para DecimalTextInputFormatter precisa ser maior que ZERO');

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    final String value = newValue.text;

    if (value.contains('.') &&
        value.substring(value.indexOf('.') + 1).length > decimalRange) {
      truncated = oldValue.text;
      newSelection = oldValue.selection;
    } else if (value == '.') {
      truncated = '0.';

      newSelection = newValue.selection.copyWith(
        baseOffset: math.min(truncated.length, truncated.length + 1),
        extentOffset: math.min(truncated.length, truncated.length + 1),
      );
    }

    return TextEditingValue(
      text: truncated,
      selection: newSelection,
    );
  }
}
