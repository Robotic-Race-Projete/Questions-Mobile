import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/dto/lobbyDto.dart';
import 'package:projete_app/models/socket.dart';

import 'navigation.dart';

class LobbyModel extends ChangeNotifier {

  LobbyDto? lobby;
  late SocketClient socketClient;
  late NavigationService navService;

  LobbyModel() {
    socketClient = GetIt.instance.get<SocketClient>();
    socketClient.io.on(
      'session', 
      (data) => onLobbyUpdate(
        LobbyDto.fromJson(data)
      )
    );

    navService = GetIt.instance.get<NavigationService>();
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
    var navService = GetIt.instance.get<NavigationService>();
    navService.navigateTo('/');
  }

  void createLobby () {
    socketClient.io.emit('create_room');
  }

  void joinLobby () {
    
  }
}