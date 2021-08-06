class Logger {
  static void e(String message, {dynamic ex, required StackTrace stacktrace}) {
    //https://dev.to/mhadaily/how-to-capture-errors-and-send-platform-specific-information-to-sentry-in-flutter-4l6m

    // reportError(ex, stacktrace, message: message);

    // ignore: leading_newlines_in_multiline_strings
    print('''\nLogger | Message: $message 
             \nException: ${ex.toString()} 
             \nStacktrace: ${stacktrace.toString()} ''');
    //  \nDeviceInfo: ${sl<DeviceInfo>().data()}""");
  }

  static void i(String message) {
    // if (message.contains("DeviceBluetoothRepository")) {
    //   return;
    // }
    print('\nLogger | $message');
  }
}
