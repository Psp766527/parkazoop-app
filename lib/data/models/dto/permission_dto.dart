import 'package:json_annotation/json_annotation.dart';

part 'permission_dto.g.dart';

@JsonSerializable()
class PermissionDto {
  final int id;
  final String name;
  final String description;

  PermissionDto({
    required this.id,
    required this.name,
    required this.description,
  });

  factory PermissionDto.fromJson(Map<String, dynamic> json) =>
      _$PermissionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionDtoToJson(this);
}
