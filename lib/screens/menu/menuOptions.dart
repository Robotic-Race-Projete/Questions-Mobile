import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/models/lobby.dart';
import 'package:projete_app/models/navigation.dart';
import 'package:provider/provider.dart';

class MenuOptions extends StatelessWidget {
  double fontSize = 26;

  TextStyle textStyle = TextStyle(fontSize: 26, color: Colors.black);

  Widget createButton(onPress, text) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        text,
        style: textStyle,
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromHeight(50),
        primary: Colors.lightGreen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var lobbyModel = Provider.of<LobbyModel>(context);
    var onPress = () => lobbyModel.createLobby();

    return Padding(
      child: Column(
        children: [
          createButton(onPress, 'Criar jogo'),
          Padding(
            child: Text('Ou',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          // Text('Entrar em um jogo',
          //     style: textStyle, textAlign: TextAlign.center),
          TextField(
            style: textStyle,
            decoration: InputDecoration(
              hintText: "ex: Vfmdd3nX-T",
              labelText: 'Entrar em um jogo',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightGreen)
              ),
              alignLabelWithHint: true
            )
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
    );
  }
}