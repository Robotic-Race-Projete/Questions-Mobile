import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/dto/lobbyDto.dart';
import 'package:projete_app/dto/playerAtLobbyDto.dart';
import 'package:projete_app/screens/lobby.dart';
import 'package:projete_app/screens/menu.dart';
import 'package:projete_app/screens/question.dart';
import 'package:projete_app/services/socketService.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class LobbyModel extends ChangeNotifier {

  bool isOnLobby = false;
  bool isReady = false;
  LobbyDto? lobby;

  final SocketClient socketClient = GetIt.instance.get<SocketClient>();

  LobbyModel() {
    socketClient.io.on(
      'lobby', 
      (data) => onLobbyUpdate(
        LobbyDto.fromJson(data)
      )
    );
    socketClient.io.on(
      'status_at_lobby', 
      (data) => onPlayerLobbyStatusChanged(
        PlayerAtLobbyDto.fromJson(data)
      )
    );

    socketClient.io.onDisconnect((data) => this.onDisconnectOrExit());
  }

  List<PlayerAtLobbyDto>? getPlayers () {
    return this.lobby
      ?.Players
      .map((playerAtLobby) => playerAtLobby)
      .toList();
  }

  void onLobbyUpdate (LobbyDto lobbyDto) {
    if (this.lobby == null) {
      Get.to(() => LobbyScreen());
    }

    print(lobbyDto);

    this.lobby = lobbyDto;
    print(this.lobby);

    if (lobbyDto.isOnMatch) {
      onLobbyStartedMatch();
    }
    
    this.notifyListeners();
  }

  void exitLobby () {
    socketClient.io.emit('exit_room');
    onDisconnectOrExit();
  }

  void onDisconnectOrExit () {
    this.lobby = null;
    this.isReady = false;
    this.isOnLobby = false;

    Get.to(() => MenuPage());

    this.notifyListeners();
  }

  void onPlayerLobbyStatusChanged (PlayerAtLobbyDto status) {
    this.isReady = status.isReady;
  }

  void onLobbyStartedMatch () {
    Get.to(() => QuestionScreen());
  }

  void createLobby () {
    socketClient.io.emit('create_room');
  }

  void joinLobby (String code) {
    socketClient.io.emit('join_room', <String, dynamic>{
      'room_id': code
    });
  }

  void readyUp () {
    socketClient.io.emit('ready_up', <String, dynamic>{
      'value': !this.isReady
    });
  }
}