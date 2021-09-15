// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessionDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionDto _$SessionDtoFromJson(Map<String, dynamic> json) {
  return SessionDto(
    nickname: json['nickname'] as String,
    socketId: json['socketId'] as String,
    id: json['id'] as int,
    LobbyConnectionId: json['LobbyConnectionId'] as int?,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$SessionDtoToJson(SessionDto instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'socketId': instance.socketId,
      'id': instance.id,
      'LobbyConnectionId': instance.LobbyConnectionId,
      'createdAt': instance.createdAt,
    };
