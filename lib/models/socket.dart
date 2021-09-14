import 'package:get_it/get_it.dart';
import 'package:projete_app/models/user.dart';
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
    var navService = GetIt.instance.get<UserModel>();
    navService.onUserDisconnect();
  }

  final io = IO.io(
      "http://127.0.0.1:3050",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());
}
