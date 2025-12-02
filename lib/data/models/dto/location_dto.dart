import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

/// DTO for location information
@JsonSerializable()
class LocationDto {
  final double latitude;
  final double longitude;
  final String address;
  final String city;
  final String state;
  final String zipCode;

  LocationDto({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);
}
