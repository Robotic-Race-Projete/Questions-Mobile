import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projete_app/dto/playerAtLobbyDto.dart';
import 'package:projete_app/models/lobby.dart';
import 'package:projete_app/screens/lobby/codebox.dart';
import 'package:projete_app/screens/lobby/playerlist.dart';
import 'package:provider/provider.dart';

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
    var lobbyModel = Provider.of<LobbyModel>(context);

    List<PlayerAtLobbyDto> players = lobbyModel.lobby?.Players ?? [];
      
    return Scaffold(
      body: Column(
        children: [
          LobbyCodeBox(lobbyModel.lobby?.id ?? "Error"),
          PlayerListWidget(players: players),
          LobbyOptions(
            buttons: [
              MaterialButton(
                onPressed: () => lobbyModel.exitLobby(),
                child: Text('Sair', style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              MaterialButton(
                onPressed: () => lobbyModel.readyUp(), 
                child: Text(
                  lobbyModel.isReady ? 'Remover Pronto' : 'Pronto', 
                  style: TextStyle(color: Colors.white)
                ),
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