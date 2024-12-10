import 'package:socket_io_client/socket_io_client.dart' as io;

import '../constants/app_constants.dart';
import '../logging/logging.dart';

class SocketService {
  late io.Socket socket;

  void connectToServer() {
    // Connect to the Socket.IO server using the baseSocketUrl
    socket = io.io(
      AppConstants.baseSocketUrl, // Use baseSocketUrl from AppConstants
      io.OptionBuilder()
          .setTransports(['websocket']) // Specify transports
          .enableForceNew() // Force a new connection
          .build(),
    );

    // Listen for connection
    socket.on('connect', (_) {
      Logging.info('Connected to the server');
    });

    // Handle custom events
    socket.on('event_name', (data) {
      Logging.info('Received data: $data');
    });

    // Listen for disconnection
    socket.on('disconnect', (_) {
      Logging.info('Disconnected from server');
    });
  }

  void sendMessage(String event, dynamic data) {
    socket.emit(event, data);
  }

  void disconnect() {
    socket.disconnect();
  }
}
