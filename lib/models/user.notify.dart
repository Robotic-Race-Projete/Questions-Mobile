import 'package:flutter/material.dart';
import 'package:projete_app/socket.dart';
import 'package:get_it/get_it.dart';

class UserModel extends ChangeNotifier {
  String nickname = "";
  bool isUserSet = false;

  void setNickname (String newNickname) {
    if (isUserSet) return;

    var socketClient = GetIt.I.get<SocketClient>();

    Map<String, dynamic> request = {
      "nickname": newNickname
    };
    socketClient.io.emit('start_session', request);
    socketClient.io.on('log', (data) {
      if (isUserSet) return;
      this.nickname = newNickname;
      isUserSet = true;

      this.notifyListeners();
    });
    socketClient.io.on('exception', (data) {
      print(data);
    });
  }
}