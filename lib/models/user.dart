import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/models/navigation.dart';
import 'package:projete_app/models/socket.dart';

class UserModel extends ChangeNotifier {
  UserModel();

  bool isRegistred = false;
  String nickname = "";

  void setNickname (String newNickname) {
    if (isRegistred) return;

    var socketClient = GetIt.instance.get<SocketClient>();

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

    var navService = GetIt.instance.get<NavigationService>();
    navService.navigateTo('/');
  }
}