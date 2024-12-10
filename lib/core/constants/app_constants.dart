import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static String get baseUrl => dotenv.env['BASE_SOCKET_URL'] ?? '';

  static String get baseSocketUrl => dotenv.env['BASE_SOCKET_URL'] ?? '';
}
