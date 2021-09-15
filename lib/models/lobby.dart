import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/dto/lobbyDto.dart';
import 'package:projete_app/dto/playerDto.dart';
import 'package:projete_app/screens/lobby.dart';
import 'package:projete_app/screens/menu.dart';
import 'package:projete_app/services/socket.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class LobbyModel extends ChangeNotifier {

  bool isOnLobby = false;
  LobbyDto? lobby;

  final SocketClient socketClient = GetIt.instance.get<SocketClient>();

  LobbyModel() {
    socketClient.io.on(
      'session', 
      (data) => onLobbyUpdate(
        LobbyDto.fromJson(data)
      )
    );

    socketClient.io.on('lobby', (data) => Get.snackbar(
      data, '', 
      backgroundColor: Colors.orange,
    ));

    socketClient.io.onDisconnect((data) => this.onDisconnectOrExit());
  }

  List<PlayerDto>? getPlayers () {
    return this.lobby
      ?.Players
      .map((playerAtLobby) => playerAtLobby.Player)
      .toList();
  }

  void onLobbyUpdate (LobbyDto lobbyDto) {
    if (this.lobby == null) {
      Get.to(() => LobbyScreen());
    }

    this.lobby = lobbyDto;
    print(this.lobby);
    
    this.notifyListeners();
  }

  void exitLobby () {
    socketClient.io.emit('exit_room');
    onDisconnectOrExit();
  }

  void onDisconnectOrExit () {
    this.lobby = null;
    Get.to(() => MenuPage());

    this.notifyListeners();
  }

  void createLobby () {
    socketClient.io.emit('create_room');
  }

  void joinLobby (String code) {
    socketClient.io.emit('join_room', <String, dynamic>{
      'room_id': code
    });
  }
}