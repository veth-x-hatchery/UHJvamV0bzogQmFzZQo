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

  Logger.bloc(
    String message, {
    dynamic exception,
    StackTrace? stackTrace,
  }) {
    Logger.presentation(
      '[BLoC] $message',
      exception: exception,
      stackTrace: stackTrace,
    );
  }

  Logger.widget(
    String message, {
    dynamic exception,
    StackTrace? stackTrace,
  }) {
    Logger.presentation(
      '[Widget] $message',
      exception: exception,
      stackTrace: stackTrace,
    );
  }

  static void e(
    String message, {
    dynamic ex,
    StackTrace? stacktrace,
    ArchitectureLayer layer = ArchitectureLayer.presentation,
  }) {
    //https://dev.to/mhadaily/how-to-capture-errors-and-send-platform-specific-information-to-sentry-in-flutter-4l6m
    // reportError(ex, stacktrace, message: message);
    // ignore: avoid_print, leading_newlines_in_multiline_strings
    print('''\nLogger: $layer
             \nMessage: $message 
             \nException: ${ex.toString()} 
             \nStacktrace: ${stacktrace.toString()}\n''');
  }

  static void i(
    String message, {
    ArchitectureLayer layer = ArchitectureLayer.presentation,
  }) {
    // ignore: avoid_print, leading_newlines_in_multiline_strings
    print('''\nLogger: $layer
             \nMessage: $message''');
  }
}
