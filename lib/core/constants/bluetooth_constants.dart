class BluetoothConstants {
  static const String heartRateServiceUuid =
      "180D"; // Example UUID for Heart Rate Service
  static const String heartRateMeasurementCharacteristicUuid =
      "2A37"; // Heart Rate Measurement

  // Bluetooth Classic UUIDs (for example)
  static const String classicDeviceUuid =
      "00001101-0000-1000-8000-00805f9b34fb"; // Serial Port Profile (SPP)

  // Bluetooth Permissions
  static const String bluetoothPermission = "android.permission.BLUETOOTH";
  static const String bluetoothAdminPermission =
      "android.permission.BLUETOOTH_ADMIN";
  static const String bluetoothScanPermission =
      "android.permission.BLUETOOTH_SCAN";
  static const String bluetoothConnectPermission =
      "android.permission.BLUETOOTH_CONNECT";
}
