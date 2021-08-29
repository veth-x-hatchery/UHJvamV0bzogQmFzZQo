import 'dart:convert';

enum ArchitectureLayer {
  presentation,
  domain,
  infrastructure,
  utils,
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
  }

  Logger.bloc(
    String message, {
    dynamic exception,
    StackTrace? stackTrace,
    bool jsonMessage = false,
  }) {
    if (jsonMessage) {
      // ignore: avoid_print
      print(prettyJson(message, indent: 4));
    } else {
      Logger.presentation(
        '[BLoC] $message',
        exception: exception,
        stackTrace: stackTrace,
      );
    }
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

  Logger.serviceLocator(
    String message, {
    dynamic exception,
    StackTrace? stackTrace,
  }) {
    Logger.presentation(
      '[Service Locator] $message',
      exception: exception,
      stackTrace: stackTrace,
    );
  }

  Logger.tests(
    String message, {
    dynamic exception,
    StackTrace? stackTrace,
  }) {
    Logger.presentation(
      '[Tests] $message',
      exception: exception,
      stackTrace: stackTrace,
    );
  }

  Logger.testStep(
    String message, {
    dynamic exception,
    StackTrace? stackTrace,
  }) {
    Logger.tests(
      '[Step] $message',
      exception: exception,
      stackTrace: stackTrace,
    );
  }

  Logger.utils(
    String message, {
    dynamic exception,
    StackTrace? stackTrace,
    bool jsonMessage = false,
  }) {
    if (exception != null) {
      Logger.e(
        '[Utils] $message',
        ex: exception,
        stacktrace: stackTrace,
        layer: ArchitectureLayer.utils,
      );
    } else {
      if (jsonMessage) {
        // ignore: avoid_print
        print(prettyJson(message, indent: 4));
      }
      Logger.i(
        '[Utils] $message',
        layer: ArchitectureLayer.utils,
      );
    }
  }

  String prettyJson(dynamic json, {int indent = 2}) {
    final spaces = ' ' * indent;
    final encoder = JsonEncoder.withIndent(spaces);
    return encoder.convert(json);
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
    print('''\n══╡ Logger ╞════════════════════════════════════════════════════
             \nLogger: $layer
             \nMessage: $message 
             \nException: ${ex.toString()} 
             \nStacktrace: ${stacktrace.toString()}\n
             \n════════════════════════════════════════════════════════════════''');
  }

  static void i(
    String message, {
    ArchitectureLayer layer = ArchitectureLayer.presentation,
  }) {
    // ignore: avoid_print, leading_newlines_in_multiline_strings
    print('''\n══╡ Logger ╞═════════════════════════════════════════════════════
             \nLogger: $layer
             \nMessage: $message
             \n═════════════════════════════════════════════════════════════════''');
  }
}
