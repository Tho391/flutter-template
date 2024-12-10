import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../app/flavors.dart';
import '../../core/logging/logging.dart';

class EnvironmentManager {
  static Future<void> loadEnvironmentData() async {
    String environmentName = "dev";

    final flavor = F.appFlavor;
    switch (flavor) {
      case null:
        environmentName = "dev";
        break;
      case Flavor.dev:
        environmentName = "dev";
        break;
      case Flavor.qa:
        environmentName = "qa";
        break;
      case Flavor.prod:
        environmentName = "prod";
        break;
    }

    try {
      // Load the environment variables
      await dotenv.load(fileName: '.env/.env.$environmentName');
    } catch (e) {
      // Use the Logging class for error logging
      Logging.error("Error loading .env file: $e");
      // Optionally handle the error (e.g., fallback to dev)
      await dotenv.load(fileName: '.env/.env.dev');
    }
  }
}
