import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/dto/lobbyDto.dart';
import 'package:projete_app/services/socket.dart';

import '../services/navigation.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class LobbyModel extends ChangeNotifier {

  bool isOnLobby = false;
  LobbyDto? lobby;

  final SocketClient socketClient = GetIt.instance.get<SocketClient>();
  final NavigationService navService = GetIt.instance.get<NavigationService>();

  LobbyModel() {
    socketClient.io.on(
      'session', 
      (data) => onLobbyUpdate(
        LobbyDto.fromJson(data)
      )
    );
    socketClient.io.onDisconnect((data) => navService.navigateTo('/'));
  }

  void onLobbyUpdate (LobbyDto lobbyDto) {
    this.lobby = lobbyDto;

    print(this.lobby);
    if (this.lobby != null) {
      var navService = GetIt.instance.get<NavigationService>();
      navService
        .navigateTo('/lobby')
        ?.catchError((err) => print(err));
    }
    
    this.notifyListeners();
  }

  void exitLobby () {
    socketClient.io.emit('exit_room');
    navService.navigateTo('/');
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