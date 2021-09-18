import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projete_app/dto/answerDto.dart';
import 'package:projete_app/models/match.model.dart';
import 'package:projete_app/screens/question/Answers.dart';
import 'package:projete_app/screens/question/QuestionInterface.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var matchModel = Provider.of<MatchModel>(context);
    var question = matchModel.question;

    if (question != null) {

      void onAnswer (AnswerDto answer) {
        matchModel.sendQuestion(question, answer);
      }

      var body = matchModel.isQuestionAnswered
        ? Container(
          alignment: Alignment.center,
          child: Text(
            'Espere chegar a próxima pergunta :)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 64
            ),
          ),
        )
        : QuestionInterface(question: question, onAnswer: onAnswer);

      return Scaffold(backgroundColor: Colors.green[100], body: body);

    } else {

      return Scaffold(
        body: Text('error'),
      );

    }

  }
}
