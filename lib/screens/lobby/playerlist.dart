import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projete_app/dto/playerAtLobbyDto.dart';

class PlayerListWidget extends StatelessWidget {
  final List<PlayerAtLobbyDto> players;

  PlayerListWidget({required this.players});

  @override
  Widget build(BuildContext context) {
    var playerMapper = (PlayerAtLobbyDto player) => ListTile(
      leading: Icon(
        player.isReady ? Icons.check : Icons.unpublished,
        color: Colors.green
      ),
      title: Text(
        player.Player.nickname, 
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 34,
          color: Colors.black,
          fontFamily: 'RobotoMono',
          fontWeight: FontWeight.w300
        ),
      ),
    );

    var playersList = Column(
      children: [
        Padding(
          child: Text(
            'Jogadores', 
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.green
            ),
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.all(10)
        ),
        Flexible(
          child: ListView(
            children: players
              .map(playerMapper)
              .toList(),
          )
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );

    return Flexible(
      child: playersList
    );
    
  }
}