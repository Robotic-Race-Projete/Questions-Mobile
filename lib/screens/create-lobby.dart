import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateLobbyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Digite o código do lobby abaixo', style: TextStyle(),),
          TextField()
        ],
      ),
    );
  }
}