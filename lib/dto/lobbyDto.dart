import 'package:json_annotation/json_annotation.dart';
import 'package:projete_app/dto/playerAtLobbyDto.dart';

part 'lobbyDto.g.dart';

@JsonSerializable()
class LobbyDto {
  String id;
  String createdAt;
  // ignore: non_constant_identifier_names
  List<PlayerAtLobbyDto> Players;

  LobbyDto({
    required this.id, 
    required this.createdAt, 
    // ignore: non_constant_identifier_names
    required this.Players
  });

  factory LobbyDto.fromJson(Map<String, dynamic> json) => _$LobbyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LobbyDtoToJson(this);
}