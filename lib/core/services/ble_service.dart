import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_template/core/logging/logging.dart';

class BLEService {
  static final BLEService _instance = BLEService._internal();

  factory BLEService() => _instance;

  BLEService._internal();

  late StreamSubscription<BluetoothAdapterState> _adapterStateSubscription;
  BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;

  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;

  bool get isScanning => FlutterBluePlus.isScanningNow;

  BluetoothAdapterState get adapterState => _adapterState;

  /// Initialize the Bluetooth service and start listening to Bluetooth adapter state changes.
  Future<void> initialize() async {
    // Set the logging level to verbose
    FlutterBluePlus.setLogLevel(LogLevel.verbose);

    // Start listening to adapter state changes
    _adapterStateSubscription = FlutterBluePlus.adapterState.listen((state) {
      _adapterState = state;
      Logging.info('Bluetooth adapter state changed: $_adapterState');
    });
  }

  /// Starts scanning for BLE devices with optional filters.
  Future<void> startScan({
    List<Guid> withServices = const [],
    List<String> withRemoteIds = const [],
    List<String> withNames = const [],
    Duration? timeout,
  }) async {
    if (isScanning) {
      Logging.warning('Scan is already in progress.');
      return;
    }

    try {
      Logging.info('Starting scan for devices...');
      await FlutterBluePlus.startScan(
        withServices: withServices,
        withRemoteIds: withRemoteIds,
        withNames: withNames,
        timeout: timeout,
      );
    } catch (e) {
      Logging.error('Error starting scan: $e');
    }
  }

  /// Stops the current scan if it's in progress.
  Future<void> stopScan() async {
    if (!isScanning) {
      Logging.warning('Scan is not currently in progress.');
      return;
    }

    try {
      Logging.info('Stopping scan...');
      await FlutterBluePlus.stopScan();
    } catch (e) {
      Logging.error('Error stopping scan: $e');
    }
  }

  /// Connect to a BLE device using the given device ID.
  Future<void> connectToDevice(BluetoothDevice device) async {
    try {
      Logging.info('Connecting to device: ${device.remoteId}');
      await device.connect();
      Logging.info('Device connected: ${device.remoteId}');
    } catch (e) {
      Logging.error('Error connecting to device: $e');
    }
  }

  /// Disconnect from the currently connected device.
  Future<void> disconnectDevice(BluetoothDevice device) async {
    try {
      Logging.info('Disconnecting from device: ${device.remoteId}');
      await device.disconnect();
      Logging.info('Device disconnected: ${device.remoteId}');
    } catch (e) {
      Logging.error('Error disconnecting from device: $e');
    }
  }

  /// Get a list of connected devices.
  List<BluetoothDevice> getConnectedDevices() {
    try {
      Logging.info('Getting list of connected devices...');
      List<BluetoothDevice> devices = FlutterBluePlus.connectedDevices;
      Logging.info('Connected devices: $devices');
      return devices;
    } catch (e) {
      Logging.error('Error getting connected devices: $e');
      return [];
    }
  }

  /// Get the current state of the Bluetooth adapter.
  BluetoothAdapterState getAdapterState() {
    return _adapterState;
  }

  /// Dispose the BLEService to cancel subscriptions.
  void dispose() {
    _adapterStateSubscription.cancel();
  }
}
