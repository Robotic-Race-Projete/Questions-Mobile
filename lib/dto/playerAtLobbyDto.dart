import 'package:json_annotation/json_annotation.dart';
import 'package:projete_app/dto/playerDto.dart';

part 'playerAtLobbyDto.g.dart';

@JsonSerializable()
class PlayerAtLobbyDto {
  late bool isReady;
  // ignore: non_constant_identifier_names
  late PlayerDto Player;

  PlayerAtLobbyDto({
    required this.isReady,
    // ignore: non_constant_identifier_names
    required this.Player
  });

  factory PlayerAtLobbyDto.fromJson(Map<String, dynamic> json) => _$PlayerAtLobbyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerAtLobbyDtoToJson(this);
}