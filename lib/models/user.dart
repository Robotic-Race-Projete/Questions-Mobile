import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/screens/menu.dart';
import 'package:projete_app/services/socket.dart';
import 'package:get/get.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class UserModel extends ChangeNotifier {
  
  bool isRegistred = false;
  String nickname = "";

  final socketClient = GetIt.instance.get<SocketClient>();

  UserModel() {
    socketClient.io.onDisconnect((data) => this.onUserDisconnect());
  }


  void setNickname (String newNickname) {
    if (isRegistred) return;

    Map<String, dynamic> request = {
      "nickname": newNickname
    };
    socketClient.io.emit('start_session', request);
    socketClient.io.on('log', (data) {
      if (isRegistred) return;
      this.nickname = newNickname;
      isRegistred = true;

      this.notifyListeners();
    });
    socketClient.io.on('exception', (data) {
      print(data);
    });
  }

  void onUserDisconnect () {
    nickname = "";
    isRegistred = false;

    Get.to(() => MenuPage());
  }
}