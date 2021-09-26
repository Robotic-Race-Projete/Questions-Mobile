import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/dto/answerDto.dart';
import 'package:projete_app/dto/questionDto.dart';
import 'package:projete_app/services/socketService.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class MatchModel extends ChangeNotifier {
  final SocketClient socketClient = GetIt.instance.get<SocketClient>();
  QuestionDto? question;
  bool isQuestionAnswered = false;

  MatchModel() {
    socketClient.io.on('question', (data) => onQuestionChange(
      QuestionDto.fromJson(data)
    ));
    socketClient.io.onDisconnect((data) => onDisconnect);
  }

  sendQuestion (QuestionDto question, AnswerDto answer) {
    socketClient.io.emit('answer', <String, dynamic>{
      'question_id': question.id,
      'answer_id': answer.id
    });
    this.isQuestionAnswered = true;

    this.notifyListeners();
  }

  onQuestionChange(QuestionDto question) {
    this.question = question;
    isQuestionAnswered = false;

    this.notifyListeners();
  }

  onDisconnect () {
    this.question = null;

    this.notifyListeners();
  }
}