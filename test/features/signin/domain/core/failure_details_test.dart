import 'package:flutter_test/flutter_test.dart';
import 'package:vethx_beta/core/utils/logger.dart';
import 'package:vethx_beta/features/signin/domain/core/failures_details.dart';
import 'package:vethx_beta/features/signin/domain/services/auth_failure.dart';
import 'package:vethx_beta/features/signin/domain/usecases/sign_in_check_credential.dart';
import 'package:vethx_beta/l10n/l10n.dart';

typedef Converter<String> = String? Function(int x);

extension ConverterX on Converter<String> {
  String? translate(int x) => this.call(x);
}

void main() {
  test('should compare then ensure that are equal objects', () {
    // Todo(v): closures hashmap...

    Converter<String> unavailable() => (x) => x.toString();

    final asdf1 = unavailable();
    final asdf2 = unavailable();

    Logger.tests('''

      asdf1: ${asdf1.hashCode}
      asdf2: ${asdf2.hashCode}

    ''');

    final asdf3 = unavailable().translate(123);
    final asdf4 = unavailable().translate(123);

    Logger.tests('''

      asdf3: ${asdf3.hashCode}
      asdf4: ${asdf4.hashCode}

    ''');

    expect(asdf3, asdf4);
  });
}
