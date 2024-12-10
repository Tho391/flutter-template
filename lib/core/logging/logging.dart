import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// Logging class that handles all types of logs in the app (general logs, Dio HTTP logs, etc.)
class Logging {
  // Talker instance for general logging
  static Talker talker = TalkerFlutter.init(
    settings: TalkerSettings(
      colors: {
        'info': AnsiPen()..blue(),
        'warning': AnsiPen()..yellow(),
        'error': AnsiPen()..red(),
        'critical': AnsiPen()..magenta(),
      },
      titles: {
        'info': 'Info',
        'warning': 'Warning',
        'error': 'Error',
        'critical': 'Critical',
      },
    ),
  );

  // TalkerLogger instance for structured log levels
  static TalkerLogger logger = TalkerLogger(
    settings: TalkerLoggerSettings(level: LogLevel.info),
  );

  // Dio Logger for HTTP request/response logging
  static TalkerDioLogger dioLogger = TalkerDioLogger(talker: talker);

  /// Simple log methods for info, warning, and error levels.
  static void info(String message) {
    talker.info(message);
  }

  static void warning(String message) {
    talker.warning(message);
  }

  static void error(String message) {
    talker.error(message);
  }

  /// Log with a specific level.
  static void log(String message, {LogLevel level = LogLevel.info}) {
    logger.log(message, level: level);
  }

  /// Global error handler for uncaught exceptions.
  static void handleError(Object error, StackTrace stack) {
    talker.handle(error, stack, 'Uncaught exception');
  }

  /// Configure Dio with TalkerDioLogger to log HTTP requests and responses.
  static Dio configureDio() {
    final dio = Dio();
    dio.interceptors.add(dioLogger);
    return dio;
  }
}
