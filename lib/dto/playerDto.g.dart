// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playerDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerDto _$PlayerDtoFromJson(Map<String, dynamic> json) {
  return PlayerDto(
    nickname: json['nickname'] as String,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$PlayerDtoToJson(PlayerDto instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'createdAt': instance.createdAt,
    };
