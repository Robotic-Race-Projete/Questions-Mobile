import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LobbyCodeBox extends StatelessWidget {

  String lobbyId;
  LobbyCodeBox(this.lobbyId);

  @override
  Widget build(BuildContext context) {
    var textCode = Column(
      children: [
        Text(
          'Código da sala',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold, 
            // color: Colors.deepOrange
            color: Colors.green
          ),
        ),
        Text(
          '${lobbyId}',
          style: TextStyle(
            fontSize: 40, 
            fontWeight: FontWeight.bold, 
            color: Colors.green,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.5), 
                offset: Offset(0, 3),
                blurRadius: 2
              )
            ]
          ),
        )
      ],
    );

    return Container(
      child: Padding(padding: EdgeInsets.all(30), child: textCode),
      // color: Colors.lightGreen,
      color: Colors.greenAccent[100],
      width: double.infinity,
    );
  }

}