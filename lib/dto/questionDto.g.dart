// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDto _$QuestionDtoFromJson(Map<String, dynamic> json) {
  return QuestionDto(
    id: json['id'] as int,
    question: json['question'] as String,
    category: json['category'] as String,
    answers: (json['answers'] as List<dynamic>)
        .map((e) => AnswerDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuestionDtoToJson(QuestionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'category': instance.category,
      'answers': instance.answers,
    };
