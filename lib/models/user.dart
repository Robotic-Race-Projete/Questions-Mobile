import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/dto/sessionDto.dart';
import 'package:projete_app/screens/menu.dart';
import 'package:projete_app/services/socket.dart';
import 'package:get/get.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class UserModel extends ChangeNotifier {
  
  bool isRegistred = false;
  SessionDto? session;

  final socketClient = GetIt.instance.get<SocketClient>();

  UserModel() {
    socketClient.io.onDisconnect((data) => this.onUserDisconnect());
    socketClient.io.on('session', (data) {
      this.session = SessionDto.fromJson(data);
      this.onUserRegistered();
    });
  }


  void setNickname (String newNickname) {
    if (isRegistred) return;

    Map<String, dynamic> request = {
      "nickname": newNickname
    };
    socketClient.io.emit('start_session', request);
    socketClient.io.on('exception', (data) {
      print(data);
    });
  }

  void onUserRegistered () {
    if (isRegistred) return;

    isRegistred = true;

    this.notifyListeners();
  }

  void onUserDisconnect () {
    session = null;
    isRegistred = false;

    Get.to(() => MenuPage());
  }
}