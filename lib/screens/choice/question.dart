import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String text;

  Question(this.text);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 32);

    return Text(
      this.text,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}
