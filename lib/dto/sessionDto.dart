import 'package:json_annotation/json_annotation.dart';

part 'sessionDto.g.dart';

@JsonSerializable()
class SessionDto {
  String nickname;
  String socketId;
  int id;
  // ignore: non_constant_identifier_names
  int? LobbyConnectionId;
  String createdAt;

  SessionDto({ 
    required this.nickname,
    required this.socketId,
    required this.id,
    // ignore: non_constant_identifier_names
    required this.LobbyConnectionId,
    required this.createdAt
  });

  factory SessionDto.fromJson(Map<String, dynamic> json) => _$SessionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SessionDtoToJson(this);
}