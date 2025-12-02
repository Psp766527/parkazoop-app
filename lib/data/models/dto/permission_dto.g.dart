// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionDto _$PermissionDtoFromJson(Map<String, dynamic> json) =>
    PermissionDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PermissionDtoToJson(PermissionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
