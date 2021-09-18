// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answerDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerDto _$AnswerDtoFromJson(Map<String, dynamic> json) {
  return AnswerDto(
    answer: json['answer'] as String,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$AnswerDtoToJson(AnswerDto instance) => <String, dynamic>{
      'answer': instance.answer,
      'id': instance.id,
    };
