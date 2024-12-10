import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../logging/logging.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Initialize the notification plugin
  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  // Show notification only in debug mode
  static Future<void> showNotification() async {
    if (kDebugMode) {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'debug_notification_channel',
        'Debug Notifications',
        channelDescription: 'Notifications for debug mode',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      );
      const NotificationDetails notificationDetails =
          NotificationDetails(android: androidDetails);

      await _flutterLocalNotificationsPlugin.show(
        0, // Notification ID
        'Debug Notification',
        'This is a debug notification!',
        notificationDetails,
        payload: 'debug_payload', // Optional: You can pass data to the screen
      );
    }
  }

  // Handle notification tap
  static Future<void> onDidReceiveNotificationResponse(
      NotificationResponse response) async {
    final String? payload = response.payload;
    if (payload != null) {
      // Use logging instead of print
      Talker talker = TalkerFlutter.init();
      talker.info('Notification payload: $payload');

      // Get the context and navigate to TalkerScreen
      _navigateToTalkerScreen();
    }
  }

  // Example navigation logic using a GlobalKey
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void _navigateToTalkerScreen() {
    if (navigatorKey.currentState != null) {
      navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(
            builder: (context) => TalkerScreen(
                  talker: Logging.talker,
                )),
      );
    }
  }

  // Cancel a specific notification by ID
  static Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  // Cancel all notifications
  static Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
