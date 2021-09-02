import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:vethx_beta/l10n/l10n.dart';

typedef Converter<String> = String? Function(dynamic x);

extension ConverterX on Converter<String> {
  String? translate(dynamic x) => this.call(x);
}

void main() {
  test('should compare then ensure that are equal objects', () {
    Converter<String> x1() => (x) => 'x1: $x';
    Converter<String> x2() => (x) => 'x1: $x';

    Logger.tests('''
      asdf1: ${x1()(0).hashCode}
      asdf2: ${x2()(0).hashCode}

    ''');
    expect(x1()(0), x2()(0));
  });
}
