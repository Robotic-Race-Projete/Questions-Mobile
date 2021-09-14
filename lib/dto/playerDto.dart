import 'package:json_annotation/json_annotation.dart';

part 'playerDto.g.dart';

@JsonSerializable()
class PlayerDto {
  late String nickname;
  late String createdAt;

  PlayerDto({
    required this.nickname, 
    required this.createdAt
  });

  factory PlayerDto.fromJson(Map<String, dynamic> json) => _$PlayerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerDtoToJson(this);
}