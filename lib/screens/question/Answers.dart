import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projete_app/dto/answerDto.dart';

class AnswersWidget extends StatelessWidget {
  final List<AnswerDto> answers;
  final Function(AnswerDto) onAnswer;

  AnswersWidget({
    required this.answers,
    required this.onAnswer
  });

  @override
  Widget build(BuildContext context) {
    var mappingAnswer = (AnswerDto answer) => Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 8),
        onPressed: () => onAnswer(answer),
        child: Text(
          answer.answer,
          style: TextStyle(
            fontSize: 48
          ),
        ),
        color: Colors.green,
      )
    );

    var rows = answers
        .map(mappingAnswer)
        .toList();

    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      )
    );
  }
}