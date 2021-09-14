import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/dto/playerDto.dart';
import 'package:projete_app/models/lobby.dart';
import 'package:projete_app/screens/lobby/codebox.dart';
import 'package:projete_app/screens/lobby/playerlist.dart';

import 'lobby/LobbyOptions.dart';

class LobbyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LobbyScreenState();
  }
}

class _LobbyScreenState extends State<LobbyScreen> {
  @override
  Widget build(BuildContext context) {
    var lobbyModel = GetIt.instance.get<LobbyModel>();

    List<PlayerDto> players = lobbyModel
      .lobby!
      .Players
      .map((playerAtLobby) => playerAtLobby.Player)
      .toList();

    return Scaffold(
      body: Column(
        children: [
          LobbyCodeBox(lobbyModel.lobby!.id),
          PlayerListWidget(players: players),
          LobbyOptions(
            buttons: [
              MaterialButton(
                onPressed: () => lobbyModel.exitLobby(),
                child: Text('Sair', style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              MaterialButton(
                onPressed: () {}, 
                child: Text('Pronto', style: TextStyle(color: Colors.white)),
                color: Colors.green
              )
            ]
          )
        ]
      ),
      backgroundColor: Colors.greenAccent[100]
    );
  }
}