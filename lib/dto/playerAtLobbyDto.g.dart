// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playerAtLobbyDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerAtLobbyDto _$PlayerAtLobbyDtoFromJson(Map<String, dynamic> json) {
  return PlayerAtLobbyDto(
    isReady: json['isReady'] as bool,
    Player: PlayerDto.fromJson(json['Player'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlayerAtLobbyDtoToJson(PlayerAtLobbyDto instance) =>
    <String, dynamic>{
      'isReady': instance.isReady,
      'Player': instance.Player,
    };
