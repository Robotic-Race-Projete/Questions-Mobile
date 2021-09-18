import 'package:flutter/cupertino.dart';
import 'package:projete_app/dto/answerDto.dart';
import 'package:projete_app/dto/questionDto.dart';
import 'package:projete_app/screens/question/Answers.dart';

class QuestionInterface extends StatelessWidget {
  final QuestionDto question;
  final Function(AnswerDto) onAnswer;

  QuestionInterface({
    required this.question,
    required this.onAnswer
  });

  @override
  Widget build(BuildContext context) {
    var answers = question.answers;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(question.question,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 64)),
          ),
        ),
        Text(
          "Categoria: ${question.category}",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24
          ),
        ),
        AnswersWidget(answers: answers, onAnswer: onAnswer)
      ],
    );
  }
}
