import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinLobbyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String code = "ACBDEFGHJK";

    return Scaffold(
      body: Column(
        children: [
          Text('O código da sua sala é $code')
        ],
      ),
    );
  }

}