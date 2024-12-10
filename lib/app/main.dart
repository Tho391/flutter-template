import 'dart:async';

import 'package:flutter/material.dart';

import '../core/database/database_helper.dart';
import '../core/logging/logging.dart';
import 'app.dart';

FutureOr<void> main() async {
  // Initialize the logger
  Logging.info('Initializing the app');

  // Initialize the database
  try {
    await DatabaseHelper.instance.database;
    Logging.info('Database initialized successfully');
  } catch (e, stack) {
    Logging.handleError(e, stack);
  }

  // Run the app
  runApp(const App());
}
