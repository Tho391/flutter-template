import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/database/database_helper.dart';
import '../core/environment/environment_config.dart';
import '../core/logging/logging.dart';
import 'app.dart';

FutureOr<void> main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the logger
  Logging.info('Initializing the app');

  // Load the environment data
  await EnvironmentConfig.load();

  // Initialize the database
  try {
    await DatabaseHelper.instance.database;
    Logging.info('Database initialized successfully');
  } catch (e, stack) {
    Logging.handleError(e, stack);
  }

  // Run the app
  runApp(const ProviderScope(child: App()));
}
