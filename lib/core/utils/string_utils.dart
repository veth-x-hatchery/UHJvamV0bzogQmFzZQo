class StringUtils {
  static double tratarValorMonetario(String valor) {
    return double.parse(
        valor.replaceAll('.', '').replaceAll(',', '').replaceAll('R\$', ''));
  }

  static String tratarRetornoEmHTML(String valor) {
    final exp = RegExp(
      // ignore: unnecessary_raw_strings
      r'<[^>]*>',
      multiLine: true,
      caseSensitive: true,
    );
    return valor
        .replaceAll('<br />', '\n')
        .replaceAll(exp, '')
        .replaceAll('&nbsp;', '');
  }
}
