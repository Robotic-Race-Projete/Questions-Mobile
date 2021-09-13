import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Shadow shadow =
        Shadow(offset: Offset(4, 4), color: Colors.lightGreen.withOpacity(0.5));

    Widget title = Column(
      children: [
        Text(
          "Corrida",
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: 80, color: Colors.green, shadows: [shadow]),
        ),
        Text(
          "Robótica",
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: 50, color: Colors.green, shadows: [shadow]),
        )
      ],
    );

    return Container(
      child: title,
    );
  }
}
