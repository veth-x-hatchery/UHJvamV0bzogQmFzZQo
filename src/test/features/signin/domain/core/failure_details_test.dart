import 'package:flutter_test/flutter_test.dart';
import 'package:hatchery/core/utils/logger.dart';

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
