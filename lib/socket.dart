import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  SocketClient() {
    this.io.connect();
    this.io.onConnect((data) => print('IO socket connected!'));
    this.io.onConnectError((data) => print(data));
  }

  final io = IO.io(
      "http://127.0.0.1:3050",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());
}
