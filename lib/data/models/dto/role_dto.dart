import 'package:json_annotation/json_annotation.dart';

part 'role_dto.g.dart';

@JsonSerializable()
class RoleDto {
  final int id;
  final String name;
  final String description;
  final List<String> permissions;

  RoleDto({
    required this.id,
    required this.name,
    required this.description,
    required this.permissions,
  });

  factory RoleDto.fromJson(Map<String, dynamic> json) =>
      _$RoleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RoleDtoToJson(this);
}
