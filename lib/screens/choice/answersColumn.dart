import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Button Text style
final textStyle = TextStyle(
  fontSize: 24,
);

// Button Style
final buttonStyle = ButtonStyle(
    textStyle: MaterialStateProperty.resolveWith((states) => textStyle),
    minimumSize: MaterialStateProperty.resolveWith(
        (states) => Size(double.infinity, 50)),
    alignment: Alignment.center,
    padding: MaterialStateProperty.resolveWith(
        (states) => EdgeInsets.symmetric(vertical: 10, horizontal: 0)));

Widget createButton(String text, void Function() onClick) {
  return TextButton(
      style: buttonStyle,
      onPressed: onClick,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ));
}

class QuestionColumn extends StatefulWidget {
  QuestionColumn({Key? key, required this.answers}) : super(key: key);

  final List<String> answers;

  @override
  State<StatefulWidget> createState() => _QuestionColumnState();
}

class _QuestionColumnState extends State<QuestionColumn> {
  int selectedString = 0;

  void _onClick(int hashCode) {
    this.setState(() {
      selectedString = hashCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: this
              .widget
              .answers
              .map((answer) =>
                  createButton(answer, () => _onClick(answer.hashCode)))
              .toList(),
          // [
          // 	TextButton(style: buttonStyle, onPressed: () {}, child: Text('Junior não tem nenhuma beith, slc')),
          // 	TextButton(style: buttonStyle, onPressed: () {}, child: Text('2')),
          // 	TextButton(style: buttonStyle, onPressed: () {}, child: Text('3')),
          // 	TextButton(style: buttonStyle, onPressed: () {}, child: Text('4'))
          // ]
        ));
  }
}
