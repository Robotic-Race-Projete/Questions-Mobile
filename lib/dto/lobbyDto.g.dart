// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lobbyDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LobbyDto _$LobbyDtoFromJson(Map<String, dynamic> json) {
  return LobbyDto(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    Players: (json['Players'] as List<dynamic>)
        .map((e) => PlayerAtLobbyDto.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LobbyDtoToJson(LobbyDto instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'Players': instance.Players,
    };
