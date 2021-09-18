import 'package:json_annotation/json_annotation.dart';

part 'answerDto.g.dart';

@JsonSerializable()
class AnswerDto {
  String answer;
  int id;

  AnswerDto({
    required this.answer,
    required this.id
  });

  factory AnswerDto.fromJson(Map<String, dynamic> json) => _$AnswerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerDtoToJson(this);
}