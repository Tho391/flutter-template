import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/notification_service.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';

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

  // Initialize notifications
  await NotificationService.initialize();
  await NotificationService.showNotification();

  // Run the app
  runApp(ProviderScope(
    observers: [
      TalkerRiverpodObserver(
        talker: Logging.talker,
      ),
    ],
    child: App(),
  ));
}
