import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projete_app/models/lobby.dart';
import 'package:provider/provider.dart';

class MenuOptions extends StatelessWidget {
  final double fontSize = 26;

  final TextStyle textStyle = TextStyle(fontSize: 26, color: Colors.black);

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
    var onCreate = () => lobbyModel.createLobby();
    var onJoin = (String code) => lobbyModel.joinLobby(code);

    return Padding(
      child: Column(
        children: [
          createButton(onCreate, 'Criar jogo'),
          Padding(
            child: Text('Ou',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          // Text('Entrar em um jogo',
          //     style: textStyle, textAlign: TextAlign.center),
          TextField(
            style: textStyle,
            onSubmitted: onJoin,
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
