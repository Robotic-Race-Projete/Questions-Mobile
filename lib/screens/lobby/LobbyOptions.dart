import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LobbyOptions extends StatelessWidget {

  final List<MaterialButton> buttons;
  LobbyOptions({
    required this.buttons
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: this.buttons
        .map(
          (button) {
            return Expanded(
              child: Padding(
                child: button,
                padding: EdgeInsets.symmetric(horizontal: 10)
              )
            );
          }
        )
        .toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
