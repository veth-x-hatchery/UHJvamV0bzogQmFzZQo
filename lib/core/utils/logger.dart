enum ArchitectureLayer {
  presentation,
  domain,
  infrastructure,
}

class Logger {
  Logger.presentation(
    String message, {
    dynamic exception,
    StackTrace? stackTrace,
  }) {
    if (exception != null) {
      Logger.e(
        message,
        ex: exception,
        stacktrace: stackTrace,
      );
    } else {
      Logger.i(message);
    }
  }

  Logger.domain(
    String message, {
    dynamic exception,
    StackTrace? stackTrace,
  }) {
    if (exception != null) {
      Logger.e(
        message,
        ex: exception,
        stacktrace: stackTrace,
        layer: ArchitectureLayer.domain,
      );
    } else {
      Logger.i(
        message,
        layer: ArchitectureLayer.domain,
      );
    }
    Logger.i(message, layer: ArchitectureLayer.domain);
  }

  Logger.infrastructure(
    String message, {
    dynamic exception,
    StackTrace? stackTrace,
  }) {
    if (exception != null) {
      Logger.e(
        message,
        ex: exception,
        stacktrace: stackTrace,
        layer: ArchitectureLayer.infrastructure,
      );
    } else {
      Logger.i(
        message,
        layer: ArchitectureLayer.infrastructure,
      );
    }
    Logger.i(message, layer: ArchitectureLayer.infrastructure);
  }

  static void e(
    String message, {
    dynamic ex,
    StackTrace? stacktrace,
    ArchitectureLayer layer = ArchitectureLayer.presentation,
  }) {
    //https://dev.to/mhadaily/how-to-capture-errors-and-send-platform-specific-information-to-sentry-in-flutter-4l6m

    // reportError(ex, stacktrace, message: message);

    // ignore: leading_newlines_in_multiline_strings, avoid_print
    print('''\nLogger | Message: $message 
             \nException: ${ex.toString()} 
             \nStacktrace: ${stacktrace.toString()}\n''');
    //  \nDeviceInfo: ${sl<DeviceInfo>().data()}""");
  }

  static void i(
    String message, {
    ArchitectureLayer layer = ArchitectureLayer.presentation,
  }) {
    // ignore: avoid_print
    print('\nLogger | $message\n');
  }
}
