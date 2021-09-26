import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  SocketClient() {
    this.io.connect();
    this.io.onConnect((data) => print('IO socket connected!'));
    this.io.onConnectError((data) => print(data));
    this.io.onDisconnect(this.onDisconnect);
  }

  void onDisconnect (dynamic) {
    print('IO socket disconnected!');
  }

  final io = IO.io(
      // "http://:3050",c
      "http://192.168.0.109:3050",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());
}
