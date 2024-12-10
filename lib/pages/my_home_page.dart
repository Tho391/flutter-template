import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // For permission handling

import '../app/flavors.dart'; // Assuming you are using F class for flavors
import '../core/logging/logging.dart'; // Importing the Logging class

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // Function to request Bluetooth permissions
  Future<void> requestBluetoothPermission() async {
    final status = await Permission.bluetooth.request();
    if (status.isGranted) {
      Logging.info("Bluetooth permission granted.");
    } else {
      Logging.error("Bluetooth permission denied.");
    }
  }

  // Function to request notifications permission
  Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    if (status.isGranted) {
      Logging.info("Notification permission granted.");
    } else {
      Logging.error("Notification permission denied.");
    }
  }

  // Function to request external storage permissions
  Future<void> requestStoragePermission() async {
    final status = await [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();

    if (status[Permission.storage]?.isGranted ?? false) {
      Logging.info("Storage permission granted.");
    } else {
      Logging.error("Storage permission denied.");
    }
  }

  // Function to request camera permission
  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      Logging.info("Camera permission granted.");
    } else {
      Logging.error("Camera permission denied.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title), // Using title from F class
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Hello ${F.title}', // Displaying title dynamically
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: requestBluetoothPermission,
              child: const Text('Request Bluetooth Permission'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: requestNotificationPermission,
              child: const Text('Request Notification Permission'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: requestStoragePermission,
              child: const Text('Request Storage Permission'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: requestCameraPermission,
              child: const Text('Request Camera Permission'),
            ),
          ],
        ),
      ),
    );
  }
}
