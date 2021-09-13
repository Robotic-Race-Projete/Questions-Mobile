import 'package:flutter/material.dart';

import 'choice/answersColumn.dart';
import 'choice/question.dart';

class ChoicePage extends StatelessWidget {
  final answers = ['Batata', 'Arroz', 'Feijão', 'Morango'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Escolha uma resposta'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Question('Qual dessas opções possui uma fruta?'),
            QuestionColumn(answers: answers)
          ],
        ));
  }
}
