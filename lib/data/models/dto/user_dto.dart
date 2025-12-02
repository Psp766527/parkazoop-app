import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final int id;
  final String username;
  final bool enabled;
  final List<int> roleIds;

  UserDto({
    required this.id,
    required this.username,
    required this.enabled,
    required this.roleIds,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
