import 'package:json_annotation/json_annotation.dart';
import 'package:projete_app/dto/answerDto.dart';

part 'questionDto.g.dart';

@JsonSerializable()
class QuestionDto {
  int id;
  String question;
  String category;
  List<AnswerDto> answers;

  QuestionDto({
    required this.id,
    required this.question,
    required this.category,
    required this.answers
  });

  factory QuestionDto.fromJson(Map<String, dynamic> json) => _$QuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);
}