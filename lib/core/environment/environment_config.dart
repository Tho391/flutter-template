import 'environment_manager.dart';

class EnvironmentConfig {
  static Future<void> load() async {
    // Load the environment settings based on the app's flavor (dev, qa, prod)
    await EnvironmentManager.loadEnvironmentData();
  }
}
